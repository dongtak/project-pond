package model.article;

import java.sql.Timestamp;

public class Article {
	private String moon_num;
	private String admin_id;
	private String article_title;
	private String article_content;
	private Timestamp article_createdAt;
	
	public Article(String moon_num, String admin_id, String article_title, String article_content,
			Timestamp article_createdAt) {
		this.moon_num = moon_num;
		this.admin_id = admin_id;
		this.article_title = article_title;
		this.article_content = article_content;
		this.article_createdAt = article_createdAt;
	}

	public Article(String moon_num, String admin_id, String article_title, String article_content) {
		super();
		this.moon_num = moon_num;
		this.admin_id = admin_id;
		this.article_title = article_title;
		this.article_content = article_content;
	}

	public String getMoon_num() {
		return moon_num;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public String getArticle_title() {
		return article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public Timestamp getArticle_createdAt() {
		return article_createdAt;
	}


}
