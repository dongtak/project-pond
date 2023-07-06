package model.articleComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;

public class ArticleCommentDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	private ArticleCommentDao() {}
		
	private static ArticleCommentDao instance= new ArticleCommentDao();

	public static ArticleCommentDao getInstance() {

		
		return instance;
	}
	
	
	
	public void updateArticleComment(ArticleCommentRequestDto articleDto, String content) {

		this.conn = DBManager.getConnection();
		
		if(this.conn!= null && articleDto.getContent()!=null && articleDto.getUserId()!=null) {
			if(articleDto.getContent() !="") {
				String sql = "UPDATE articlecomment SET content=? WHERE id=?";
				
				try {
					this.pstmt = this.conn.prepareStatement(sql);
					this.pstmt.setString(1,articleDto.getContent());
					this.pstmt.setString(2,articleDto.getUserId());
					
					this.pstmt.execute();
					
					
				}catch(Exception e) {
					e.printStackTrace();
					
				}finally {
					DBManager.close(this.conn, this.pstmt);
				}
				
				
				
			}
			
			
		}
		}
		
		
	}
	
	
	
	
	

