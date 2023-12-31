package model.articleComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.pay.PayDao;
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
	
	
	// 댓글 생성
	// 매개변수 ArticleCommentRequestDto -> 유저아이디, moonNum, 댓글
	public boolean createComment(ArticleCommentRequestDto commentdto) {
		
		boolean check = false;
		
		String commentNum = PayDao.generateRandomCode(); // 랜덤생성
		while(dupleCheckCommentNum(commentNum)) {
			commentNum = PayDao.generateRandomCode();
		}
		System.out.println("commentNum : "+commentNum); // 확인용
		
		this.conn = DBManager.getConnection();
		if (this.conn != null) {
			String userId = commentdto.getUserId();
			String content = commentdto.getCommentContent();
			String moonNum = commentdto.getMoonNum();
			int like = 0;

			if (userId != null && content != null) {
				String sql = "INSERT INTO articleComment(comment_num,user_id,moon_num,comment_content,`like`) VALUES (?,?,?,?,?)";
				try {
					this.pstmt = this.conn.prepareStatement(sql);
					this.pstmt.setString(1, commentNum);
					this.pstmt.setString(2, userId);
					this.pstmt.setString(3, moonNum);
					this.pstmt.setString(4, content);
					this.pstmt.setInt(5, like);
					this.pstmt.execute();
					check = true;
				} catch (Exception e) {
					e.printStackTrace();
					
				} finally {
					DBManager.close(this.conn, this.pstmt);
				}

			}

		}

		return check;
		
	}
	
	// commentNum 중복 검사
	public boolean dupleCheckCommentNum(String commentNum) {
		boolean duple=false;
		
		this.conn = DBManager.getConnection();
		if (this.conn != null) {
			String sql = "SELECT comment_num FROM articleComment WHERE comment_num=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, commentNum);
				this.rs = this.pstmt.executeQuery();
				if(this.rs.next()) {
					duple=true;
				}

			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		return duple;
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
					String userName = userDao.findUserNameById(userId); // 유저 아이디를 매개변수로 받아서 해당 아이디를 가진 유저의 이름을 return
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
	
	// user_id로 comment 모두 찾기
	public List<ArticleCommentRequestDto> getUserCommentById(String id){
		List<ArticleCommentRequestDto> commentList = new ArrayList<ArticleCommentRequestDto>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			// 시간 기준으로 오름차순 정렬
			String sql="SELECT * FROM articleComment WHERE user_id=? ORDER BY comment_createdAt ASC";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.rs=this.pstmt.executeQuery();
				while(this.rs.next()) {
					String commentNum = this.rs.getString(1);
					String userId = this.rs.getString(2);
					String moonNum = this.rs.getString(3);
					String content = this.rs.getString(4);
					Timestamp created = this.rs.getTimestamp(5);
					Timestamp modified = this.rs.getTimestamp(6);
					int like = this.rs.getInt(7);
					ArticleCommentRequestDto comment = new ArticleCommentRequestDto(commentNum, userId, moonNum, content, created, modified, like);
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
