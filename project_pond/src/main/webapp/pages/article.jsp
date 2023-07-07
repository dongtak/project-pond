<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
		
		
		
			<form action="LeaveComment" method="post">
				<input type="text" placeholder="댓글을 남겨주세요" id="comment"
					name="comment">

				<button>댓글 쓰기</button>
			</form>
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
</html>