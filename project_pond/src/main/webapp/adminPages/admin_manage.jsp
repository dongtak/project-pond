<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:choose>
		<c:when test="${menu eq '회원'}">
		<c:set var="userList" value="${requestScope.userList}"/>
		<c:set var="size" value="${userList.size()}"/>
		userList : ${userList }<br/>
		size : ${size }<br/>
			
		</c:when>
		<c:when test="${menu eq '활동'}">

		</c:when>
		<c:when test="${menu eq '게시글'}">

		</c:when>
		<c:when test="${menu eq '후원'}">

		</c:when>
	</c:choose>

</body>
</html>