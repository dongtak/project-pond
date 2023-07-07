package model.articleComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import model.user.UserRequestDto;
import util.DBManager;

public class ArticleCommentDao {

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

		String SQL = "SELECT id FROM Article ORDER BY id DESC";
		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String lastId = rs.getString(1);
				int nextId = Integer.parseInt(lastId) + 1;

				return nextId;

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
				e.printStackTrace(); // 또는 적절한 오류 처리를 수행해주세요.
			}
		}

	}
}

//	public int write(String content, String userId,String  ) {
//		String SQL = "INSERT INTO articlecomment VALUE(?,?,?,?,?,?)"
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//		
//			pstmt.setInt(1,getNext());
//			pstmt.setString(2,getuserId());
//			pstmt.setString(3,getuserId());
//		}
//	}
//		

//	public static List<ArticleComment> getComments() {
//		List<ArticleComment> comments = new ArrayList<>();
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			conn = DBManager.getConnection();
//			String sql = "SELECT * FROM ArticleComment";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				int id = rs.getInt("id");
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
