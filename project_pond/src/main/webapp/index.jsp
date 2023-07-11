<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="resources/style/grid.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

	<c:set var="connection" value="<%=DBManager.getConnection()%>" />

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<h1>hello pond</h1>
			<script>
				location.href = "main";
			</script>
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>