package model.article;

import java.sql.Timestamp;

public class Article {
	private String id;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Timestamp modifiedAt;
	private String adminId;

	public Article(String id, String title, String content, Timestamp createdAt, Timestamp modifiedAt, String adminId) {

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

	public String getTitle() {
		return title;
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

	public String getAdminId() {
		return adminId;
	}

}
