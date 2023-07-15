<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/style/form.css">
<link rel="stylesheet" href="resources/style/mypage.css">
<body>
	<c:if test="${empty sessionScope.log }">
		<c:redirect url="login"></c:redirect>
	</c:if>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>

		<section id="main-section">


			<div class=aside>
				<div class=asideTop>
					<h2>My Page</h2>
					<h3>${sessionScope.log }님환영합니다.</h3>
				</div>
				<div class=asideMenu>
					<ul>
						<li onclick="location.href='update'">회원정보 수정</li>
						<li>내가쓴댓글</li>
						<li>결제정보</li>
						<li onclick="location.href='leave'">회원탈퇴</li>
						<li onclick="location.href='logout'">로그아웃</li>
					</ul>
				</div>


			</div>
			<div id="wrap-container">
				<h2>내용입니다</h2>


			</div>



		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>