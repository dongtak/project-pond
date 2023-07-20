<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/mypageContent.css">
</head>
<body>
<c:set var="user" value="${requestScope.user }"/>
<c:if test="${empty user }">
	location.href = "mainAction";
</c:if>
	<div id="info-container">
		<div class="info-box">
			<span>아이디 : 유저아이디</span>
			<span>이름 : 이름</span>
		</div>
	</div>
</body>
</html>