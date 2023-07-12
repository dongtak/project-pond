<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/modal.css">
</head>

<body>

	<form id="modal-form" method="post" action="/modal2">

		<div class="donor">

			<label><input type="radio" name="leavename" value="anonymous">
				익명으로 후원하기 </label> <br>
			<label><input type="radio" name="leavename" value="nominated">
				후원자 이름 남기기 </label> <br>
			<span id="nameError" class="error-message"> 후원옵션을 선택해주세요 </span>
		</div>


		<div class="donate">
			<p>* 메세지는 1만원 이상부터 작성 할 수 있습니다.</p>
			<button type="button" onclick="setAmount(1000)">1천원</button>
			<button type="button" onclick="setAmount(5000)">5천원</button>
			<button type="button" onclick="setAmount(10000)">1만원</button>
			<button type="button" onclick="setAmount(20000)">2만원</button>
			<button type="button" onclick="setAmount(50000)">5만원</button>
			<button type="button" onclick="setAmount(100000)">10만원</button>
			<button type="button" onclick="enableCustomAmount()">직접입력</button>
			<input type="text" class="inputmoney" name="cntrAmount"
				id="cntrAmount" title="금액직접입력" placeholder="직접입력" numberonly=""
				maxlength="9" tabindex="0" disabled> <span id="moneyError"
				class="error-message"> 후원금을 입력해주세요 </span> <br> <input
				type="button" value="다음" onclick="nameAndNumber(form)">
		</div>

	</form>

</body>
<script src="resources/script/validationPay.js"></script>
</html>