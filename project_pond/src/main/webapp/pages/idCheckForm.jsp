<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 아이디 중복체크 추가 -->

<div>
<h3>아이디 중복확인</h3>
<form method ="POST" action="IdCheck">
아이디 : <input type="text" name="id" maxlength="10" autofocus>
<input type="submit" value="중복확인" >
<!--

if(cnt >0){

<span class="verified" id="verifiedId">사용가능한 아이디입니다</span>

}else{ 
<span class="error" id="error-id">이미 존재하는 아이디입니다.</span>
}
  -->

</form>







</div>




</body>
</html>