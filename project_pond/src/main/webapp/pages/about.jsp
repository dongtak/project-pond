<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/style/form.css">
<link rel="stylesheet" href="resources/style/about.css">
<link rel="stylesheet" href="resources/style/reset.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
#main-section {
	width: 100%;
	margin: 0 auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">

			<div class="parallax scroll-content">
				<div class="about">
					<h1 class="per slide-up">
						<img src='https://ifh.cc/g/cpVYkh.png' border='0' width=100 height=100>
					</h1>

					<h1 class="per slide-up">
						<span id="percentTxt">0</span> %
					</h1>
					<h1 class="per slide-up">기부 달성</h1>



				</div>

				<div class="container title1 ">
					<div class="content1">

						<h1 class="slide-up">기부의 첫걸음을 환영합니다.</h1>


						<p>우리는 100% 기부 달성을 목표로 여러분과 함께하고자 합니다.</p>
						<p>마치 밤하늘을 수놓은 작은 반딧불들처럼,</p>
						<p>작은 빛들이 모여 함께한다면 우리는 큰 변화를 이룰 수 있다고 믿습니다.</p>
					</div>
				</div>


				<div class="container title2 ">
					<div class="content2">

						<h1 class="slide-up">당신의 작은 메세지를 담아보세요</h1>
						<p>이곳은 여러분의 작은 메세지를 담을 수 있는 공간입니다.</p>
						<p>우리 모두가 작은 개별 기부자일지라도,</p>
						<p>우리가 함께 모인다면 큰 변화를 만들어낼 수 있습니다.
						<p>작은 기부, 작은 메세지로 시작하여</p>
						<p>우리는 100% 기부 목표를 달성할 수 있습니다.</p>



					</div>

				</div>

				<div class="container title3 ">
					<div class="content3">

						<h1 class="slide-up">작은 빛들을 모아 큰 빛을 만들어봐요</h1>
						<p>이 여정에 함께해주셔서 감사합니다</p>

					</div>

				</div>


			</div>



			<div class="scroll">
				<button class="scrollTop" onclick="scrollToTop();">TOP</button>
			</div>




		</section>


		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
<script>
	function scrollToTop() {
		$("html, body").animate({
			scrollTop : 0
		}, "slow");
	}

	var count = 0;
	var span = document.getElementById("percentTxt");

	function increaseNumber() {
		span.innerText = count;
		count++;

		if (count <= 100) {
			setTimeout(increaseNumber, 10);
		}
	}

	increaseNumber();
</script>

</html>