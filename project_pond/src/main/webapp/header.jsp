<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<link rel="stylesheet" href="resources/style/grid.css">
<body>
<c:set var="log" value="${sessionScope.log }"/>
<c:set var="isAdmin" value="${sessionScope.isAdmin }"/>
	<div class="header">
		<a href="mainAction" class="logo">보름달</a>
		<div class="nav-bar">
			<ul>
				<li><a href="about">ABOUT</a></li>
				<li><a href="moonAction">보름달</a></li>
				<li><a href="articleHomeAction">히스토리</a></li>
			</ul>
		</div>
		<div class="login-bar">
		<c:choose>
			<c:when test="${empty log}">
				<span><a href="login">로그인</a></span>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${isAdmin }">
						<span><a href="adminMainAction">관리자페이지</a></span>
					</c:when>
					<c:otherwise>
						<span id="userlogin">
							<a href="myPageMenu">마이페이지</a>
							<a href="logout">로그아웃</a>
						</span>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</body>
</html>
