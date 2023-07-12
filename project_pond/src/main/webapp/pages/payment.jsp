<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <input ty.pe="text" id="donorName" name="donorName" placeholder="성함">
            <input type="email" id="donorEmail" name="donorEmail" placeholder="이메일">
            <input type="tel" id="donorPhone" name="donorPhone" placeholder="전화번호">
        </div>
        <div class="cardInfo">
            <select name="" id=""></select>
            <input type="text" name="cnum" id="cnum" placeholder="카드번호">
            <input type="text" name="cpwd" id="cpwd" placeholder="카드 비밀번호 2자리">
            <input type="text" name="cexpire" id="cexpire" placeholder="카드 유효기간">
            <span id="blankError" class="error-message">필수항목을 입력해주세요</span>

        </div>

        <input type="button" id="payCheck" onclick="payInfoCheck(form)" value="결제하기">

    </form>
</body>
<script>
      function payInfoCheck(htmlForm) {
        var donorValue = document.getElementById("donorName").value;
        var radioValue = document.querySelector('input[name="myRadio"]:checked');
        var selectError = document.getElementById("selectError");
        var radioError = document.getElementById("radioError");

        var result = 0;
        if (selectValue === "") {
            selectError.style.display = "block";
            result = 0;
        } else {
            selectError.style.display = "none";
            result = 1;
        }

        if (radioValue === null) {
            radioError.style.display = "block";
            result = 0;
        } else {
            radioError.style.display = "none";
            result = 1;
        }

        if (result === 1) {
            htmlForm.submit();
        }

    }
</script>
</html>