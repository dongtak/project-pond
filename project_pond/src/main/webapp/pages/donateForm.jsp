<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/form.css">



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

					<button class="lodBtn btn" onclick="showLogin()">로그인 후
						후원하기</button>
					<button class="lidBtn btn" onclick="showPayment()">비회원
						후원하기</button>

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
					<label> <input type="radio" name="leavename"
						value="nominated" onclick="toggleDonorName()" checked> 후원자 이름
						남기기
					</label> 
					<label><input type="radio" name="leavename" value="anonymous" onclick="toggleAnonymous()">익명으로 후원하기
					</label> <br /> <span id="nameError" class="error-message"> 후원옵션을
						선택해주세요 </span> <input type=text id="donorNameInput" name=donorName placeholder="후원자 이름"
						value="">
				</div>

				<div class="donate">
					<button type="button" onclick="setAmount(1000)">1천원</button>
					<button type="button" onclick="setAmount(5000)">5천원</button>
					<button type="button" onclick="setAmount(10000)">1만원</button>
					<button type="button" onclick="setAmount(20000)">2만원</button>
					<button type="button" onclick="setAmount(50000)">5만원</button>
					<button type="button" onclick="setAmount(100000)">10만원</button>
					<button type="button" onclick="enableCustomAmount()">직접입력</button>

					<input type="text" class="moneyInput" name="moneyInput"
						id="moneyInput" placeholder="후원금액" numberonly="" maxlength="9"
						tabindex="0" disabled value="" oninput = "checkNumber(value)"> <input type="text"
						class="messageInput" name="messageInput" id="messageInput"
						placeholder="마음을 전해보세요"> <span id="moneyError"
						class="error-message"> 후원금을 입력해주세요 </span> <br> 
				</div>
				<input
						type="submit" value="후원하기test">
				</div>
				<input type="button" onclick="showCardInput()" value="다음">
				
				<div class="cardform" id="cs" style="display:none;">
				<jsp:include page="/cardInput">
				 <jsp:param name="additionalData" value="Some Value" />
				
				</jsp:include>
				<input
						type="button" onclick="nameAndNumber(form)" value="후원하기">
				</div>
				
			

			</form>
	</div>

	</section>
	<jsp:include page="/footer"></jsp:include>
	</div>



</body>
<script type="text/javascript">
	function showLogin() {
		document.getElementById("lod").style.display = "block";
		document.getElementById("lid").style.display = "none";
	}

	function showPayment() {
		document.getElementById("lod").style.display = "none";
		document.getElementById("lid").style.display = "block";
	}
	
	function toggleDonorName(){
		document.getElementById("donorNameInput").disabled=false;
		document.getElementById("donorNameInput").focus();
		
	}
	
	function toggleAnonymous() {
		  var donorNameInput = document.getElementById("donorNameInput");
		  donorNameInput.disabled = true;

		  var randomWords = ["천사", "영웅", "따뜻한 사람","후원대장","윌스미스의 보이는 손", "헌신자", "빌게이츠", "father teresa", "0.6 예수님", "선행을붓다"];
		  var randomIndex = Math.floor(Math.random() * randomWords.length);
		  var randomWord = randomWords[randomIndex];

		  donorNameInput.value = randomWord;
		}

		function toggleDonorName() {
		  var donorNameInput = document.getElementById("donorNameInput");
		  donorNameInput.disabled = false;
		  donorNameInput.focus();
		}

	function setAmount(amount) {
		var moneyInput = document.getElementById("moneyInput");
		moneyInput.value = amount;
		moneyInput.disabled = true;
	}

	function enableCustomAmount() {
		var moneyInput = document.getElementById("moneyInput");
		moneyInput.value = "";
		moneyInput.disabled = false;
	}
	var button = document.getElementById("cs");
	var isNext = true;


	 function showCardInput() {
	        var lid = document.getElementById("lid");
	        var cs = document.getElementById("cs");

	        if (isNext) {
	    	    button.value = "이전";
	    	    lid.style.display = "none";
		       	cs.style.display = "block";
	    	  } else {
	    	    button.value = "다음";
	    	    lid.style.display = "block";
		       	cs.style.display = "none";
		       	
	    	  }
	        
	       
	    }

	 
	function nameAndNumber(form) {
		var leavenameRadios = document.getElementsByName("leavename");
		var donorNameInput = document.getElementsByName("donorname")[0];
		var nameError = document.getElementById("nameError");
		var moneyInput = document.getElementById("moneyInput");
		var moneyError = document.getElementById("moneyError");

		var selectedLeaveName = false;
		for (var i = 0; i < leavenameRadios.length; i++) {
			if (leavenameRadios[i].checked) {
				selectedLeaveName = true;
				break;
			}
		}

		if (!selectedLeaveName) {
			nameError.style.display = "block";
			return;
		} else {
			nameError.style.display = "none";
		}

		if (leavenameRadios[0].checked && donorNameInput.value.trim() === "") {
			nameError.style.display = "block";
			return;
		}

		if (moneyInput.value === "") {
			moneyError.style.display = "block";
			return;
		} else {
			moneyError.style.display = "none";
		}

		console.log()
		form.submit();
	}

	function checkNumber(input) {
		  input.value = input.value.replace(/\D/g, "");
		}
	
	function checkValue(form) {
		var idInput = document.getElementById("id");
		var pwdInput = document.getElementById("pwd");
		var errorId = document.getElementById("error-id");
		var errorPwd = document.getElementById("error-password");

		if (idInput.value.trim() === "") {
			errorId.style.display = "block";
			return;
		} else {
			errorId.style.display = "none";
		}

		if (pwdInput.value.trim() === "") {
			errorPwd.style.display = "block";
			return;
		} else {
			errorPwd.style.display = "none";
		}

		form.submit();
	}
</script>

</html>