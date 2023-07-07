package model.articleComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

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
		String content = commentdto.getContent();
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
	
	
	
	

}
