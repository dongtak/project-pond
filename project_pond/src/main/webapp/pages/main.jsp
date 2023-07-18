<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
<title>나눗샘</title>
<link rel="stylesheet" href="resources/style/main.css">
<link rel="stylesheet" href="resources/style/firefly.css">
</head>
<body>
<c:set var="moonUp" value="${sessionScope.moonUp }"/>
<c:set var="id" value="${sessionScope.log }"/>
<c:set var="moonUpPay" value="${requestScope.moonUpPay }"/> <!-- pay 객체 리스트 -->
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class=firefly_base>
			<div class="fireflypack"></div>
			<section class="main_moon section">
				<div class="moon-content">
					<c:set var="do_loof" value="true" />
					<c:set var="moonNum" value="${moonUp.getMoonNum() }" />
					<c:forEach var="loof" begin="1" end="${fn:length(moonNum)}">
						<c:if test="${do_loof eq true }">
							<c:choose>
								<c:when test="${fn:startsWith(moonNum, '0')}">
									<c:set var="moonNum" value="${fn:substringAfter(moonNum, '0')}" />
								</c:when>
								<c:otherwise>
									<c:set var="do_loof" value="false" />
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					<h2>${moonUp.getTitle()}</h2>
					<span>${moonNum }회</span><br /> <span>목표모금액 :
						${moonUp.getGoal() }원</span><br /> <span>누적모금액 :
						${moonUp.getDonate()}원</span><br />
					<c:set var="money"
						value="${moonUp.getDonate() / moonUp.getGoal() * 100 }" />
					<fmt:formatNumber var="formattedMoney" value="${money}"
						pattern="#0.0" />
					<progress value="${formattedMoney }" max="100"></progress>
					<br /> <span>달성률 : ${formattedMoney }% </span><br />
					<span>달성률 : ${formattedMoney }% </span>
					
					<a class="donateBtn" href="donate">후원하기</a>
				</div>
			</section>

		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>



</body>
<script src="resources/script/firefly.js">

</script>

</html>