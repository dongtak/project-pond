
 $('#password').on('change', e => {
	if($('#password').val() !== "") {
		$('#error-pwd').hide();
		$('#error-password1').hide();
		$('#error-pwd-same').hide();
		$('#password').css('border-color', 'black');
	}
});

$('#new-password').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password2').hide();
		$('#error-password-con').hide();
		$('#error-pwd-same').hide();
		$('#new-password').css('border-color', 'black');
		$('#new-password-con').css('border-color', 'black');
	}
});

$('#new-password-con').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password2').hide();
		$('#error-password-con').hide();
		$('#error-pwd-same').hide();
		$('#new-password').css('border-color', 'black');
		$('#new-password-con').css('border-color', 'black');
	}
});
 
 
function checkPwd(htmlForm) {
  const password = htmlForm.password.value;
  const newPassword = htmlForm["new-password"].value;
  const newPasswordCon = htmlForm["new-password-con"].value;
  const storedPwd = htmlForm["storedPwd"].value; // 기존 비밀번호

  let check = true; 
  
  $('#error-pwd').hide();
  $('#error-password1').hide();
  $('#error-password2').hide();
  $('#error-password-con').hide();
  $('#error-pwd-same').hide();

  if (password === "") {
    $('#error-password1').show();
    $('#password').css('border-color', 'red');
    check = false;
  } else if (newPassword === "") {
    $('#error-password2').show();
	$('#new-password').css('border-color', 'red');
	check = false;
  }else if(newPasswordCon===""){
	$('#new-password-con').css('border-color', 'red');
	$('#error-password2').show();
	check = false;
  }else if (newPassword !== newPasswordCon) {
    $('#error-password-con').show();
    $('#new-password').css('border-color', 'red');
    check = false;
  }else if(storedPwd !==password  ){
	  $('#error-pwd').show();
	  $('#password').css('border-color', 'red');
	  check = false;
  }else if(storedPwd===password && newPassword === newPasswordCon){
		if(password===newPassword){
			$('#error-pwd-same').show();
			check=false;			
		}else{
		  alert("비밀번호 변경 완료");
		}
  }
  
  if (check) {
    htmlForm.submit();
  }
}








