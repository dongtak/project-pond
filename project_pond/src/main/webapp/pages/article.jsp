<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보름달</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div id="section">
			<div class="article">
				<c:set var="title" value="${requestScope.article.getArticle_title() }"/>
				제목 : ${title }<br/>
				<c:set var="content" value="${requestScope.article.getArticle_content() }"/>
				내용 : ${content }<br/>
				<c:set var="createdAt" value="${requestScope.article.getArticle_createdAt() }"/>
				<fmt:formatDate value="${createdAt }" pattern="yyyy-MM-dd" var="created"/>
				시작 날짜 : ${created}<br/>
			</div>
			<div class="comment">
				<c:if test="${not empty requestScope.commentList }">
				리스트 확인 -> ${requestScope.commentList }<br/>
				유저 : ${requestScope.commentList.get(0).getUserName()}<br/>
				댓글 : ${requestScope.commentList.get(0).getCommentContent() }<br/>
				작성일 : ${requestScope.commentList.get(0).getCommentCreatedAt() }<br/>
				</c:if>
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>