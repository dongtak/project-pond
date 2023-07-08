<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/style/form.css">


<body>
<c:if test="${empty sessionScope.log }">
	<c:redirect url="login"></c:redirect>
</c:if>

<div id="wrap">
	<jsp:include page="/header"></jsp:include>
	
	<section id="main-section">
	
		<h2>My Page</h2>
		<h3>${sessionScope.log }님 환영합니다.</h3>
		<button onclick="location.href='UpdateUserRequest'">회원정보 수정</button>
		<button onclick="location.href='leave'">회원탈퇴</button>
		<button onclick="location.href='logout'">로그아웃</button>
	</section>
	<jsp:include page="/footer"></jsp:include>
</div>
</body>
</html>