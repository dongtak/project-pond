<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<form method="POST" action="Update">
				<!-- updateuserformaction -->
				<div class="div-form">

					<div>
						<input type="text" id="id" name="id" value="${sessionScope.log }"
							readonly>
					</div>
					<div>
						<input type="text" id="password" name="password"
							placeholder="비밀번호" autofocus>
					</div>
					<div>
						<input type="text" id="new-password" name="new-password"
							placeholder="새비밀번호">
					</div>
					<div>
						<input type="email" id="email" name="email"
							value="${requestScope.email }">
					</div>
				</div>

				<div class="div-form">
					<div>
						<input type="text" id="name" name="name" placeholder="이름"
							value="${requestScope.name }" readonly>
					</div>
					<div>
						<input type="text" id="birth" name=" " placeholder="생년월일"
							value="${requestScope.birth }" readonly>
					</div>

					<div>
						<input type="text" id="phone" name="phone" placeholder="핸드폰번호">
					</div>
					<div>
						<jsp:include page="/address"></jsp:include>

					</div>

				</div>
				<button>test</button>
				<input type="button" class="updateBtn" id="submit-btn"
					value="회원정보 수정" onclick="update(form)"> <input
					type="button" class="cancelBtn" id="cancel-btn" value="취소"
					onclick="history.back()">
			</form>

		</section>

		<jsp:include page="/footer"></jsp:include>
	</div>

</body>


<script>
	function update(form) {
		var password = form.password.value;
		var newPassword = form['new-password'].value;

		if (password !== '' && newPassword !== '') {
			if (newPassword !== password) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
		}

		form.submit();
	}
</script>



</html>