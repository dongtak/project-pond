<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/images/favicon-32x32.png">
<link rel="stylesheet" href="resources/style/articledetail.css">

<title>히스토리</title>

</head>
<body>

	<c:set var="log" value="${sessionScope.log}" />
	<c:set var="article" value="${requestScope.article }" />
	<c:set var="fullmoon" value="${requestScope.fullmoon }" />
	<c:set var="commentList" value="${requestScope.commentList }" />

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div id="section">
			<span id="logVal">${log}</span>
			<div class=article-container>
				<!-- 본문 -->
				<div class="article-cotainer-top">
					<div class="article-content">


						<div class="articleTitle">
							<ul>
								<li><c:set var="moonNum" value="${article.getMoon_num() }" />
									<img src='https://ifh.cc/g/1Jbm3R.png' border='0' width=30 height=30> <span id="moonNum">${moonNum }</span></li>
								<li><c:set var="title"
										value="${article.getArticle_title() }" /> <span class="title">
										${title }</span></li>
								<li><c:set var="createdAt"
										value="${article.getArticle_createdAt() }" /> <fmt:formatDate
										value="${createdAt }" pattern="yyyy-MM-dd" var="created" />
									기간 &nbsp; | &nbsp; ${created} ~ 종료 날짜</li>
							</ul>

						</div>

						<div class="articleMain">
							<div class="articleContent">
								<c:set var="content" value="${article.getArticle_content() }" />
								<c:set var="sentences" value="${fn:split(content,'&&')}" />
								<c:forEach var="sentence" items="${sentences}" >
									<c:set var="words" value="${fn:split(sentence, '**')}" />
									<c:forEach var="word" items="${words}" >
										<p>${word}</p>
									</c:forEach>
									<br>
								</c:forEach>

							</div>



							<!--  본문 이미지 -->
							<div class="articleImg">
								<img src='https://ifh.cc/g/nXHA6h.jpg' border='0' width=90%
									height=400>

							</div>

							<div class="articleGoal">

								<ul>
									<li><c:set var="fullmoon" value="${fullmoon }" /> 목표 모금액
										: ${fullmoon.getGoal()} 원</li>

									<li><c:set var="fullmoon" value="${fullmoon }" /> 종료 모금액 :
										${fullmoon.getDonate()} 원</li>
									<li><fmt:parseNumber var="percent"
											value="${fullmoon.getDonate() / fullmoon.getGoal()*100}"
											integerOnly="true" /> 달성률 : ${percent} % <br></li>

									<li>후원해주신 모든 분들께 감사드립니다.</li>

								</ul>
							</div>
						</div>


					</div>
					<!-- 오른쪽 카테고리-->


					<c:set var="payList" value="${requestScope.payList}" />

					<div class="article-category">

						<div class="msgBox">
							<span> 후원 메세지 </span>
							<c:if test="${not empty payList }">
								<c:forEach var="pays" items="${payList }">
								<div class="msgContent">
									<p>${pays.getName() }</p>
									<p>${pays.getMessage() }</p>
									</div>
								</c:forEach>
							</c:if>

						</div>


					</div>
				</div>



				<!-- 댓글 부분 -->
				<div class="article-container-bottom">

					<div class="comments-write">
						<span>댓글쓰기 </span>
						<form method="POST" class="comment">
							<textarea cols="80" rows="10" id="msg-box" name="msg"
								<c:choose>
								<c:when test="${empty log}">
									placeholder="댓글을 작성하시려면 로그인을 해주세요." readonly
								</c:when>
								<c:otherwise>
									placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다."
								</c:otherwise>
							</c:choose>></textarea>
							<div class="commentBtn">
								<input type="button" id="commentBtn" value="등록하기"
									onclick="addComment()">
							</div>

						</form>
					</div>
					<!-- 댓글 출력할 공간 -->
					<div id="comments-container">

						<c:if test="${not empty commentList}">
							<c:forEach var="li" items="${commentList }">
								<div class="comments-item">

									<p>${li.getUserName()}</p>
									<br>
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
	<script>
		function navigo() {
			const header = $('.header'); // 헤더 부분 획득
			const headerHeight = header.height(); // 헤더 높이

			//const articleCategory = $('.article-category');

			//const categoryHeight = articleCategory.height();

			$(document).scroll(onScroll); // 스크롤 이벤트

			function onScroll() {
				const scrollPosition = $(window).scrollTop(); // 스크롤 위치
				const nav = $('.msgBox'); // 메뉴

				if (headerHeight <= scrollPosition
					) {
					nav.addClass('fix'); // fix 클래스를 네비에 추가
				} else {
					nav.removeClass('fix'); // fix 클래스를 네비에서 제거
				}
			}
		}
		navigo();
		


	</script>
</body>
</html>