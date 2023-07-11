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
	public ArticleDao getInstance() {
		return instance;
	}
	
	/*
	private String moon_num;
	private String admin_id;
	private String article_title;
	private String article_content;
	private Timestamp article_createdAt;
	private Timestamp atricle_modifiedAt;
	*/
	
	
	// create
	
	
	
	// read
	public List<Article> showAll(){
		List<Article> list = new ArrayList<Article>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql = "SELECT * FROM article";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.rs = pstmt.executeQuery();
				while(this.rs.next()) {
					
					this.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return list;
	}
	

}
