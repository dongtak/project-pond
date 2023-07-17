<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/form.css">
</head>
<body>
	<!-- 비밀번호 가져와서 비밀번호 입력값과 비교 -->
	<c:set var="pwd" value="${sessionScope.pwd }" />

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">



			<c:if test="${empty sessionScope.log}">
				<c:redirect url="/login"></c:redirect>
			</c:if>

			<form method="POST" class=user-form action="Leave">
<h1>회원탈퇴</h1>
				<div class="div-form">
					
					<div>
						<input type="text" class=user-input id="id" name="id"
							value="${sessionScope.log}" readonly>
					</div>

					<div>
						<input type="text" class=user-input id="password" name="password"
							placeholder="비밀번호" autofocus>
					</div>


					<ul>
						<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
						<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
					</ul>
				</div>

				<input type="button" id="submit-btn" value="회원탈퇴"
					onclick="checkValue(form)"> <input type="button"
					class="cancelBtn" id="cancel-btn" value="취소"
					onclick="history.back()">
			</form>

		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>


</body>

<script>

$('#id').on('change', e => {
	if($('#id').val() !== "") {
		$('#error-id').hide();
		$('#id').css('border-color', 'lightgrey');
	}
});



$('#password').on('change', e => {

	if ($('#password').val() !== "" ) {

		$('#error-password').hide();
		$('#password').css('border-color', 'lightgrey');
		/*$('#password').css('border-top', 'none');*/
	}
});


function checkValue(htmlForm) {
	  const id = htmlForm.id.value;
	  const password = htmlForm.password.value;
	  
	  let check = true;
	  
	  if (id === "") {
	    $('#error-id').show();
	    $('#id').css('border-color', 'red');
	    check = false;
	  } else if (password === "") {
	    $('#error-password').show();
	    $('#password').css('border-color', 'red');
	    check = false;
	  }else if (password != '${pwd}') {
	    window.alert('비밀번호가 일치하지 않습니다.');
	    check = false;
	  }
	  else
	  if (window.confirm('정말 탈퇴하시겠습니까?')) {
	    if (check === true)
	      htmlForm.submit();
	  }
	}
	





</script>



</html>