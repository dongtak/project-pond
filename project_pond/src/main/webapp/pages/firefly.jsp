<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>

<link rel="stylesheet" href="../resources/style/firefly.css">
</head>
<style>
@charset "UTF-8";

.fireflypack {
	margin: 0 auto;
	height: 90vh;
	position: relative;
}

.firefly {
	width: 4px;
	height: 4px;
	position: absolute;
	background-color: #00ff2a;
	box-shadow: 0px 0px 17px 2px rgb(120, 255, 131);
	border-radius: 50%;
}

.box {
	position: absolute;
	width: 40px;
	height: 40px;
	transition: width 0.4s, height 0.4s;
	cursor: pointer;
	border-radius: 50%;
	left: -17px;
	top: -17px;
}

.box.expanded {
	width: 200px;
	height: 120px;
}

.box:hover {
	background: #34ff02;
}

.box .content {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	transition: opacity 0.4s;
	background-color: #5050509a;
	border-radius: 15px;
}

.box.expanded .content {
	display: block;
	opacity: 1;
}

.box.expanded:hover {
	background: none;
}
</style>
<body class=ffp>
	 <div class="fireflypack"></div>
</body>

<script src="../resources/script/firefly.js"></script>
<script type="text/javascript">
/**
 * 
 */
/*
	 fireflies 변수에는 불이 날아다니는 개수를 저장합니다. 
이 예시에서는 100으로 설정되어 있습니다.
$container 변수는 .container 클래스를 가진 요소를 선택하여 jQuery 객체로 저장합니다.
$containerWidth 변수에는 $container 요소의 너비를 저장합니다. 
.width() 메서드는 요소의 가로 크기를 반환합니다.
$containerHeight 변수에는 $container 요소의 높이를 저장합니다. 
.height() 메서드는 요소의 세로 크기를 반환합니다.
*/
var fireflies = 100;
var $fireflypack = $(".fireflypack");
var $ffpackWidth = $fireflypack.width();
var $ffpackHeight = $fireflypack.height();


/*
fireflies 변수의 값만큼 반복하는 for 루프를 시작합니다. 
이 예시에서는 100번 반복합니다.
firefly 변수에는 jQuery를 사용하여 <div> 요소를 생성하고, 
firefly 클래스를 추가한 객체를 저장합니다.
*/
for (var i = 0; i < fireflies; i++) {
	var firefly = $('<div class="firefly"> <div class="box"><div class="content"><span>사랑해요</span></div></div></div>');
	TweenLite.set(firefly, {
		/*
TweenLite.set() 메서드를 사용하여 firefly 요소의 초기 속성을 설정합니다. 
여기서는 x와 y 속성을 무작위로 설정하여 요소가 화면 내의 임의의 위치에 표시되도록 합니다.
		*/
		x: Math.random() * $ffpackWidth,
		y: Math.random() * $ffpackHeight
	});
	/*
$container 요소에 firefly 요소를 추가합니다. 
이로써 .container 요소 내에 firefly 요소가 생성되고 보여지게 됩니다.
	*/
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
</html>