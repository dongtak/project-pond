<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="resources/style/form.css">

</head>
<body>

<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<h1>아이디 찾기</h1>
			<form method="POST" class=user-form action="/findId">
			<div class="div-form">
			
			<div>
			<input type="text" class=user-input id="name" name="name" placeholder="이름을 입력하세요" required autofocus>
			
			</div>
			<div>
			<input type="text" class=user-input  name="email" class="email" placeholder="email주소를 입력하세요." required>
			</div>
			
			</div>
		
			<input type="button" class=user-input id="id-submit-btn" value="찾기"
					onclick="validationFindUser(form)">
			
				<input
					type="button" class="cancelBtn" id="cancel-btn" value="취소"
					onclick="history.back()">
		
			</form>
			
			
			
			
				<h1>비밀번호 찾기</h1>
			<form method="POST" class=user-form action="/findPwd">
			<div class="div-form">
			
			<div>
			<input type="text" class=user-input id="id" name="id" placeholder="아아디를 입력하세요" required autofocus>
			
			</div>
			
			
			<div>
			<input type="text" class=user-input id="name" name="name" placeholder="이름을 입력하세요" required autofocus>
			
			</div>
			
			<div>
			<input type="text" class=user-input name="email" class="email" placeholder="email주소를 입력하세요." required>
			</div>
			
			
			</div>
		
			<input type="button" class=user-input id="pwd-submit-btn" value="찾기"
					onclick="validationFindUser(form)">
			
					<input type="button" class=user-input id="submit-btn" value="취소"
					onclick="back()">
		
			</form>
			
			
			
			
			
		
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>



</body>

<script>

function validationFindUser(htmlForm){
	const name = htmlForm.name.value;
	const email = htmlForm.email.value;
	
	let check= true;
	
	
}




</script>
</html>