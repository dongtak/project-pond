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
	String sql = "select * from `article`";%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, username, password);
	System.out.println("Database 연동 성공");
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);

			while(rs.next()){
		%>
			
			<div class="pond">
				<h2><%=rs.getString("title") %></h2>
				<span><%=rs.getString("moonNum") %></span>
			</div>
		
	<!--  
		<tr>
				<td><%=rs.getString("id") %></td>
				<td><a href=""><%=rs.getString("title") %></a></td>
				<td><%=rs.getString("content") %></td>
				<td><%=rs.getTimestamp("createdAt") %></td>
				<td><%=rs.getTimestamp("modifiedAt") %></td>
				<td><%=rs.getString("adminId") %></td>
			</tr>
	-->	
			<%
			}
			}catch(Exception e){
				e.printStackTrace();
				
			}finally{
				try{
					if(rs!=null){
						rs.close();
					}
					if(stmt!= null){
						stmt.close();
					}
					if(conn!=null){
						conn.close();
						
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}
			%>



</body>
</html>