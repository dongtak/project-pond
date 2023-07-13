<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/admin.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>관리자</title>
</head>
<body>
<c:set var="menu" value="${requestScope.menu }"/>
	<div id="wrap">
		<header>
			<span>${requestScope.admin.getAdmin_name() } 님</span>
			<button class="out-button" onclick="location.href='main'">나가기</button>
		</header>
		<nav>
			<div class="logo">
				<a href="#" onclick="location.href=`adminMainAction`;">로고</a>
			</div>
			<div class="menu">
				<div>사이트 관리</div>
				<ul>
					<li><a href="adminMainAction?menu=회원">회원관리</a></li>
					<li><a href="adminMainAction?menu=활동">활동관리</a></li>
					<li><a href="adminMainAction?menu=게시글">게시글관리</a></li>
					<li><a href="adminMainAction?menu=후원">후원관리</a></li>
				</ul>
			</div>
			<div class="logout">
				<a href="logout">로그아웃</a>
			</div>
		</nav>
		<section>
			<c:if test="${not empty menu }">
				<span>${menu } 관리</span>
				<div class="content">
					<jsp:include page="/adminManage"></jsp:include>
				</div>
			</c:if>
		</section>
		<footer>
			<span>관리자페이지 푸터</span>
		</footer>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
		  var selectedMenu = '${requestScope.menu}';
		  $('.menu li').each(function() {
		    var menuValue = $(this).find('a').attr('href').split('=')[1];
		    if (menuValue === selectedMenu) {
		      $(this).addClass('selected');
		    }
		  });
		});
	
	</script>
</body>
</html>