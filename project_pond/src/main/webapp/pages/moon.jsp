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
					<li><a id="new">최신순</a></li>
					<li><a id="done">100% 달성</a></li>
					<li><a id="peak">최고 금액</a></li>
					<li><a id="topMsg">가장 많은 메시지</a></li>
				</ul>
			</div>
			<div class="content">
				
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	
	<script type="text/javascript" src="resources/script/moonMenu.js"></script>
</body>
</html>