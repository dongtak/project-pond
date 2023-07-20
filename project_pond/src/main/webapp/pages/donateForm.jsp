<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/images/favicon-32x32.png">
<title>후원</title>
<link rel="stylesheet" href="resources/style/form.css">
<link rel="stylesheet" href="resources/style/donate.css">
<script src="resources/script/validationPay.js" />
</head>

<body>
	<c:set var="moonUp" value="${sessionScope.moonUp }" />
	<c:set var="id" value="${sessionScope.log }" />
	<c:set var="moonNum" value="${moonUp.getMoonNum() }" />
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<c:choose>
				<c:when test="${empty log}">

					<div class=btn-box>
						<button class="lodBtn btn" onclick="showLogin()">로그인 후
							후원하기</button>
						<button class="lidBtn btn" onclick="showPayment()">비회원
							후원하기</button>
					</div>


					<div id="lod">
						<form action="Login" class="user-form" method="POST">
							<h1>로그인</h1>
							<input type="text" placeholder="아이디 입력" class="user-input"
								id="id" name="id">
							<ul>
								<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
							</ul>

							<input type="password" class="user-input" placeholder="비밀번호 입력"
								id="pwd" name="pwd">
							<ul>
								<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
							</ul>
							<input type="button" id="submit-btn" onclick="checkValue(form)"
								value=" 로그인">
						</form>
						<div class="bottom-nav">
							<!-- 
							
							 <a href="findUser">아이디/비밀번호 찾기</a> 
							 -->
							<a href="join">회원가입</a>
						</div>

					</div>

					<div id="lid" style="display: none">
				</c:when>

				<c:otherwise>
					<div id="lid">
				</c:otherwise>
			</c:choose>
			<form id="modal-form" method="post" action="Donate">
				<input type="hidden" name=moonNum value="${moonNum }">
				<div class="donor">
					<div class="name-radio">
						<label> <input type="radio" name="leavename"
							value="nominated" onclick="toggleDonorName()" checked>
							후원자 이름 남기기
						</label> <label><input type="radio" name="leavename"
							value="anonymous" onclick="toggleAnonymous()">익명으로 후원하기 </label>

					</div>

					<input type=text id="donorNameInput" name=donorNameInput
						placeholder="후원자 이름" value=""> <span id="nameError"
						class="error-message"> 이름을 입력해주세요 </span>

				</div>

				<div class="donate">
					<div class="money-btn">
						<button type="button" onclick="setAmount(1000)">1천원</button>
						<button type="button" onclick="setAmount(5000)">5천원</button>
						<button type="button" onclick="setAmount(10000)">1만원</button>
						<button type="button" onclick="setAmount(20000)">2만원</button>
						<button type="button" onclick="setAmount(50000)">5만원</button>
						<button type="button" onclick="setAmount(100000)">10만원</button>
						<button type="button" onclick="enableCustomAmount()">직접입력</button>
					</div>

					<div class="moneyMsg-input">
						<input type="text" class="moneyInput" name="moneyInput"
							id="moneyInput" placeholder="후원금액" maxlength="9" value=""
							oninput="checkNumber(this)"> <input type="text"
							class="messageInput" name="messageInput" id="messageInput"
							placeholder="마음을 전해보세요(최대 50자)" maxlength="50"
							oninput="checkMessage()"> <span id="msgError"
							class="error-message"> 메세지를 입력해주세요 </span> <span id="moneyError"
							class="error-message"> 후원금을 입력해주세요 </span>
					</div>

				</div>

				<input class="nextbtn" type="button" onclick="showCardInput()"
					value="다음">
	</div>


	<div class="cardform" id="cs" style="display: none;">
		<jsp:include page="/cardInput">
			<jsp:param name="additionalData" value="Some Value" />

		</jsp:include>

	</div>



	</form>
	</div>

	</section>
	<jsp:include page="/footer"></jsp:include>
	</div>



</body>

</html>