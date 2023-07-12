package model.articleComment;

import java.sql.Timestamp;

public class ArticleComment {

	private String commentNum;
	private String userId;
	private String moonNum;
	private String commentContent;
	private Timestamp commentCreatedAt;
	private Timestamp commentModifiedAt;
	private int like;
	
	public ArticleComment(String commentNum, String userId, String moonNum, String commentContent,
			Timestamp commentCreatedAt, Timestamp commentModifiedAt, int like) {
		this.commentNum = commentNum;
		this.userId = userId;
		this.moonNum = moonNum;
		this.commentContent = commentContent;
		this.commentCreatedAt = commentCreatedAt;
		this.commentModifiedAt = commentModifiedAt;
		this.like = like;
	}

	public ArticleComment(String commentNum, String userId, String moonNum, String commentContent) {
		this.commentNum = commentNum;
		this.userId = userId;
		this.moonNum = moonNum;
		this.commentContent = commentContent;
	}

	public String getCommentNum() {
		return commentNum;
	}

	public String getUserId() {
		return userId;
	}

	public String getMoonNum() {
		return moonNum;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public Timestamp getCommentCreatedAt() {
		return commentCreatedAt;
	}

	public Timestamp getCommentModifiedAt() {
		return commentModifiedAt;
	}

	public int getLike() {
		return like;
	}
	
	

}
