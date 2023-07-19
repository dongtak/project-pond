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
	<c:set var="moonUp" value="${sessionScope.moonUp }" />
	<c:set var="id" value="${sessionScope.log }" />
	<c:set var="moonUpPay" value="${requestScope.moonUpPay }" />
	<!-- pay 객체 리스트 -->
	<div id="wrap">
		<div id="back-img">
			<jsp:include page="/header"></jsp:include>
			<div class="section">
				<div class="firefly_base">
					<div class="fireflypack"></div>
					<div class="main_moon">
						<div class="moon-content">
							<c:set var="do_loof" value="true" />
							<c:set var="moonNum" value="${moonUp.getMoonNum() }" />
							<c:forEach var="loof" begin="1" end="${fn:length(moonNum)}">
								<c:if test="${do_loof eq true }">
									<c:choose>
										<c:when test="${fn:startsWith(moonNum, '0')}">
											<c:set var="moonNum"
												value="${fn:substringAfter(moonNum, '0')}" />
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
							<br> <span>달성률 : ${formattedMoney }% </span><br> <span>모금기간
								: ${moonUp.getCreatedAt() }</span> <a class="donateBtn" href="donate">후원하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
<script type="text/javascript">

/*
	 fireflies 변수에는 불이 날아다니는 개수를 저장합니다. 
이 예시에서는 100으로 설정되어 있습니다.
$container 변수는 .container 클래스를 가진 요소를 선택하여 jQuery 객체로 저장합니다.
$containerWidth 변수에는 $container 요소의 너비를 저장합니다. 
.width() 메서드는 요소의 가로 크기를 반환합니다.
$containerHeight 변수에는 $container 요소의 높이를 저장합니다. 
.height() 메서드는 요소의 세로 크기를 반환합니다.
*/
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
console.log(fireflies)
console.log(msg)
/*
fireflies 변수의 값만큼 반복하는 for 루프를 시작합니다. 
이 예시에서는 100번 반복합니다.
firefly 변수에는 jQuery를 사용하여 <div> 요소를 생성하고, 
firefly 클래스를 추가한 객체를 저장합니다.
*/


	// 반딧불이를 생성하는 부분
	for (var i = 0; i < fireflies; i++) {
	    var randomIndex = Math.floor(Math.random() * msg.length);
	    var randomName = msg[randomIndex].name;
	    var message = msg[randomIndex].message;

	    var firefly = $('<div class="firefly"> <div class="box"><div class="content"><span>' + randomName + '</span><br><span>' + message + '</span></div></div></div>');
	    TweenLite.set(firefly, {
	        x: Math.random() * $ffpackWidth,
	        y: Math.random() * $ffpackHeight
	    });

	    $fireflypack.append(firefly);
	    flyTheFirefly(firefly);
	}
/*
flyTheFirefly 함수를 호출하여 firefly 요소를 애니메이션화하여 움직이도록 설정합니다.
*/

/*
flyTheFirefly 함수는 개별 firefly 요소의 애니메이션을 관리합니다.
flyTl 변수는 개별 요소의 위치 애니메이션을 제어하는 gsap.timeline() 객체를 생성합니다.
fadeTl 변수는 요소의 투명도 애니메이션을 제어하는 또 다른 gsap.timeline() 객체를 생성합니다.
fadeTl.to() 메서드를 사용하여 요소의 투명도를 애니메이션화하여 깜빡이는 효과를 줍니다.
flyTl.set() 메서드를 사용하여 요소의 초기 크기를 설정하고, 
to() 메서드를 사용하여 요소를 애니메이션화하여 화면 내에서 임의의 위치로 이동하도록 합니다.
마지막으로, flyTheFirefly 함수를 재귀적으로 호출하여 요소가 계속해서 움직이도록 합니다.
*/
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