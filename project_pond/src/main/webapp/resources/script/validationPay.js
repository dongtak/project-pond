
// 1. 후원자 이름 남기기가 기본값으로 선택되어 있음
document.querySelector('input[name="leavename"][value="anonymous"]').checked = true;

// 2. 익명 선택시 donorname disable 후 anonymous를 value로 입력
function toggleDonorName(enable) {
	var donorNameInput = document.querySelector('input[name="donorname"]');
	donorNameInput.disabled = enable;
	donorNameInput.value = enable ? "" : "후원자 이름";
}

toggleDonorName(true);

// 3. 후원금을 button으로 선택시 inputmoney disable후 value에 해당 값을 입력
function setAmount(amount) {
	var customAmountInput = document.getElementById("cntrAmount");
	customAmountInput.disabled = true;
	customAmountInput.value = amount;

	var messageInput = document.getElementById("messageInput");
	if (amount >= 10000) {
		messageInput.disabled = false;
	} else {
		messageInput.disabled = true;
		messageInput.value = "";
	}
	
}

// 4. 직접입력시에는 숫자만 입력 가능
function enableCustomAmount() {
	var customAmountInput = document.getElementById("cntrAmount");
	customAmountInput.disabled = false;
	customAmountInput.value = "";
	customAmountInput.addEventListener("input", restrictToNumbers);
	customAmountInput.addEventListener("input", checkAmountAndToggleMessageInput);
}

function restrictToNumbers() {
	this.value = this.value.replace(/[^0-9]/g, "");
}


function checkAmountAndToggleMessageInput() {
	var customAmountInput = document.getElementById("cntrAmount");
	var messageInput = document.getElementById("messageInput");

	// 직접입력으로 만원 이상인 경우 메시지 입력란 활성화
	if (parseInt(customAmountInput.value) >= 10000) {
		messageInput.disabled = false;
	} else {
		messageInput.disabled = true;
		messageInput.value = "";
	}
}

// 초기화
setAmount(10000);

function enableCustomAmount() {
	var amountInput = document.getElementById("cntrAmount");
	amountInput.value = "";
	amountInput.disabled = false;
	amountInput.focus();
}

function nameAndNumber(htmlForm) {
	var nameValue = document.querySelector('input[name="leavename"]:checked');
	var nameError = document.getElementById("nameError");
	var customAmountInput = document.getElementById("cntrAmount");
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
	} else {
		var donorNameInput = document.querySelector('input[name="donorname"]');
		var customAmountInput = document.getElementById("cntrAmount");
		var messageInput = document.getElementById("messageInput");
		var errorMessage = document.getElementById("moneyError");

		if (donorNameInput.value.trim() === "" || customAmountInput.value.trim() === "" || parseInt(customAmountInput.value) < 10000) {
			errorMessage.style.display = "block";
		} else {
			errorMessage.style.display = "none";
		}

	}
}



