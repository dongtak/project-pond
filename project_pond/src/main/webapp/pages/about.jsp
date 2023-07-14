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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
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
			<h1>hello pond</h1>

			<div class="parallax scroll-content">
				<div class="about">
					<h1>ABOUT</h1>


					<h1 class="per slide-up">
						<span id="percentTxt">0</span> %
					</h1>
					<h1 class="per slide-up">기부 달성</h1>
					<h1 class="per slide-up"><i class="fa-solid fa-box-heart"></i>
</h1>
					<p>소개</p>


				</div>

				<div class="container title1 ">
					<div class="content1">

						<h1 class="slide-up">나도 기부란걸 해볼까?</h1>


						<p>라고 생각했지만, 어디서 어떻게 기부를 시작해야할지기부사이트를 봐도 
						</p><p>정기후원, 결연 후원이라는 방식이
							부담스럽게 다가왔습니다.</p>
					</div>
				</div>


				<div class="container title2 ">
					<div class="content2">

						<h1 class="slide-up">기부가 어렵고, 부담스럽게 느껴지는 분들을 위해</h1>

						<p>가벼운 마음으로 기부 활동을 시작할 수 있는 방법이 없을까</p>
						<p>라는 생각에서 시작했습니다.</p>



					</div>

				</div>

				<div class="container title3 ">
					<div class="content3">

						<h1 class="slide-up">한번에 한개의 후원에 집중해 목표액 달성률을 높여주는 방향성을 제시해
							보고자 합니다.</h1>


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
function scrollToTop(){
	$("html, body").animate({ scrollTop: 0 }, "slow");
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