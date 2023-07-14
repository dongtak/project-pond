// <donor>
// 1. 후원자 이름 남기기가 기본으로 선택되어 있다
document.querySelector('input[name="leavename"][value="nominated"]').checked = true;

// 2. 익명 선택시 donorname disable 그리고 donorname value에 "익명"을 넣는다
function toggleDonorName(enable) {
  var donorNameInput = document.querySelector('input[name="donorname"]');
  donorNameInput.disabled = enable;
  donorNameInput.value = enable ? "" : "익명";
  validateDonorName();
}

// 3. 후원자 이름 남기기 선택시 donorname에 focus
function focusDonorName() {
  var donorNameInput = document.querySelector('input[name="donorname"]');
  donorNameInput.focus();
}

toggleDonorName(true);

// <donate>
// 1. button으로 후원금 선택시 inputmoney disable, 그리고 해당 금액이 cntrAmount의 value값으로 들어간다
// 예) 1만원 선택 시 cntrAmount 의 value는 10000
function setAmount(amount) {
  var customAmountInput = document.getElementById("moneyInput");
  customAmountInput.disabled = true;
  customAmountInput.value = amount.toString();
  validateAmount();
}

// 2. 직접입력 선택시 숫자만 입력 가능, 최대 9자리 숫자
function enableCustomAmount() {
  var moneyInput = document.getElementById("moneyInput");
  moneyInput.disabled = false;
  moneyInput.value = "";
  moneyInput.addEventListener("input", restrictToNumbers);
  validateAmount();
}

function restrictToNumbers() {
  this.value = this.value.replace(/[^0-9]/g, "").slice(0, 9);
}

// 3. 직접입력이 기본으로 선택되어 있다.
document.querySelector('button[onclick="enableCustomAmount()"]').click();

// 4. 후원금액이 1만원 이상부터 메세지 입력 가능, 1만원 미만일경우 메세지 disable, value는 공백("")
function validateAmount() {
  var customAmountInput = document.getElementById("moneyInput");
  var messageInput = document.getElementById("messageInput");
  
  if (parseInt(customAmountInput.value) >= 10000) {
    messageInput.disabled = false;
    messageInput.value = "";
  } else {
    messageInput.disabled = true;
    messageInput.value = "";
  }
}

// 폼 유효성 검사
function validateDonorName() {
  var donorNameInput = document.querySelector('input[name="donorname"]');
  var donorNameError = document.getElementById("nameError");
  
  if (donorNameInput.value.trim() === "") {
    donorNameError.style.display = "block";
  } else {
    donorNameError.style.display = "none";
  }
}

// 초기화
validateDonorName();
validateAmount();



function nameAndNumber(htmlForm) {
	var nameValue = document.querySelector('input[name="leavename"]:checked');
	var nameError = document.getElementById("nameError");
	var customAmountInput = document.getElementById("moneyInput");
	var moneyError = document.getElementById("moneyError");
	var resultN = nameValue !== null ? 1 : 0;
	var url;
	if (resultN === 0) {
		nameError.style.display = "block";
	} else {
		nameError.style.display = "none";
	}
	var resultM = 0;

	if (customAmountInput.disabled && customAmountInput.value === "") {
		moneyError.style.display = "block";
	} else if (!customAmountInput.disabled && customAmountInput.value === "") {
		moneyError.style.display = "block";
	} else {
		moneyError.style.display = "none";
		resultM = 1;
	}


	if (resultN === 1 && resultM === 1) {

		htmlForm.submit();

		alert("test");
		//if (nameValue === "anonymous") {
		//	url="anonymous?"
		//}else{
		//	url="modal2?"
		//}

		//	form = document.getElementById("modal-form");
		//	url += new URLSearchParams(new FormData(form)).toString();
		//	console.log(url)
		//	window.location.href = url;
	} 
}



