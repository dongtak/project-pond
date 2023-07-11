<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/article.css">
<title>게시판</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
		<div class="items">
			<div class="item">
				<a href="#">
				게시판1
				</a>
			</div>
			<div class="item">
				<a href="#">
				게시판2
				</a>
			</div>
			<div class="item">
				<a href="#">
				게시판3
				</a>
			</div>
			<div class="item">
				<a href="#">
				게시판4
				</a>
			</div>
		
		</div>
		<div class="page">		
		<span>&lt;</span>	
		<span>1</span>	
		<span>2</span>	
		<span>3</span>	
		<span>&gt;</span>	
		</div>
		
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>