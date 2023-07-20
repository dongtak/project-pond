<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/form.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<div id="main-section">
		<form method="POST" class=user-form action="UpdateUser">
			<h2>비밀번호 변경</h2>
			<div class="div-form">
				<div>
					<input type="text" class=user-input id="id" name="id"
						value="${sessionScope.log }" readonly>
				</div>
				<div>
					<input type="password" class=user-input id="password" name="password"
						placeholder="비밀번호" autofocus>
				</div>
				<div>
					<input type="password" class=user-input id="new-password"
						name="new-password" placeholder="새 비밀번호">
				</div>
				<div>
					<input type="password" class=user-input id="new-password-con"
						name="new-password-con" placeholder="새 비밀번호 확인">
				</div>
				<ul>
					<li class="error" id="error-pwd">비밀번호가 일치하지 않습니다.</li>
					<li class="error" id="error-password1">비밀번호를 입력해주세요.</li>
					<li class="error" id="error-password2">새 비밀번호를 다시 입력해주세요.</li>
					<li class="error" id="error-password-con">새 비밀번호가 서로 일치하지 않습니다.</li>
					<li class="error" id="error-pwd-same">현재 비밀번호와 동일합니다.</li>
				</ul>
			</div>
			<input type="hidden" value="${requestScope.user.getPwd() }" name="storedPwd" id="storedPwd">
			<input type="button" class="updateBtn" id="submit-btn" value="비밀번호 변경하기" onclick="checkPwd(form)"> 
		</form>
	</div>
<script src="resources/script/validationUpdate.js"></script>
</body>

</html>