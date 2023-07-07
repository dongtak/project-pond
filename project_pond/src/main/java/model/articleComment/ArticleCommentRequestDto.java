package model.articleComment;

import java.sql.Timestamp;

public class ArticleCommentRequestDto {
	
	private int id;
	private String articleId;
	private String userId;
	private String content;
	private Timestamp createdAt;
	private Timestamp modifiedAt;
	
	
	
	
	public ArticleCommentRequestDto(String userId, String content) {
		this.userId = userId;
		this.content = content;
	}
	
	
	
	
	public ArticleCommentRequestDto(int id, String articleId, String userId, String content, Timestamp createdAt,
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



	public void setId(int id) {
		this.id = id;
	}



	public String getArticleId() {
		return articleId;
	}



	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Timestamp getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}



	public Timestamp getModifiedAt() {
		return modifiedAt;
	}



	public void setModifiedAt(Timestamp modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	
	
	
	
	
	
	
	
	
	
	

}
