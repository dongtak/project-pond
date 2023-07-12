<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
    <a href="login">로그인하기</a>



    <h2>비회원 후원</h2>
    <form action="" method="post">
        <div class="donorInfo">
            <label for="donorName">성함</label>
            <input type="text" id="donorName" name="donorName" placeholder="성함">
            <span id="nameError" class="error-message">성함을 입력해주세요</span>
            <br>

            <label for="donorBirth">생년월일</label>
            <input type="text" id="donorBirth" name="donorBirth" placeholder="생년월일">
            <span id="birthError" class="error-message">생년월일을 입력해주세요</span>
            <br>

            <label for="donorPhone">전화번호</label>
            <input type="tel" id="donorPhone" name="donorPhone" placeholder="전화번호">
            <span id="phoneError" class="error-message">전화번호를 입력해주세요</span>
            <br>

            <label for="donorEmail">이메일</label>
            <input type="email" id="donorEmail" name="donorEmail" placeholder="이메일">
            <span id="emailError" class="error-message">이메일을 입력해주세요</span>
            <br>


        </div>
        <div class="cardInfo">
            <label for="cardType">카드 종류</label>
            <select name="cardType" id="cardType">
                <option value="">선택하세요</option>
                <option value="visa">Visa</option>
                <option value="mastercard">Mastercard</option>
                <option value="amex">Amex</option>
            </select>
            <span id="cardTypeError" class="error-message">카드사를 선택해주세요</span>
            <label for="cnum">카드번호</label>
            <input type="text" name="cnum" id="cnum" placeholder="카드번호">
            <span id="cardNumberError" class="error-message">카드번호를 입력해주세요</span>
            <label for="cpwd">카드 비밀번호 2자리</label>
            <input type="text" name="cpwd" id="cpwd" placeholder="카드 비밀번호 2자리" maxlength="2">
            <span id="cardPasswordError" class="error-message">카드비밀번호를 입력해주세요</span>

            <input type="text" name="cexpire" id="cexpire" placeholder="카드 유효기간">
            <label for="cardExpYear">카드 유효기간</label>
            <select name="cardExpYear" id="cardExpiration">
                <c:forEach var="year" begin="23" end="50" step="1">
                    <option value=${year}>${year}</option>
                </c:forEach>

            </select>

            <select name="cardExpMonth" id="cardExpiration">
                <c:forEach var="month" begin="1" end="12" step="1">
                    <option value=${month}>${month}</option>
                </c:forEach>
              

            </select>

        </div>
        <input type="button" id="payCheck" onclick="payInfoCheck()" value="결제하기">

    </form>

</body>
</html>