<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/style/form.css">

</head>
<body>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<form method="POST" action="Update">
				<div class="div-form">
						<h3>비밀번호 변경</h3>
					<div>
						<input type="text" class=user-input id="id" name="id" value="${sessionScope.log }"
							readonly>
					</div>
					<div>
						<input type="text" class=user-input id="password" name="password"
							placeholder="비밀번호" autofocus>
					</div>
					<div>
						<input type="text" class=user-input id="new-password" name="new-password"
							placeholder="새비밀번호">
					</div>
					
					<div>
						<input type="text" class=user-input id="new-password-con" name="new-password-con"
							placeholder="새비밀번호확인">
					</div>
					
					<span class="error" id="error-password1">비밀번호를 입력해주세요.</span>
			<span class="error" id="error-password2">새비밀번호를 입력해주세요.</span>
					<span class="error" id="error-password-con">비밀번호 불일치.</span>

				</div>
				
				<button>test</button>
				<input type="button" class="updateBtn" id="submit-btn"
					value="비밀번호 수정" onclick="checkPwd(form)">
					 <input
					type="button" class="cancelBtn" id="cancel-btn" value="취소"
					onclick="history.back()">
			</form>

		</section>

		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
<script src="resources/script/validationUpdate.js"></script>




</html>