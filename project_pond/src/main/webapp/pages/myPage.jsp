<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<title>마이페이지</title>
</head>
<link rel="stylesheet" href="resources/style/mypage.css">
<body>
	<c:if test="${empty sessionScope.log }">
		<c:redirect url="login"></c:redirect>
	</c:if>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
			<div class="aside">
				<div class="aside-top">
					<h2>My Page</h2>
					<p>${sessionScope.log }님 환영합니다.</p>
				</div>
				<div class="aside-menu">
					<ul>
						<li id="update">내 정보 수정</li>
						<li id="addCard">결제 수단 추가</li>
						<li id="payInfo">내 카드 정보</li>
						<li id="myPay">후원 기록</li>
						<li id="myMsg">내가 쓴 댓글</li>
						<li id="delete">회원 탈퇴</li>
					</ul>
				</div>
			</div>
			<div id="menu-container"></div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	<script src="../resources/script/mypageMenu.js"></script>
</body>
</html>