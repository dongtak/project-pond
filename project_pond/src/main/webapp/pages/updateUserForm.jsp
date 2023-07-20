<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/style/mypageContent.css">
</head>
<body>
	<div class="mypage-content">
		<form method="POST" class="mypage-form" action="UpdateUser">
			<h2>비밀번호 변경</h2>
			<input type="hidden" class=user-input id="id" name="id" value="${sessionScope.log }" readonly> 
			<div class="info-input">
				<p>기존 비밀번호</p>
				<input type="password" class=user-input id="password" name="password" placeholder="비밀번호" autofocus> 
			</div>
			<div class="info-input">
				<p>새 비밀번호</p>
				<input type="password" class=user-input id="new-password" name="new-password" placeholder="새 비밀번호"> 
			</div>
			<div class="info-input">
				<p>새 비밀번호 확인</p>
				<input type="password" class=user-input id="new-password-con" name="new-password-con" placeholder="새 비밀번호 확인"> 
			</div>
			<span class="error" id="error-pwd">비밀번호가 일치하지 않습니다.</span> 
			<span class="error" id="error-password1">비밀번호를 입력해주세요.</span> 
			<span class="error" id="error-password2">새 비밀번호를 입력해주세요.</span> 
			<span class="error" id="error-password-con">새 비밀번호가 서로 일치하지 않습니다.</span> 
			<span class="error" id="error-pwd-same">현재 비밀번호와 동일합니다.</span> 
			
			<input type="hidden" value="${requestScope.user.getPwd() }" name="storedPwd" id="storedPwd"> 
			<input type="button" class="updateBtn" id="submit-btn" value="비밀번호 변경하기" onclick="checkPwd(form)">
		</form>
	</div>
	<script src="resources/script/validationUpdate.js"></script>
	<script>
		$(document).on("keyup", function(e){
    		if (e.which == 13) {
        	$("#submit-btn").click();
    		}
		});
	</script>
</body>
</html>