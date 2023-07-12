package model.articleComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.user.UserDao;
import util.DBManager;



public class ArticleCommentDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;


	// private ArrayList<User> list; ->
	// Database 연동하여 데이터 관리하기
	// Dao는 싱글톤으로 구현하기

	private ArticleCommentDao() {
	}

	private static ArticleCommentDao instance = new ArticleCommentDao();

	public static ArticleCommentDao getInstance() {
		return instance;
	}
	
	
	public boolean createComment(ArticleCommentRequestDto commentdto) {
		
		String userId = commentdto.getUserId();
		
		String content = commentdto.getCommentContent();
		String articleId = "abc126";
		
		System.out.print(userId + "= dao");
		System.out.print(content + "= dao");
		
		boolean check = true;
		
		if( userId !=null && content!=null) {
			this.conn = DBManager.getConnection();
			if(this.conn !=null) {
				String sql = "INSERT INTO articleComment(articleId,userId,content) VALUES (?,?,?)";
				
				try {
					this.pstmt = this.conn.prepareStatement(sql);
					this.pstmt.setString(1, articleId);
					this.pstmt.setString(2, userId);
					this.pstmt.setString(3, content);
					
				
					
					this.pstmt.execute();
					
				}catch(Exception e) {
					e.printStackTrace();
					check = false;
				}finally {
					DBManager.close(this.conn, this.pstmt);
				}
				
			}
			
			
		}else {
			check = false;
		}
		
		return check;
		
	}

	
	// moon_num 으로 comment 모두 찾기
	public List<ArticleCommentRequestDto> getCommentByNum(String num){
		List<ArticleCommentRequestDto> commentList = new ArrayList<ArticleCommentRequestDto>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			// 시간 기준으로 오름차순 정렬
			String sql="SELECT * FROM articleComment WHERE moon_num=? ORDER BY comment_createdAt ASC";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, num);
				this.rs=this.pstmt.executeQuery();
				UserDao userDao = UserDao.getInstance();
				while(this.rs.next()) {
					String commentNum = this.rs.getString(1);
					String userId = this.rs.getString(2);
					String content = this.rs.getString(4);
					Timestamp created = this.rs.getTimestamp(5);
					Timestamp modified = this.rs.getTimestamp(6);
					int like = this.rs.getInt(7);
					ArticleCommentRequestDto comment = new ArticleCommentRequestDto(commentNum, userId, num, content, created, modified, like);
					String userName = userDao.findUserNameById(userId);
					comment.setUserName(userName);
					commentList.add(comment);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		return commentList;
	}
	
	
}
