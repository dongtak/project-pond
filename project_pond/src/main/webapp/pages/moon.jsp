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
<c:set var="pageCount" value=""/>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<div class="menu">
				<ul>
					<li><a href="moonMenu?moonMenu=new">최신순</a></li>
					<li><a href="moonMenu?moonMenu=done">100% 달성</a></li>
					<li><a href="moonMenu?moonMenu=peak">최고 금액</a></li>
					<li><a href="moonMenu?moonMenu=topMsg">가장 많은 메시지</a></li>
				</ul>
			</div>
			<div class="content">
				<c:choose>
					<c:when test="">
					</c:when>
				</c:choose>	
			</div>
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>