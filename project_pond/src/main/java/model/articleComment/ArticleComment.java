package model.articleComment;

import java.sql.Timestamp;

public class ArticleComment {

	private int id;
	private String articleId;
	private String userId;
	private String content;
	private Timestamp createdAt;
	private Timestamp modifiedAt;

}
