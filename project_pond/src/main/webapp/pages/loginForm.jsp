<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<form action="Login" method="POST">
				<input type="text" placeholder="아이디 입력" id="id" name="id"> <input
					type="password" placeholder="비밀번호 입력" id="pwd" name="pwd">
				<button>로그인</button>
			</form>
			<a href="findAcc">아이디/비밀번호 찾기</a> <a href="signup">회원가입</a>
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>



</body>
</html>