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
<script src="resources/script/payment_modal.js"></script>
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
			<div class="fullmoon" id="fullmoon">
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
				<!-- 
				
				
				 -->


				<!-- Trigger/Open The Modal -->
				<button id="myBtn">후원하기</button>

				<!-- The Modal -->
				<div id="myModal" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
							<h2>결제페이지</h2>
						</div>
						<div class="modal-body">
								<jsp:include page="/findUser"></jsp:include>
						</div>
						<div class="modal-footer">
							<h3>Modal Footer</h3>
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
	
	<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</body>


</html>