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
	String sql = "select * from `fullmoon`";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/style/form.css">
<body>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section class="main_moon">

			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);
				System.out.println("Database 연동 성공");

				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
			%>

			<div class="fullmoon" id="fullmoon">
				<h2><%=rs.getString("title")%></h2>
				<span><%=rs.getString("moonNum")%></span> <span><%=rs.getString("goal")%></span>
				<span><%=rs.getString("donation")%></span>

			</div>

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





		</section>

		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>