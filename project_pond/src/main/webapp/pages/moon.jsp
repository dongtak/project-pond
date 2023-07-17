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
	<c:set var="moonMenu" value="${requsetScope.moonMenu }" />
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
			<div class="menu">
				<ul>
					<li><a href="moonMenu?moonMenu=new">최신순</a></li>
					<li><a href="moonMenu?moonMenu=done">100% 달성</a></li>
					<li><a href="moonMenu?moonMenu=peak">최고 금액</a></li>
					<li><a href="moonMenu?moonMenu=topMsg">가장 많은 메시지</a></li>
				</ul>
			</div>
			<div class="content">
				<c:forEach var="moonList" items="${requestScope.moonList }" varStatus="vs">
					<div class="moon-item">
						<span>${moonList.getTitle()}</span>
						<span>${moonList.getContent() }</span>
					</div>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	
	<script type="text/javascript" src="resources/script/moonMenu.js"></script>
</body>
</html>