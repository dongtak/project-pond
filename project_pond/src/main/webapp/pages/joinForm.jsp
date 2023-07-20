<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/images/favicon-32x32.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>회원가입</title>
<link rel="stylesheet" href="resources/style/form.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>

		<div class="section login-form">
			<form method="POST" class="user-form" action="Join">
				<h2>회원가입</h2>
				<div class="input-id">
					<input type="text" id="id" class="user-input input-id-txt"
						name="id" placeholder="아이디" autofocus>
					<!-- 아이디 중복체크 추가 -->
					<input type="button" id="idCheckBtn" onclick="dupleChkId()"
						value="중복확인">
				</div>
				<span class="error" id="error-id">아이디: 필수 정보입니다.</span>
				<span class="error" id="error-idChk">아이디 중복체크를 해 주세요.</span>
				<span class="error" id="error-idCheked">사용 불가능한 아이디입니다.</span>
				<span id="idChecked">사용 가능한 아이디입니다.</span>
					<input type="password" id="password" class=user-input
						name="password" placeholder="비밀번호">
				<span class="error" id="error-password">비밀번호: 필수 정보입니다.</span>
					<input type="email" class=user-input id="email" name="email"
						placeholder="이메일"> 
						<span class="error" id="error-email">이메일: 필수 정보입니다.</span>
				<input type="text" class=user-input id="name" name="name"
					placeholder="이름"> <span class="error" id="error-name">이름: 필수 정보입니다.</span>
					<input type="text" class=user-input id="birth" name="birth"
						placeholder="생년월일 8자리">
				<span class="error" id="error-birth">생년월일: 필수 정보입니다.</span>
					<input type="text" class=user-input id="phone" name="phone"
						placeholder="휴대전화 번호 ( - 포함)">
				<span class="error" id="error-phone">휴대전화: 필수 정보입니다.</span>
					<jsp:include page="/address"></jsp:include>
				<div class="joinform-btns">
					<input type="button" class="join-btn" id="submit-btn" value="회원가입" onclick="checkValue(form)"> 
					<input type="button" class="cancelBtn" id="cancel-btn" value="취소" onclick="history.back()">
				</div>
			</form>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
<script src="resources/script/validation.js"></script>
<script>
	$(function() {
		$(document).on("keyup", function(e) {
			if (e.which == 13) {
				$("#submit-btn").click();
			}
		});
	});
</script>


</html>