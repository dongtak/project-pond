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
	String sql = "select * from user";%>
	
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
	
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비번</td>
			<td>이름</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td>주소</td>
			
		</tr>
		<%
			while(rs.next()){
		%>
			<tr>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("pwd") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><%=rs.getString("address") %></td>
			</tr>
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
	</table>


</body>
</html>