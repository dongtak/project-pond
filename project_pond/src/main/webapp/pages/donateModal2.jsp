<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
     .error-message {
            display: none;
            color: red;
        }
</style>
<body>

    <form action="" method="post">
        <div class="donorInfo">
         <label for="donorName">성함</label>
<input type="text" name="donorName" id="donorName" placeholder="성함">
<span id="nameError" class="error-message">성함을 입력해주세요</span>

<label for="donorBirth">생년월일</label>
<input type="text" name="donorBirth" id="donorBirth" placeholder="생년월일">
<span id="birthError" class="error-message">생년월일을 입력해주세요</span>

<label for="donorPhone">전화번호</label>
<input type="tel" name="donorPhone" id="donorPhone" placeholder="전화번호">
<span id="phoneError" class="error-message">전화번호를 입력해주세요</span>

<label for="donorEmail">이메일</label>
<input type="email" name="donorEmail" id="donorEmail" placeholder="이메일">
<span id="emailError" class="error-message">이메일을 입력해주세요</span>

<label for="cardType">카드 타입</label>
<select name="cardType" id="cardType">
    <option value="">카드 타입 선택</option>
    <option value="visa">Visa</option>
    <option value="mastercard">Mastercard</option>
</select>
<span id="cardTypeError" class="error-message">카드 타입을 선택해주세요</span>

<label for="cardNumber">카드번호</label>
<input type="text" name="cardNumber" id="cardNumber" placeholder="카드번호">
<span id="cardNumberError" class="error-message">카드번호를 입력해주세요</span>

<label for="cardPassword">카드 비밀번호 2자리</label>
<input type="text" name="cardPassword" id="cardPassword" placeholder="카드 비밀번호 2자리">
<span id="cardPasswordError" class="error-message">카드 비밀번호를 입력해주세요</span>

<label for="cardExpiration">카드 유효기간</label>
<input type="text" name="cardExpiration" id="cardExpiration" placeholder="카드 유효기간">
<span id="cardExpirationError" class="error-message">카드 유효기간을 입력해주세요</span>

<span id="blankError" class="error-message">필수항목을 입력해주세요</span>

<input type="button" id="payCheck" onclick="payInfoCheck()" value="결제하기">


        <input type="button" id="payCheck" onclick="payInfoCheck(form)" value="결제하기">

    </form>

</body>
<script>

    function payInfoCheck(htmlForm) {
    	 var donorName = document.getElementById("donorName");
         var donorBirth = document.getElementById("donorBirth");
         var donorPhone = document.getElementById("donorPhone");
         var donorEmail = document.getElementById("donorEmail");
         var cardType = document.getElementById("cardType");
         var cardNumber = document.getElementById("cardNumber");
         var cardPassword = document.getElementById("cardPassword");
         var cardExpiration = document.getElementById("cardExpiration");
         var nameError = document.getElementById("nameError");
         var birthError = document.getElementById("birthError");
         var phoneError = document.getElementById("phoneError");
         var emailError = document.getElementById("emailError");
         var cardTypeError = document.getElementById("cardTypeError");
         var cardNumberError = document.getElementById("cardNumberError");
         var cardPasswordError = document.getElementById("cardPasswordError");
         var cardExpirationError = document.getElementById("cardExpirationError");

         var fields = [
             { input: donorName, error: nameError },
             { input: donorBirth, error: birthError },
             { input: donorPhone, error: phoneError },
             { input: donorEmail, error: emailError },
             { input: cardType, error: cardTypeError },
             { input: cardNumber, error: cardNumberError },
             { input: cardPassword, error: cardPasswordError },
             { input: cardExpiration, error: cardExpirationError }
         ];

         var firstEmptyField = null;

         // 빈칸 검사
         for (var i = 0; i < fields.length; i++) {
             var field = fields[i];
             if (!field.input.value.trim()) {
                 field.error.style.display = "block";
                 if (!firstEmptyField) {
                     firstEmptyField = field.input;
                 }
             }
         }
         
        if (result === 1) {
            htmlForm.submit();
        }

    }



</script>
</html>