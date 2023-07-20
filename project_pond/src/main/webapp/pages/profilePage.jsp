<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/images/favicon-32x32.png">
<link rel="stylesheet" href="resources/style/form.css">
<script src="../resources/script/comments-api.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<title>Insert title here</title>
<style>
.profile-container {
	text-align: center;
}

.profile-contents {
	display: flex;
	justify-content: center;
	
}
.profile-contents div{
margin:0 30px;}


.profile-contents ul {
	border: 1px solid black;

}
</style>

</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>

		<div id="section">


			<div class="profile-container">

				<h1>PROFILE</h1>
				<div class="profile-contents">
					<div>
						<ul>
							<li>사진</li>
							<li>이름</li>
							<li>깃허브주소</li>
							<li>이메일주소</li>
						</ul>
					</div>

					<div>
						<ul>
							<li>사진</li>
							<li>이름</li>
							<li>깃허브주소</li>
							<li>이메일주소</li>
						</ul>

					</div>
					<div>
						<ul>
							<li>사진</li>
							<li>이름</li>
							<li>깃허브주소</li>
							<li>이메일주소</li>
						</ul>

					</div>

				</div>




			</div>














		</div>


		<jsp:include page="/footer"></jsp:include>
	</div>


</body>
</html>