<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="stylesheet" href="resources/style/articledetail.css">

<title>히스토리</title>

</head>
<body>
	<c:set var="article" value="${requestScope.article }" />
	<c:set var="fullmoon" value="${requestScope.fullmoon }" />
	<c:set var="commentList" value="${requestScope.commentList }"/>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div id="section">
			<div class=article-container>
				<div class="article-cotainer-top">
					<div class="article-content">
						<div class="article">

							<c:set var="moonNum" value="${article.getMoon_num() }" />
							회차 : <span id="moonNum">${moonNum }</span><br>

							<c:set var="createdAt" value="${article.getArticle_createdAt() }" />
							<fmt:formatDate value="${createdAt }" pattern="yyyy-MM-dd"
								var="created" />
							시작 날짜 : ${created}~ 종료 날짜<br />


							<c:set var="title" value="${article.getArticle_title() }" />
							제목 : ${title }<br />
							<c:set var="content" value="${article.getArticle_content() }" />
							내용 : ${content }<br />


							<c:set var="fullmoon" value="${fullmoon }" />
							목표 모금액 : ${fullmoon.getGoal()} 원<br />


							<c:set var="fullmoon" value="${fullmoon }" />
							종료모금액: ${fullmoon.getDonate()} 원<br />


							<fmt:parseNumber var="percent"
								value="${fullmoon.getDonate() / fullmoon.getGoal()*100}"
								integerOnly="true" />


							달성률 : ${percent} %<br />
						</div>

						<div class="article-img">
							<img src='https://ifh.cc/g/zO5wLd.png' border='0' width=100%
								height=400>

						</div>
					</div>
					<div class="article-category">
						<div class="aritcle-category-name">
							<c:forEach begin="1" end="5">
								<div>
									유저이름<br> 
									내용~~~~~~~~~~~~~~<br>
								</div>
							</c:forEach>


						</div>

					</div>
				</div>
				<div class="article-cotainer-bottom">

					<div class="comment">
						<div>댓글 ></div>
						<form method="POST" class="comment">
							<textarea cols="80" rows="10" id="msg-box" name="msg"
								onclick="this.select()" onfocus="this.select()">
							<c:choose>
								<c:when test="${empty log}">
									댓글을 작성하시려면 로그인 해주세요. 
								</c:when>
								<c:otherwise>
									주제와 무관한 댓글, 악플은 삭제될 수 있습니다.
								</c:otherwise>
							</c:choose>
							</textarea>
							<input type="button" id="commentBtn" value="등록" onclick="addComment()">
						</form>
					</div>
					<!-- 댓글 출력할 공간 -->
					<div id="comments-container">
						<c:if test="${not empty commentList}">
							<c:forEach var="li" items="${commentList }">
								<div class="comments-item">
									<p>${li.getUserName()}</p>
									<p>${li.getCommentContent()}</p>
									<p>${li.getCommentCreatedAt()}</p>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>

			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	
	<script src="../resources/script/comments-api.js"></script>
</body>
</html>