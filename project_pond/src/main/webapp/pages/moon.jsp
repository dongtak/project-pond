<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/moon.css">
<title>보름달</title>
</head>
<body>
	<c:set var="moonUp" value="${sessionScope.moonUp }" />
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
		
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	
</body>
</html>