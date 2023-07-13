<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>나눗샘</title>
<link rel="stylesheet" href="resources/style/form.css">
<link rel="stylesheet" href="resources/style/main.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section class="main_moon section">

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
			if (rs.getString("moon_status").equals("1")) { //모금상태가 1인경우
			%>
			<div class="fullmoon" id="fullmoon"></div>
			<h2><%=rs.getString("moon_title")%></h2>
			<span><%=rs.getString("moon_num")%></span><br> <span>목표모금액
				: <%=rs.getString("moon_goal")%>원
			</span><br> <span>누적모금액 : <%=rs.getString("moon_donate")%>원
			</span><br>
			<%
			int donate = Integer.parseInt(rs.getString("moon_donate"));
			int total = Integer.parseInt(rs.getString("moon_goal"));
			double money = (double) donate / total * 100;
			String formattedMoney = String.format("%.2f", money);
			%>
			<progress value="<%=formattedMoney%>" max="100"></progress>
			<br> <span>달성률 : <%=formattedMoney%>%
			</span><br>
			<button class="accordion">후원하기</button>
			<div class="panel">
				<p>
					<jsp:include page="/modal"></jsp:include>
				</p>
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

		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>


</body>


</html>