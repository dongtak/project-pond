 function setAmount(amount) {
        document.getElementById("cntrAmount").value = amount;
    }

    function enableCustomAmount() {
        var amountInput = document.getElementById("cntrAmount");
        amountInput.value = "";
        amountInput.disabled = false;
        amountInput.focus();
    }

    function nameAndNumber() {
        var nameValue = document.querySelector('input[name="leavename"]:checked');
        var nameError = document.getElementById("nameError");
        var customAmountInput = document.getElementById("cntrAmount");
        var moneyError = document.getElementById("moneyError");
        var resultN = nameValue !== null ? 1 : 0;
        if(resultN===0){
            nameError.style.display="block";
        }else{
            nameError.style.display="none";
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
            if(nameValue==="anonymous"){
                
            }
            var form = document.getElementById("modal-form");
            var url = "modal2.html?" + new URLSearchParams(new FormData(form)).toString();
            window.location.href = url;
        }
    }
