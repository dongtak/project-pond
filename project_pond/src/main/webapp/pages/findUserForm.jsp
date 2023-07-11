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
			<input type="text" id="name" name="name" placeholder="이름을 입력하세요" required autofocus>
			
			</div>
			
			<div>
			<input type="text"  name="email" class="email" placeholder="email주소를 입력하세요." required>
			</div>
			
			
			</div>
		
			<input type="submit" id="submit-btn" value="찾기"
					onclick="idSearch()">
			
					<input type="button" id="submit-btn" value="취소"
					onclick="back()">
		
			</form>
			
		
			
			
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>



</body>

<script>

function idSearch(){
	
	
}


</script>
</html>