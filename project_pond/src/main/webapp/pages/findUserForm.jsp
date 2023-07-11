<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/form.css">


</head>
<body>

<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<h1>아이디 찾기</h1>
			<form mehtod="POST" action="findId">
			<div class="div-form">
			
			<div>
			<input type="text" id="id" name="id" placeholder="아이디 찾기" autofocus>
			
			</div>
			<div>
			<input type="text" onKeyup="addHypen(this);" name="phone" class="phone" placeholder="휴대폰번호를 '-'없이 입력">
			</div>
			
			</div>
		
			<input type="button" id="submit-btn" value="찾기"
					onclick="idSearch()">
					<input type="button" id="submit-btn" value="취소"
					onclick="back()">
		
			</form>
			
			
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>



</body>

<script>



</script>
</html>