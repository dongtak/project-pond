<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/modal.css">
<link rel="stylesheet" href="resources/style/form.css">
</head>


<body>
	<button class="switchbutton" type=button value="lid">비회원 후원하기</button>

	<div id="lid">
		<section id="main-section">
			<form action="Login" class=user-form method="POST">
				<input type="text" placeholder="아이디 입력" class=user-input id="id"
					name="id">
				<ul>
					<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
				</ul>

				<input type="password" class=user-input placeholder="비밀번호 입력"
					id="pwd" name="pwd">
				<ul>
					<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
				</ul>
				<input type="button" class=user-input onclick="checkValue(form)"
					value=" 로그인">
			</form>
			<a href="findUser">아이디/비밀번호 찾기</a> <a href="join">회원가입</a>
		</section>

	</div>
	<div id="lod">
		<form id="modal-form" method="post" action="">
			<div class="donor">

				<label><input type="radio" name="leavename"
					value="anonymous"> 익명으로 후원하기 </label> <label><input
					type="radio" name="leavename" value="nominated"> 후원자 이름 남기기
				</label> <br> <span id="nameError" class="error-message"> 후원옵션을
					선택해주세요 </span>
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
					id="cntrAmount" title="금액직접입력" placeholder="후원금액" numberonly=""
					maxlength="9" tabindex="0" disabled> <span id="moneyError"
					class="error-message"> 후원금을 입력해주세요 </span> <br> <input
					type="button" value="다음" onclick="nameAndNumber(form)">
			</div>

		</form>
	</div>



</body>
<script src="resources/script/validationPay.js"></script>
<script src="resources/script/validationLogin.js"></script>
<script type="text/javascript">

	//숫자만 입력
	var inputElement = document.getElementById("cntrAmount");

	inputElement.addEventListener("input", function() {
		var inputValue = inputElement.value;
		var numericValue = inputValue.replace(/[^0-9]/g, "");
		inputElement.value = numericValue;
	});

	var switchButton = document.querySelector(".switchbutton");
	var lidElement = document.getElementById("lid");
	var lodElement = document.getElementById("lod");
	var isLidVisible = false;

	switchButton.addEventListener("click", function() {
		isLidVisible = !isLidVisible;

		if (isLidVisible) {
			switchButton.textContent = "로그인후 후원하기";
			lidElement.style.display = "block";
			lodElement.style.display = "none";
		} else {
			switchButton.textContent = "비회원 후원하기";
			lidElement.style.display = "none";
			lodElement.style.display = "block";
		}
	});
</script>
</html>