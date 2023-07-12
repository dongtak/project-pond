<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<link rel="stylesheet" href="resources/style/grid.css">
<body>
	<div class="header">
		<a href="main"><span>로고</span></a>
		<div class="nav-bar">
			<ul>
				<li><a href="about">ABOUT</a></li>
				<li><a href="moon">보름달</a></li>
				<li><a href="articleHome">나눗샘</a></li>
			</ul>
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.log}">
				<span><a href="login">로그인</a></span>
			</c:when>
			<c:otherwise>
				<span><a href="myPage">마이페이지</a></span>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
