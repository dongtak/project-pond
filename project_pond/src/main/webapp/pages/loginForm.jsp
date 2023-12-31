<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/images/favicon-32x32.png">
<title>로그인</title>
<link rel="stylesheet" href="resources/style/form.css">
</head>
<body>

<c:set var="msg" value="${requestScoope.msg }"/>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div id="login-form" class="section">
			<form action="Login" class="user-form" method="POST">
				<h2>로그인</h2>
				<input type="text" placeholder="아이디 입력" class="user-input" id="id"
					name="id">
					<span class="error" id="error-id">아이디: 필수 정보입니다.</span>
				<input type="password" class="user-input" placeholder="비밀번호 입력"
					id="pwd" name="pwd">
					<span class="error" id="error-password">비밀번호: 필수 정보입니다.</span>
				<input type="button" id="submit-btn" onclick="checkValue(form)"
					value=" 로그인">
				<div class="bottom-nav">
					<a href="join">회원가입</a>
				</div>
			</form>

		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>

<script src="resources/script/validationLogin.js"></script>
<script>
$(document).on("keyup", function(e){
    if (e.which == 13) {
        $("#submit-btn").click();
    }
});
</script>
</body>
</html>