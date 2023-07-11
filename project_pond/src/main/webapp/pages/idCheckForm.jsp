<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<!-- 아이디 중복체크 추가 -->

<div>
<h3>아이디 중복확인</h3>

<%

	String id = request.getParameter("id");
	if(id==null){ %>
		<span>id is null</span>
	<%
	}else{ %>
		<span> id : <%=id %></span>
	<%
	}
%>
<!--

if(cnt >0){

<span class="verified" id="verifiedId">사용가능한 아이디입니다</span>

}else{ 
<span class="error" id="error-id">이미 존재하는 아이디입니다.</span>
}
  -->


</div>




</body>
</html>