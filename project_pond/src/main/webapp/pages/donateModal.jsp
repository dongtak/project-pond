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
<link rel="stylesheet" href="resources/style/payment.css">
<link rel="stylesheet" href="resources/style/form.css">
</head>

<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<button class="switchbutton" type=button value="lid">비회원
				후원하기</button>

			<div id="lod">
				<form id="modal-form" method="post" action="donate">
					<div class="donor">
						<label> <input type="radio" name="leavename"
							value="anonymous" onclick="toggleDonorName(true)"> 익명으로
							후원하기
						</label> <label> <input type="radio" name="leavename"
							value="nominated" onclick="toggleDonorName(false)"> 후원자 이름
							남기기
						</label><br> <span id="nameError" class="error-message"> 후원옵션을
							선택해주세요 </span> <input type=text name=donorname placeholder="익명">
						<span id="nameError2" class="error-message"> 익명 </span>
						
					</div>

					<div class="donate">
						<p>* 메세지는 후원금 1만원 이상부터 작성 할 수 있습니다.</p>
						<button type="button" onclick="setAmount(1000)">1천원</button>
						<button type="button" onclick="setAmount(5000)">5천원</button>
						<button type="button" onclick="setAmount(10000)">1만원</button>
						<button type="button" onclick="setAmount(20000)">2만원</button>
						<button type="button" onclick="setAmount(50000)">5만원</button>
						<button type="button" onclick="setAmount(100000)">10만원</button>
						<button type="button" onclick="enableCustomAmount()">직접입력</button>
						<input type="text" class="inputmoney" name="cntrAmount"
							id="cntrAmount" title="금액직접입력" placeholder="후원금액" numberonly=""
							maxlength="9" tabindex="0" disabled value=""> 
							<input type="text" class="messageInput" name="messageInput" id="messageInput" placeholder="마음을 전해보세요">
							<span
							id="moneyError" class="error-message"> 후원금을 입력해주세요 </span> <br>
						<input type="button" value="다음" onclick="nameAndNumber(form)">
					</div>

				</form>
			</div>

		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
<script src="resources/script/validationPay.js"></script>
</html>