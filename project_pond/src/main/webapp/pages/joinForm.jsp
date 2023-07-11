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
			<form method="POST" action="Join">
				<div class="div-form">
					<div>
						<input type="text" id="id" name="id" placeholder="아이디" autofocus>
						<!-- 아이디 중복체크 추가-->
						<button onclick="idCheck()" >중복확인</button>
					</div>
					<div>
						<input type="text" id="password" name="password"
							placeholder="비밀번호">
					</div>
					<div>
						<input type="email" id="email" name="email"
							placeholder="[선택] 비밀번호 분실 시 확인용 이메일">
					</div>
				</div>
				<ul>
					<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
					<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
				</ul>

				<div class="div-form">
					<div>
						<input type="text" id="name" name="name" placeholder="이름">
					</div>
					<div>
						<input type="text" id="birth" name="birth" placeholder="생년월일 8자리">
					</div>

					<div>
						<input type="text" id="phone" name="phone" placeholder="휴대전화 번호">
					</div>

					<div>
						<jsp:include page="/address"></jsp:include>

					</div>
				</div>
				<ul>
					<li class="error" id="error-name">이름: 필수 정보입니다.</li>
					<li class="error" id="error-birth">생년월일: 필수 정보입니다.</li>
					<li class="error" id="error-phone">휴대전화: 필수 정보입니다.</li>
				</ul>
				<input type="button" id="submit-btn" value="회원가입"
					onclick="checkValue(form)">
			</form>
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>




</body>
<script src="resources/script/validation.js"></script>
<!-- 아이디중복체크 추가 -->
<script>
function idCheck(){
	
	window.open("idCheckForm.jsp","idcheck","width=400,height=350")
}
</script>

</html>