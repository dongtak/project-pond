package model.article;

import java.sql.Timestamp;

public class ArticleRequestDto {
	
	private String id;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Timestamp modifiedAt;
	private String adminId;
	
	
	
	public ArticleRequestDto(String id, String title, String content, Timestamp createdAt, Timestamp modifiedAt,
			String adminId) {
		
		this.id = id;
		this.title = title;
		this.content = content;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
		this.adminId = adminId;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
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



	public String getAdminId() {
		return adminId;
	}



	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	
	
	
	
	
	
	
	
	
	

}
