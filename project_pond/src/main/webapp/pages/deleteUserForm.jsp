<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/style/mypageContent.css">
</head>
<body>
<c:if test="${not empty requestScope.user }">
	<input type="hidden" id="pwd" value="${requestScope.user.getPwd()}">
</c:if>
		<div class="mypage-content">
			<form method="POST" class="mypage-form" action="LeaveUser">
				<h2>회원탈퇴</h2>
				<div class="info-input">
					<p>아이디</p>
					<input type="text" class=user-input id="id" name="id" value="${sessionScope.log}" readonly>
				</div>
				<div class="info-input">
					<p>비밀번호</p>
					<input type="password" class=user-input id="password" name="password" placeholder="비밀번호" autofocus>
				</div>
				<span class="error" id="error-password">비밀번호: 필수 정보입니다.</span>
				<input type="button" id="submit-btn" value="회원탈퇴" onclick="checkValue(form)">
			</form>
		</div>
</body>

<script>
$('#password').on('change', e => {
	if ($('#password').val() !== "" ) {
		$('#error-password').hide();
		$('#password').css('border-color', 'lightgrey');
	}
});


function checkValue(htmlForm) {
	  const id = htmlForm.id.value;
	  const password = htmlForm.password.value;
	  let pwd = $('#pwd');
	  
	  let check = true;
	  
	  if(pwd.length>0){
		  pwd=pwd.val();
	  }else{
		  pwd="";
		  console.log("회원 동기화 오류");
	  }
	  
	  if (id === "") {
	    $('#error-id').show();
	    $('#id').css('border-color', 'red');
	    check = false;
	  } else if (password === "") {
	    $('#error-password').show();
	    $('#password').css('border-color', 'red');
	    check = false;
	  }else if (pwd!==password) {
		   window.alert('비밀번호가 일치하지 않습니다.');
		   check = false;
	  }else if (window.confirm('정말 탈퇴하시겠습니까?')) {
	    if (check === true)
	      htmlForm.submit();
	  }
}



</script>
<script>
    $(document).on("keyup", function(e){
        if (e.which == 13) {
            $("#submit-btn").click();
        }
    });


</script>


</html>