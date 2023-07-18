package model.article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;

public class ArticleDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private ArticleDao() {}
	private static ArticleDao instance = new ArticleDao();
	public static ArticleDao getInstance() {
		return instance;
	}
	
	
	// create
	
	// read
	public ArticleRequestDto getArticleByNum(String moonNum) {
		ArticleRequestDto article = null;
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql = "SELECT * FROM article WHERE moon_num=?";
			try {
				this.pstmt=this.conn.prepareStatement(sql);
				this.pstmt.setString(1, moonNum);
				this.rs = this.pstmt.executeQuery();
				if(rs.next()) {
					String admin = this.rs.getString(2);
					String title = this.rs.getString(3);
					String content = this.rs.getString(4);
					Timestamp create = this.rs.getTimestamp(5);
					article = new ArticleRequestDto(moonNum,admin,title,content,create);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return article;
	}
	
	public List<Article> showAll(){
		List<Article> list = new ArrayList<Article>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql = "SELECT * FROM article";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();
				while(this.rs.next()) {
					String num = this.rs.getString(1);
					String admin = this.rs.getString(2);
					String title = this.rs.getString(3);
					String content = this.rs.getString(4);
					Timestamp create = this.rs.getTimestamp(5);
					Article article = new Article(num,admin,title,content,create);
					list.add(article);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		return list;
	}

	
	
	/*페이징 처리 */
	
	public List<ArticleRequestDto> getArticleList(int startRow, int pageSize) {
		List<ArticleRequestDto> list = new ArrayList<ArticleRequestDto>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			/*
			 select * from article where moon_num in (
			 select moon_num from fullmoon where moon_status=0
			 ) order by article_createAt desc;
			*/
			String sql="SELECT * FROM article WHERE moon_num IN ( SELECT moon_num FROM fullmoon WHERE moon_status=0 ) ORDER BY moon_num DESC LIMIT ?,?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, startRow-1); // 시작행-1
				this.pstmt.setInt(2, pageSize); // 페이지 크기
				this.rs = this.pstmt.executeQuery();
				while(this.rs.next()) {
					ArticleRequestDto articleDto = new ArticleRequestDto();
					articleDto.setMoon_num(this.rs.getString(1));
					articleDto.setAdmin_id(this.rs.getString(2));
					articleDto.setArticle_title(this.rs.getString(3));
					articleDto.setArticle_content(this.rs.getString(4));
					articleDto.setArticle_createdAt(this.rs.getTimestamp(5));
					list.add(articleDto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
			
		}
		
		return list;
	}

	public int getCount() {
		int count=0;
		
		this.conn = DBManager.getConnection();
		if(this.conn!=null) {
			String sql = "SELECT * FROM article";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();
				while(this.rs.next()) {
					count++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		return count;
	}
	
	
	

	

}
