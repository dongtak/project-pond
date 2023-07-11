package model.article;

import java.sql.Timestamp;

public class ArticleRequestDto {
	private String moon_num;
	private String admin_id;
	private String article_title;
	private String article_content;
	private Timestamp article_createdAt;
	private Timestamp atricle_modifiedAt;
	
	public ArticleRequestDto(String moon_num, String admin_id, String article_title, String article_content,
			Timestamp article_createdAt, Timestamp atricle_modifiedAt) {
		super();
		this.moon_num = moon_num;
		this.admin_id = admin_id;
		this.article_title = article_title;
		this.article_content = article_content;
		this.article_createdAt = article_createdAt;
		this.atricle_modifiedAt = atricle_modifiedAt;
	}
	
	public ArticleRequestDto(String moon_num, String admin_id, String article_title, String article_content) {
		super();
		this.moon_num = moon_num;
		this.admin_id = admin_id;
		this.article_title = article_title;
		this.article_content = article_content;
	}
	
	public String getMoon_num() {
		return moon_num;
	}
	public void setMoon_num(String moon_num) {
		this.moon_num = moon_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public Timestamp getArticle_createdAt() {
		return article_createdAt;
	}
	public void setArticle_createdAt(Timestamp article_createdAt) {
		this.article_createdAt = article_createdAt;
	}
	public Timestamp getAtricle_modifiedAt() {
		return atricle_modifiedAt;
	}
	public void setAtricle_modifiedAt(Timestamp atricle_modifiedAt) {
		this.atricle_modifiedAt = atricle_modifiedAt;
	}
	
}