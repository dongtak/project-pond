<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="stylesheet" href="resources/style/moon.css">
<title>보름달</title>
</head>
<body>
	<c:set var="moonUp" value="${sessionScope.moonUp }" />
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
			<div id="title">
				<h2>${moonUp.getTitle()}</h2>
			</div>
			<div class="content">
				내용 1111
			</div>
			<div class="content">
				내용2
			</div>
			<button class="scrollTop" onclick="scrollToTop();">TOP</button>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	<script>
		function scrollToTop() {
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
		}
	</script>
</body>
</html>