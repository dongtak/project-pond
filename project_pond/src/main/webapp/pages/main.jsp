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
<%
String id = (String) session.getAttribute("log");
boolean login = id == null ? false : true;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/style/form.css">
<link rel="stylesheet" href="resources/style/main.css">

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

			<%
			if (rs.getString("status").equals("1")) { //모금상태가 1인경우
			%>
			<div class="fullmoon" id="fullmoon">
				<h2><%=rs.getString("title")%></h2>
				<span><%=rs.getString("moonNum")%></span><br>
				<span>목표모금액 : <%=rs.getString("goal")%></span><br>
				<span>누적모금액 : <%=rs.getString("donation")%></span><br>
				<%
				int donate = Integer.parseInt(rs.getString("donation"));
				int total = Integer.parseInt(rs.getString("goal"));
				double money = (double)donate / total * 100;
			    String formattedMoney = String.format("%.2f", money);
				%>
				<progress value="<%=formattedMoney%>" max="100"></progress>
				<span>달성률 : <%=formattedMoney%></span>

			</div>
			<%
			}
			%>
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


			<%
			if (login) {
			%><p>로그인상태</p>
			<%
			}
			%>


		</section>

		<jsp:include page="/footer"></jsp:include>
	</div>
</body>
</html>