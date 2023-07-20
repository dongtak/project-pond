<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/my.css">
</head>
<body>
<c:set var="user" value="${requestScope.user }"/>
	<div id="info-container">
		<div class="info-box">
			<span>아이디 : 유저아이디</span>
		</div>
		<div class="info-box"></div>
		<div class="info-box"></div>
		<div class="info-box"></div>
	</div>
</body>
</html>