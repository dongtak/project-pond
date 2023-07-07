package model.articleComment;

import java.sql.Timestamp;

public class ArticleComment {

	private int id;
	private String articleId;
	private String userId;
	private String content;
	private Timestamp createdAt;
	private Timestamp modifiedAt;
	
	
	
	//write 설정시 추가
	
	public ArticleComment(int id,  String userId, String content, Timestamp createdAt) {
		
		this.id = id;
		this.userId = userId;
		this.content = content;
		this.createdAt = createdAt;
	}

	
	
	
	public ArticleComment(int id, String articleId, String userId, String content, Timestamp createdAt,
			Timestamp modifiedAt) {
	
		this.id = id;
		this.articleId = articleId;
		this.userId = userId;
		this.content = content;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
	}


	public int getId() {
		return id;
	}


	public String getArticleId() {
		return articleId;
	}


	public String getUserId() {
		return userId;
	}


	public String getContent() {
		return content;
	}


	public Timestamp getCreatedAt() {
		return createdAt;
	}


	public Timestamp getModifiedAt() {
		return modifiedAt;
	}
	
	
	
	
	
	

}
