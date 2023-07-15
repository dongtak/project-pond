<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/form.css">

<style type="text/css">
#lid { 
display:none; 
}
</style>

</head>

<body>
<c:set var="moonUp" value="${sessionScope.moonUp }"/>
<c:set var="id" value="${sessionScope.log }"/>
<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
					
				<!-- 
				페이지 접속시 기본적으로 #lid 의 display none;
				lodBtn클릭시 lid display none
				lidBtn클릭시 lod display none
				 -->
				
				<c:choose> 
			<c:when test="${empty log}">
				
			<button class="lodBtn btn" onclick="showLogin()">로그인 후 후원하기</button>
			<button class="lidBtn btn" onclick="showPayment()">비회원 후원하기</button>
			
			<div id="lod">
				<form action="Login" class="user-form" method="POST">
				<h1>로그인</h1>
				<input type="text" placeholder="아이디 입력" class="user-input" id="id" name="id">
				<ul>
					<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
				</ul>

				<input type="password" class="user-input" placeholder="비밀번호 입력" id="pwd" name="pwd">
				<ul>
					<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
				</ul>
				<input type="button" id="submit-btn" onclick="checkValue(form)" value=" 로그인">
			</form>
			<div class="bottom-nav">
			<a href="findUser">아이디/비밀번호 찾기</a> <a href="join">회원가입</a>
			</div>
								
			</div>
			</c:when>
			</c:choose>

				<!--페이지 접속시 후원자이름 남기기 radio 체크상태
					익명 radio선택시 후원자명 입력 불가
					이름남기기 radio 선택시 직접 입력가능, 빈칸으로 제출시 에러메시지 출력
					직접입력으로 입력 후 제출 시,입력된 값이  donorname의 value로 제출
					익명선택 후 제출 시 donorname value 는 멋쟁이,천사 등의 단어로 넣어줘 
				-->
				
			<div id = "lid">
			<form id="modal-form" method="post" action="">
					<div class="donor">
							
						<label> <input type="radio" name="leavename"
							value="nominated" onclick="toggleDonorName(true)"> 후원자 이름
							남기기
						</label> <label> <input type="radio" name="leavename"
							value="anonymous" onclick="toggleDonorName(false)"> 익명으로
							후원하기
						</label> <br/> <span id="nameError" class="error-message">
							후원옵션을 선택해주세요 </span> 
							<input type=text name=donorname placeholder="후원자 이름" value=""> 
								
					</div>


<!-- 
					1000원버튼이 기본으로 선택 되어 있도록 해줘
					버튼으로 금액입력시 해당 값이 moneyInput의 value에 들어가도록 해줘
					버튼으로 금액입력시 moneyInput disable 
					직접입력 선택시 moneyInput에 직접 입력 가능(숫자만 입력,최대 9자리)
 -->
					<div class="donate">
						<button type="button" onclick="setAmount(1000)">1천원</button>
						<button type="button" onclick="setAmount(5000)">5천원</button>
						<button type="button" onclick="setAmount(10000)">1만원</button>
						<button type="button" onclick="setAmount(20000)">2만원</button>
						<button type="button" onclick="setAmount(50000)">5만원</button>
						<button type="button" onclick="setAmount(100000)">10만원</button>
						<button type="button" onclick="enableCustomAmount()">직접입력</button>
						
						<input type="text" class="moneyInput" name="moneyInput"
							id="moneyInput" placeholder="후원금액" numberonly=""
							maxlength="9" tabindex="0" disabled value=""> <input
							type="text" class="messageInput" name="messageInput"
							id="messageInput" placeholder="마음을 전해보세요"> 
							<span
							id="moneyError" class="error-message"> 후원금을 입력해주세요 </span> <br>
						
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

function toggleDonorName(enable) {
  var donorNameInput = document.getElementsByName("donorname")[0];
  donorNameInput.disabled = !enable;
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

  if (moneyInput.value === "" ) {
    moneyError.style.display = "block";
    return;
  } else {
    moneyError.style.display = "none";
  }

  console.log()
  form.submit();
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