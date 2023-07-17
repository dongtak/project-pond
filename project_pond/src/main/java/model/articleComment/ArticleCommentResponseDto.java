package model.articleComment;

import java.sql.Timestamp;

public class ArticleCommentResponseDto {
	private String commentNum;
	private String userId;
	private String moonNum;
	private String commentContent;
	private Timestamp commentCreatedAt;
	private Timestamp commentModifiedAt;
	private int like;
	
	public ArticleCommentResponseDto(String commentNum, String userId, String moonNum, String commentContent,
			Timestamp commentCreatedAt, Timestamp commentModifiedAt, int like) {
		super();
		this.commentNum = commentNum;
		this.userId = userId;
		this.moonNum = moonNum;
		this.commentContent = commentContent;
		this.commentCreatedAt = commentCreatedAt;
		this.commentModifiedAt = commentModifiedAt;
		this.like = like;
	}
	public ArticleCommentResponseDto(String commentNum, String userId, String moonNum, String commentContent,
			int like) {
		super();
		this.commentNum = commentNum;
		this.userId = userId;
		this.moonNum = moonNum;
		this.commentContent = commentContent;
		this.like = like;
	}
	public String getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(String commentNum) {
		this.commentNum = commentNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMoonNum() {
		return moonNum;
	}
	public void setMoonNum(String moonNum) {
		this.moonNum = moonNum;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getCommentCreatedAt() {
		return commentCreatedAt;
	}
	public void setCommentCreatedAt(Timestamp commentCreatedAt) {
		this.commentCreatedAt = commentCreatedAt;
	}
	public Timestamp getCommentModifiedAt() {
		return commentModifiedAt;
	}
	public void setCommentModifiedAt(Timestamp commentModifiedAt) {
		this.commentModifiedAt = commentModifiedAt;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	
	
}
