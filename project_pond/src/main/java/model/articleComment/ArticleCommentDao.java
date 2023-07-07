package model.articleComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.user.UserDao;
import model.user.UserRequestDto;
import util.DBManager;

public class ArticleCommentDao {
	
	
	private ArticleCommentDao() {
	}

	private static ArticleCommentDao instance = new ArticleCommentDao();

	public static ArticleCommentDao getInstance() {
		return instance;
	}

	
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public String getDate() { // getdate 현재 위치 복구

		try {
			conn = DBManager.getConnection();
			String SQL = "SELECT NOW()";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBManager.close(conn, pstmt, rs);
		}
		return "";

	}

	public int getNext() {

		String SQL = "SELECT id FROM articleComment ORDER BY id DESC";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				return rs.getInt(1)+1;

			}
			return 1; // 첫번째 게시물
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace(); 
			}
		}

	}


	public int write(int id, String userId, String content,Timestamp createdAt) {
		String SQL = "INSERT INTO articleComment VALUES(?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,getNext());
			pstmt.setString(2,userId);
			pstmt.setString(3,content);
			pstmt.setTimestamp(4,createdAt);
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//db오류시!
	}


	
	
	
	
	
	

//
//	public static List<ArticleComment> getCommentsAll() {
//	List<ArticleComment> comments = new ArrayList<>();
//		this.conn = DBManager.getConnection();
//	
//		try {
//			this.pstmt = this.conn.prepateStatement(sql);
//			this.rs = this.pstmt.executeQuery();
//	
//
////			String sql = "SELECT * FROM ArticleComment";
////			pstmt = conn.prepareStatement(sql);
////			rs = pstmt.executeQuery();
//
//		while (this.rs.next()) {
//				int id = this.rs.getInt("id");
//				String articleId = rs.getString("article_id");
//				String userId = rs.getString("user_id");
//				String content = rs.getString("content");
//				Timestamp createdAt = rs.getTimestamp("createdAt");
//				Timestamp modifiedAt = rs.getTimestamp("modifiedAt");
//
//				ArticleComment comment = new ArticleComment(id, articleId, userId, content, createdAt, modifiedAt);
//				comments.add(comment);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//
//		return comments;
//
//	}

// }

//	public void updatecomment(int id, String articleId, String content) {
//		this.conn = DBManager.getConnection();
//
//		if (this.conn != null && ArticleCommentRequestDto.getId() != null
//				&& ArticleCommentRequestDto.getUserId() != null && ArticleCommentRequestDto.getContent() != null) {
//			if (ArticleCommentRequestDto.getId() != "") {
//				String sql = "UPDATE ArticleComment SET userId=?, content=? WHERE id=?";
//
//				try {
//					this.pstmt = this.conn.prepareStatement(sql);
//					this.pstmt.setString(1, ArticleCommentRequestDto.getId());
//					this.pstmt.setString(2, ArticleCommentRequestDto.getUserId());
//					this.pstmt.setString(3, ArticleCommentRequestDto.getContent());
//
//					this.pstmt.executeUpdate();
//
//				} catch (Exception e) {
//					e.printStackTrace();
//				} finally {
//					DBManager.close(this.conn, this.pstmt);
//				}
//			}
//		}
//	}
//}
	
	
	// LeaveCommentFormAction 입력 후 작성
	public ArticleComment getUserById(int id) {
		ArticleComment comment = null;
		
		conn = DBManager.getConnection();
		
		if(this.conn !=null) {
			String sql = "SELECT * FROM articleComment WHERE id=?";
			
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, id);
				
				this.rs = this.pstmt.executeQuery();
				
				
				if(this.rs.next()) {
					
					
					String articleId = this.rs.getString(2);
					String userId = this.rs.getString(3);
					String content = this.rs.getString(4);
					Timestamp createdAt = this.rs.getTimestamp(5);
					Timestamp modifiedAt = this.rs.getTimestamp(5);
				
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
			
			
		}
		
		return comment;
		
		
	}
	
	
	
}
