<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<title>회원정보수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/style/form.css">

</head>
<body>
	<c:set var="pwd" value="${sessionScope.pwd }" />
	<div id="wrap">


		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
		<!-- 
		<h1>${sessionScope.pwd }</h1>
<h1>${sessionScope.log }</h1>
		 -->

			<form method="POST" class=user-form action="Update">
				<h1>비밀번호 변경</h1>
				<div class="div-form">


					<div>
						<input type="text" class=user-input id="id" name="id"
							value="${sessionScope.log }" readonly>
					</div>

					<div>
						<input type="text" class=user-input id="password" name="password"
							placeholder="비밀번호" autofocus>
					</div>
					<div>
						<input type="text" class=user-input id="new-password"
							name="new-password" placeholder="새비밀번호">
					</div>

					<div>
						<input type="text" class=user-input id="new-password-con"
							name="new-password-con" placeholder="새비밀번호 확인">
					</div>
					<ul>
						<li class="error" id="error-password1">비밀번호를 입력해주세요.</li>

						<li class="error" id="error-password2">새비밀번호를 입력해주세요.</li>
						<li class="error" id="error-password-con">비밀번호 불일치.</li>
					</ul>

				</div>

				<input type="hidden" value="${pwd }" name="storedPwd" id="storedPwd">

				<input type="button" class="updateBtn" id="submit-btn"
					value="비밀번호 변경하기" onclick="checkPwd(form)"> <input
					type="button" class="cancelBtn" id="cancel-btn" value="취소"
					onclick="history.back()">

			</form>

		</section>

		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
<script src="resources/script/validationUpdate.js"></script>



</html>