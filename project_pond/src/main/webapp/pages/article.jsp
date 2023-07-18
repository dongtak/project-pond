<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/style/articledetail.css">

<title>보름달</title>

</head>
<body>
	<c:set var="article" value="${requestScope.article }" />
	<c:set var="fullmoon" value="${requestScope.fullmoon }" />

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div id="section">
			<div class=article-container>
				<div class="article-cotainer-top">
					<div class="article-content">
						<div class="article">

							<c:set var="moonNum" value="${article.getMoon_num() }" />
							회차 : ${moonNum }<br />
							
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
								value="${moonUp.getDonate() / moonUp.getGoal()*100}"
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
									유저이름<br /> 내용~~~~~~~~~~~~~~<br />
								</div>
							</c:forEach>


						</div>

					</div>
				</div>
				<div class="article-cotainer-bottom">

					<div class="comment">
						<div>댓글 > </div>
						<form method="POST" class="comment" action="ShowArticleAction.java">


							<c:choose>

								<c:when test="${empty log}">
									<textarea cols="80" rows="10" onclick="this.select()"
										onfocus="this.select()">댓글을 작성하시려면 로그인 해주세요. </textarea>
								</c:when>
								<c:otherwise>
									<div class="commentBox">

										<textarea cols="80" rows="10" onclick="this.select()"
											onfocus="this.select()">주제와 무관한 댓글, 악플은 삭제될 수 있습니다. </textarea>

									</div>
								</c:otherwise>

							</c:choose>
							<input type="button" id="commentBtn" value="등록">
						</form>
					</div>
					<!-- 댓글 출력할 공간 -->



					<c:forEach begin="1" end="5">
						<div>
							유저이름<br /> 댓글내용~~~~~~~~~~~~~~<br /> 작성일~~~~<br />
						</div>
					</c:forEach>
					
					
				
					

					
				</div>
				
				
			</div>
		</div>
	</div>
	<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>