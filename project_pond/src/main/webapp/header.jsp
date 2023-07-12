<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = (String) session.getAttribute("log");
boolean login = id == null ? false : true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<link rel="stylesheet" href="resources/style/grid.css">
<body>
<div class="header">
		<a href="main"><span>로고</span></a>
		<div class="nav-bar">
			<ul>
				<li><a href="about">ABOUT</a></li>
				<li><a href="moon">보름달</a></li>
				<li><a href="articleHomeAction">나눗샘</a></li>
			</ul>
		</div>
		<%
			if (login) {
			%>
			<span><a href="myPage">마이페이지</a></span>
			<%
			} else {
			%>
			<span><a href="login">로그인</a></span>
			<%
			}
		%>
	</div>
</body>
</html>