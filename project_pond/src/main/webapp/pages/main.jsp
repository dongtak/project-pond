<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/images/favicon-32x32.png">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
<title>나눗샘</title>
<link rel="stylesheet" href="resources/style/main.css">
<link rel="stylesheet" href="resources/style/firefly.css">
</head>
<body>
	<c:set var="moonUp" value="${sessionScope.moonUp }" />
	<c:set var="id" value="${sessionScope.log }" />
	<c:set var="moonUpPay" value="${requestScope.moonUpPay }" />
	<!-- pay 객체 리스트 -->
	<div id="wrap">
		<div id="back-img">
			<jsp:include page="/header"></jsp:include>
			<div class="section">
				<div class="notice-box">
					<span class="icon">🌟</span> <span class="hover-text">*반딧불이를
						눌러보세요!</span>
				</div>
				<div class="firefly_base">
					<div class="fireflypack"></div>
					<div href="moon" class="main_moon">
						<div class="moon-content">
							<c:set var="do_loof" value="true" />
							<c:set var="moonNum" value="${moonUp.getMoonNum() }" />
							<h2>${moonUp.getTitle()}</h2>
							<span> <c:set var="num"
									value="${fn:substringAfter(moonNum, '0')}" /> <c:set
									var="do_loof" value="true" /> <c:forEach var="item" begin="1"
									end="${fn:length(num)}">
									<c:if test="${do_loof eq true }">
										<c:choose>
											<c:when test="${fn:startsWith(num, '0')}">
												<c:set var="num" value="${fn:substringAfter(num, '0')}" />
											</c:when>
											<c:otherwise>
												<c:set var="do_loof" value="false" />
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach> ${num }회
							</span><br> <span>목표모금액 : ${moonUp.getGoal() }원</span><br> <span>누적모금액
								: ${moonUp.getDonate()}원</span><br>
							<c:set var="money"
								value="${moonUp.getDonate() / moonUp.getGoal() * 100 }" />
							<fmt:formatNumber var="formattedMoney" value="${money}"
								pattern="#0.0" />
							<progress value="${formattedMoney }" max="100"></progress>
							<br> <span class="moon_status">달성률 : ${formattedMoney }%
							</span><br> <span>모금기간 : ${moonUp.getCreatedAt() }</span> <a
								class="donateBtn" href="donate">후원하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
<script type="text/javascript">


var fireflies;
var $fireflypack = $(".fireflypack");
var $ffpackWidth = $fireflypack.width();
var $ffpackHeight = $fireflypack.height();

var msg = [
	  <c:forEach items="${moonUpPay}" var="pay" varStatus="status">
	    {
	      name: "${pay.name}",
	      message: "${pay.message}"
	    }<c:if test="${not status.last}">,</c:if>
	  </c:forEach>
	];

if (msg.length > 100) {
    fireflies = 100;
} else {
    fireflies = msg.length;
}

	// 반딧불이를 생성하는 부분
	for (var i = 0; i < fireflies; i++) {
		 
		if(msg.length>100){
			var randomIndex = Math.floor(Math.random() * msg.length);
		    var randomName = msg[randomIndex].name;
		    var message = msg[randomIndex].message;
		    
		    var firefly = $('<div class="firefly"> <div class="box"><div class="content"><span>' + randomName + '</span><br><span>' + message + '</span></div></div></div>');

		}
		
		  
	    var firefly = $('<div class="firefly"> <div class="box"><div class="content"><span>' + msg[i].name+ '</span><br><span>' +  msg[i].message + '</span></div></div></div>');
	 
	   
	    TweenLite.set(firefly, {
	        x: Math.random() * $ffpackWidth,
	        y: Math.random() * $ffpackHeight
	    });

	    $fireflypack.append(firefly);
	    flyTheFirefly(firefly);
	}
function flyTheFirefly(elm) {
	var flyTl = gsap.timeline();
	var fadeTl = gsap.timeline({
		delay: Math.floor(Math.random() * 2) + 1,
		repeatDelay: Math.floor(Math.random() * 6) + 1,
		repeat: -1
	});

	//반딧불이 발광효과
	fadeTl.to(
		[elm],
		0.25,
		{ opacity: 0.25, yoyo: true, repeat: 1, repeatDelay: 0.2, yoyo: true },
		Math.floor(Math.random() * 6) + 1
	);

	//반딧불이 이동
	flyTl
		.set(elm, { scale: Math.random() * 0.75 + 0.5 })
		.to(elm, Math.random() * 100 + 100, {
			x: Math.random() * $ffpackWidth,
			y: Math.random() * $ffpackHeight,
			onComplete: flyTheFirefly,
			onCompleteParams: [elm]
		});
} 



$(document).ready(function() {
	$(".box").click(function() {
		$(this).toggleClass("expanded");
	});
});
</script>
<!-- <script src="resources/script/firefly.js">

</script> -->

</html>