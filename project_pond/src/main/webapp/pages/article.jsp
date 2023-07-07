<%@page import="model.articleComment.ArticleCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String url = ***
	String username = "admin";
	String password = ***
	String sql = "select * from `articleComment`";%>


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


			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);
				System.out.println("Database 연동 성공");

				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
			%>
			<table border="1">
				<tr>
					<td>사용자ID</td>
					<td>내용</td>
					<td>생성일자</td>

				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("userId")%></td>
					<td><%=rs.getString("content")%></td>
					<td><%=rs.getTimestamp("createdAt")%></td>


				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();

				} finally {
				try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();

				}

				} catch (Exception e) {
				e.printStackTrace();
				}

				}
				%>
			</table>


		</section>
		<jsp:include page="/footer"></jsp:include>

	</div>

</body>
</html>