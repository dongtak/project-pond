<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>회원가입</title>
<link rel="stylesheet" href="resources/style/form.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div id="section">
		<div class="container">
			<form method="POST" class=user-form action="Join">
			<h1>회원가입</h1>
				<div class="div-form">
					<div class="input-id">
						<input type="text" id="id" class="user-input input-id-txt" name="id"
							placeholder="아이디" autofocus>
						<!-- 아이디 중복체크 추가 -->
						<input type="button" id="idCheckBtn" onclick="dupleChkId()" value="중복확인">
					</div>
					<ul>
						<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
						<li class="error" id="error-idChk">아이디 중복체크를 해 주세요.</li>
						<li class="error" id="error-idCheked">사용 불가능한 아이디입니다.</li>
						<li id="idChecked">사용 가능한 아이디입니다.</li>
					</ul>
					<div>
						<input type="password" id="password" class=user-input name="password"
							placeholder="비밀번호">
					</div>
					<ul>
						<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
					</ul>

					<div>
						<input type="email" class=user-input id="email" name="email"
							placeholder="이메일">
					</div>
					<ul>
						<li class="error" id="error-email">이메일: 필수 정보입니다.</li>
					</ul>
				
					<div>
						<input type="text" class=user-input id="name" name="name"
							placeholder="이름">
					</div>
					<ul>
						<li class="error" id="error-name">이름: 필수 정보입니다.</li>
					</ul>
					<div>
						<input type="text" class=user-input id="birth" name="birth"
							placeholder="생년월일 8자리">
					</div>
					<ul>
						<li class="error" id="error-birth">생년월일: 필수 정보입니다.</li>
					</ul>

					<div>
						<input type="text" class=user-input id="phone" name="phone"
							placeholder="휴대전화 번호 ( - 포함)">
						
					</div>

					<ul>
						<li class="error" id="error-phone">휴대전화: 필수 정보입니다.</li>
					</ul>
					<div>
						<jsp:include page="/address"></jsp:include>

					</div>
				</div>

					<input type="button" class="join-btn" id="submit-btn" value="회원가입"
						onclick="checkValue(form)" onkeyup="enterkey()">
						 <input type="button"
						class="cancelBtn" id="cancel-btn" value="취소"
						onclick="history.back()">
				</form>
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
<script src="resources/script/validation.js"></script>

<script>
function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행하는 반응
         $("#form").submit();
    }
}
</script>

</html>