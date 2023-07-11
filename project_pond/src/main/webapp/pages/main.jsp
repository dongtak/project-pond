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
<link rel="stylesheet" href="resources/style/fireflies.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="fireflies">날파리</div>
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
			<div class="fullmoon" id="fullmoon">
				<h2><%=rs.getString("moon_title")%></h2>
				<span><%=rs.getString("moon_num")%></span><br> 
				<span>목표모금액 : <%=rs.getString("moon_goal")%>원</span><br> 
					<span>누적모금액 : <%=rs.getString("moon_donate")%>원</span><br>
				<%
				int donate = Integer.parseInt(rs.getString("moon_donate"));
				int total = Integer.parseInt(rs.getString("moon_goal"));
				double money = (double) donate / total * 100;
				String formattedMoney = String.format("%.2f", money);
				%>
				<progress value="<%=formattedMoney%>" max="100"></progress>
				<br>
				<span>달성률 : <%=formattedMoney%>%
				</span><br>


				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal">후원하기</button>

				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Modal Heading</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<jsp:include page="/pay"></jsp:include>

							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
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
<script src="resources/script/fireflies.js"></script>
</html>