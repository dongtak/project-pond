<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- 세션에 저장된 로그값으로 로그인 상태 확인 -->
<%
String id = (String) session.getAttribute("log");
boolean login = id == null ? false : true;
%>


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

			<%
			if (login) {
			%>
			아이디 "<%=id%>"로 로그인 한 상태

			<form action="LeaveComment" method="post">
				<input type="text" placeholder="댓글을 남겨주세요" id="comment"
					name="comment">

				<button>댓글 쓰기</button>
			</form>
			<%
			} else {
			%>
			로그인하지 않은 상태
			<%
			}
			%>


		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>

</body>
</html>