// 2. 직접입력 선택시 숫자만 입력 가능, 최대 9자리 숫자
function enableCustomAmount() {
  var moneyInput = document.getElementById("moneyInput");
  moneyInput.disabled = false;
  moneyInput.value = "";
  moneyInput.addEventListener("input", restrictToNumbers());
  validateAmount();
}

function restrictToNumbers() {
  this.value = this.value.replace(/[^0-9]/g, "").slice(0, 9);
}


// 폼 유효성 검사
function validateDonorName() {
  var donorNameInput = document.querySelector('input[name="donorNameInput"]');
  var nameError = document.getElementById("nameError");
  
  if (donorNameInput.value === ""||donorNameInput.value ===null) {
    nameError.style.display = "block";
  } else {
    nameError.style.display = "none";
  }
}

// 초기화




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


function showLogin() {//로그인창 보이기
		document.getElementById("lod").style.display = "block";
		document.getElementById("lid").style.display = "none";
		document.getElementById("cs").style.display = "none";
		
	}

	function showPayment() {//후원창 보이기
		document.getElementById("lod").style.display = "none";
		document.getElementById("lid").style.display = "block";
	}
	
	//
	
	function toggleDonorName(){//이름 남기기 버튼
		document.getElementById("donorNameInput").readOnly=false;
		document.getElementById("donorNameInput").focus();
		
	}
	
	
	function toggleAnonymous() {//익명 버튼
		  var donorNameInput = document.getElementById("donorNameInput");
		  donorNameInput.readOnly = true;
		  donorNameInput.value = "익명";
		}

		function toggleDonorName() {
		  var donorNameInput = document.getElementById("donorNameInput");
		  donorNameInput.readOnly = false;
		  donorNameInput.focus();
		  donorNameInput.value = "";
		}

	function setAmount(amount) {
		var moneyInput = document.getElementById("moneyInput");
		moneyInput.readOnly = true;
		moneyInput.value = amount;
	}

	function enableCustomAmount() {
		var moneyInput = document.getElementById("moneyInput");
		moneyInput.value = "";
		moneyInput.readOnly = false;
	}
	var button = document.getElementById("cs");
	var isNext = true;

	 

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
	
	function showCardInput() {
        var lid = document.getElementById("lid");
        var cs = document.getElementById("cs");
      
		var donorNameInput = document.getElementsByName("donorNameInput");
		var nameError = document.getElementById("nameError");
		var moneyInput = document.getElementById("moneyInput");
		var moneyError = document.getElementById("moneyError");

    	
    
    
		if(donorNameInput.value ===""){
			console.log("비어있")
			nameError.style.display="block";
			return;
		}else{
			nameError.style.display="none";
		}
		
		if (moneyInput.value === "") {
			moneyError.style.display = "block";
			return;
		} else {
			moneyError.style.display = "none";
		}
        
        if (isNext) {
    	    
    	    lid.style.display = "none";
	       	cs.style.display = "block";
	       	isNext = false;
    	  } else {
    	   
    	    lid.style.display = "block";
	       	cs.style.display = "none";
	       	isNext = true;
	       	
    	  }
    }


