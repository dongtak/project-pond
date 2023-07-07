<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String sql = "select * from articleComment";%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="comment-list">

					<h3>댓글</h3>
					
					<%
					while(rs.next()){
					%>

					<ul>
					<li><%=rs.getInt("id") %></li>
					<li><%=rs.getString("userId") %></li>
					<li><%=rs.getString("content") %></li>
					<li><%=rs.getTimestamp("createdAt") %></li>
					
					</ul>
					<%
					}
					
					
					
					%>



				</div>






</body>
</html>