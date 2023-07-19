<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="stylesheet" href="resources/style/moon.css">
<title>보름달</title>
</head>
<body>
	<c:set var="moonUp" value="${sessionScope.moonUp }" />
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
			<div id="title">
			<h2>${moonUp.getTitle()}</h2>
				<c:set var="createdAt" value="${article.getArticle_createdAt() }" /> 
				<fmt:formatDate value="${createdAt }" pattern="yyyy-MM-dd" var="created" />
									
				<h4> 기간 &nbsp; | &nbsp; ${created} ~ 종료 날짜 </h4>
			</div>
			<div class="content">
			<h3>	"반딧불이에 마음을 새겨 넣어, 아이들과 나누는 희망의 메세지"</h3>
			<p> 세계 곳곳에는 아직도 굶주림과 결식으로 인해 고통받는 많은 어린이들이 있습니다. 
다양한 꿈과 희망을 품어야 할 때에도 굶주림과 고통 속에서 살아가며 자신의 꿈을 이루기 어렵습니다.</p>

<p>
우리는 이제 결식으로 고통받는 어린이들을 돕기 위해 보름달과 함께하는 후원 캠페인을 진행하고 있습니다. 
이 작은 마음들을 모아 아이들에게 꿈과 희망을 선물하고자 최선을 다하고 있습니다.
</p>




<p>
우리의 목표는 결식으로 고통받는 아이들에게 따뜻한 식사를 제공하고, 
교육과 의료 서비스에 접근할 수 있도록 도와주는 것입니다. 
여러분들의 관심과 도움이 있다면, 이 어린이들은 더 나은 미래를 향해 걸어갈 수 있습니다. 
그들이 꿈을 펼칠 수 있도록 우리 모두가 손을 맞잡고 도움을 주어야 합니다.
</p>
				
				<p>
				
우리의 작은 도움이 그들에게 희망과 기쁨을 선사하며, 그들의 꿈을 현실로 이끌어줄 것입니다. 
저희는 반딧불이에 특별한 메세지를 새겨, 아이들과 마음을 나눌 수 있는 이 순간을 만들어냅니다. 
이 특별한 순간에 여러분과 함께라면, 더 많은 아이들에게 희망과 기쁨을 선물할 수 있습니다.
				
				</p>
				
				<p>
				
				보름달과 함께 아이들에게 희망과 기쁨을 선물해주세요. 
그들의 미래를 밝히고, 꿈을 이루도록 우리 모두가 손을 건네어주길 바랍니다. 
이 작은 행동이 미래의 빛을 비춰주며, 어린이들이 희망을 가질 수 있는 더 나은 세상을 만들어낼 것입니다. 
저희 보름달과 함께해주세요!
				
				</p>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</div>
			<div class="content">
				내용2
				
				
				
				
				
				
				
				
				
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
			
			
			
			
			
			
			<button class="scrollTop" onclick="scrollToTop();">TOP</button>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	<script>
		function scrollToTop() {
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
		}
	</script>
</body>
</html>