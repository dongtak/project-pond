<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
</head>
<style>
body {
	font-family: Arial, sans-serif;

}

.form-container {
	max-width: 600px;
	margin: 0 auto;
	display: flex; /* 1열 정렬을 위해 flexbox를 사용 */
	flex-wrap: wrap; /* 너비가 충분하지 않을 경우 다음 줄로 내려가도록 설정 */
}

.form-group {
	flex: 0 0 50%; /* 2열로 정렬하기 위해 너비를 50%로 설정 */
	padding: 5px; /* 행 간격 조정 */
}

.form-label {
	display: block;
	margin-bottom: 5px;
}

.form-input {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.error-message {
	color: red;
	display: none;
	margin-top: 5px;
}

.submit-button {
	display: block;
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.submit-button:hover {
	background-color: #45a049;
}

.form-input:focus {
	border-color:
}
.donorinfo,.cardinfo,.btn2{
	width: 40%;
	margin:0 auto;
}

</style>
<body>
	<%
	String additionalData = request.getParameter("additionalData");
	// additionalData 값 활용
	%>

	<c:choose>
		<c:when test="${empty log}">
			<!-- 
					비어있는 input
				 -->
			<div class=donorinfo>
				<div class="form-group">
					<label for="donorName" class="form-label">성함</label> <input
						type="text" name="donorName" id="donorName" placeholder="성함"
						class="form-input" value=""> <span id="nameError"
						class="error-message">성함을 입력해주세요</span>
				</div>

				<div class="form-group">
					<label for="donorBirth" class="form-label">생년월일</label> <input
						type="text" name="donorBirth" id="donorBirth" placeholder="생년월일"
						class="form-input" maxlength="8" value=""> <span
						id="birthError" class="error-message">생년월일을 입력해주세요</span>
				</div>

				<div class="form-group">
					<label for="donorPhone" class="form-label">전화번호</label> <input
						type="tel" name="donorPhone" id="donorPhone" placeholder="전화번호"
						class="form-input" maxlength="11" value=""> <span
						id="phoneError" class="error-message">전화번호를 입력해주세요</span>
				</div>

				<div class="form-group">
					<label for="donorEmail" class="form-label">이메일</label> <input
						type="email" name="donorEmail" id="donorEmail" placeholder="이메일"
						class="form-input" value=""> <span id="emailError"
						class="error-message">이메일을 입력해주세요</span>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<!-- 
				유저 정보를 갖고와서 입력되있는 input
			 -->
			<div class=donorinfo>
				<div class="form-group">
					<label for="donorName" class="form-label">성함</label> <input
						type="text" name="donorName" id="donorName" placeholder="성함"
						class="form-input" value="유저 이름"> <span id="nameError"
						class="error-message">성함을 입력해주세요</span>
				</div>

				<div class="form-group">
					<label for="donorBirth" class="form-label">생년월일</label> <input
						type="text" name="donorBirth" id="donorBirth" placeholder="생년월일"
						class="form-input" maxlength="8" value="19999999"> <span
						id="birthError" class="error-message">생년월일을 입력해주세요</span>
				</div>

				<div class="form-group">
					<label for="donorPhone" class="form-label">전화번호</label> <input
						type="tel" name="donorPhone" id="donorPhone" placeholder="전화번호"
						class="form-input" maxlength="11" value="11111111"> <span
						id="phoneError" class="error-message">전화번호를 입력해주세요</span>
				</div>

				<div class="form-group">
					<label for="donorEmail" class="form-label">이메일</label> <input
						type="email" name="donorEmail" id="donorEmail" placeholder="이메일"
						class="form-input" value="email@email.com"> <span
						id="emailError" class="error-message">이메일을 입력해주세요</span>
				</div>
			</div>

		</c:otherwise>

	</c:choose>

	<div class=cardinfo>
		<div class="form-group">
			<label for="cardType" class="form-label">카드 타입</label> <select
				name="cardType" id="cardType" class="form-input" value="">
				<option value="">카드 타입 선택</option>
				<option value="visa">Visa</option>
				<option value="mastercard">Mastercard</option>
			</select> <span id="cardTypeError" class="error-message">카드 타입을 선택해주세요</span>
		</div>

		<div class="form-group">
			<label for="cardNumber" class="form-label">카드번호</label> <input
				type="text" name="cardNumber" id="cardNumber" placeholder="카드번호"
				class="form-input" value=""> <span id="cardNumberError"
				class="error-message">카드번호를 입력해주세요</span>
		</div>

		<div class="form-group">
			<label for="cardPassword" class="form-label">카드 비밀번호 2자리</label> <input
				type="text" name="cardPassword" id="cardPassword"
				placeholder="카드 비밀번호 2자리" maxlength="2" class="form-input" value="">
			<span id="cardPasswordError" class="error-message">카드 비밀번호
				앞자리2개를 입력해주세요</span>
		</div>

		<div class="form-group">
			<label for="cardExpYear" class="form-label">카드 유효기간</label> <select
				name="cardExpYear" id="cardExpYear" class="form-input" value="">
				<option value="">연도</option>
				<!-- 현재 연도부터 50년까지의 옵션 -->
				<c:forEach var="year" begin="23" end="50" step="1">
					<option value="${year}">${year}</option>
				</c:forEach>
			</select>
		</div>

		<div class="form-group">
			<label for="cardExpMonth" class="form-label">카드 유효기간</label> <select
				name="cardExpMonth" id="cardExpMonth" class="form-input" value="">
				<option value="">월</option>
				<!-- 1부터 12까지의 옵션 -->
				<c:forEach var="month" begin="1" end="12" step="1">
					<option value="${month}">${month}</option>
				</c:forEach>
			</select> <span id="cardExpirationError" class="error-message">카드 유효기간을
				입력해주세요</span>
				<div class=cardBtns>
							<input class="nextbtn btn2" type="button" onclick="showCardInput()"
		value="이전">
		<input class = "donateBtn"type="button" onclick="nameAndNumber(form)" value="후원하기">
				</div>
	
		</div>
	</div>
	

</body>
<script>
	function payInfoCheck(htmlForm) {
		var donorName = document.getElementById("donorName");
		var donorBirth = document.getElementById("donorBirth");
		var donorPhone = document.getElementById("donorPhone");
		var donorEmail = document.getElementById("donorEmail");
		var cardType = document.getElementById("cardType");
		var cardNumber = document.getElementById("cardNumber");
		var cardPassword = document.getElementById("cardPassword");
		var cardExpYear = document.getElementById("cardExpYear");
		var cardExpMonth = document.getElementById("cardExpMonth");
		var nameError = document.getElementById("nameError");
		var birthError = document.getElementById("birthError");
		var phoneError = document.getElementById("phoneError");
		var emailError = document.getElementById("emailError");
		var cardTypeError = document.getElementById("cardTypeError");
		var cardNumberError = document.getElementById("cardNumberError");
		var cardPasswordError = document.getElementById("cardPasswordError");
		var cardExpirationError = document
				.getElementById("cardExpirationError");

		var fields = [ {
			input : donorName,
			error : nameError
		}, {
			input : donorBirth,
			error : birthError
		}, {
			input : donorPhone,
			error : phoneError
		}, {
			input : donorEmail,
			error : emailError
		}, {
			input : cardType,
			error : cardTypeError
		}, {
			input : cardNumber,
			error : cardNumberError
		}, {
			input : cardPassword,
			error : cardPasswordError
		}, {
			input : cardExpYear,
			error : cardExpirationError
		}, {
			input : cardExpMonth,
			error : cardExpirationError
		} ];

		var firstEmptyField = null;

		// 빈칸 검사

		for (var i = 0; i < fields.length; i++) {
			var field = fields[i];
			if (!field.input.value.trim()) {
				field.error.style.display = "block";
				field.input.focus();
				return;
			} else {
				field.error.style.display = "none"; // 수정: 입력이 존재하면 에러 메시지를 숨김
			}
		}

		htmlForm.submit();

	}
</script>
</html>