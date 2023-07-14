<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="resources/style/form.css">
</head>
<body>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<form action="Login" class="user-form" method="POST">
				<input type="text" placeholder="아이디 입력" class="user-input" id="id" name="id">
				<ul>
					<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
				</ul>

				<input type="password" class="user-input" placeholder="비밀번호 입력" id="pwd" name="pwd">
				<ul>
					<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
				</ul>
				<input type="button" id="submit-btn" onclick="checkValue(form)" value=" 로그인">
			</form>
			<div class="bottom-nav">
			<a href="findUser">아이디/비밀번호 찾기</a> <a href="join">회원가입</a>
			</div>
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>



</body>

<script src="resources/script/validationLogin.js"></script>
</html>