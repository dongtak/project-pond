/**
 * 
 */

 $('#password').on('change', e => {
	if($('#password').val() !== "") {
		$('#error-password1').hide();
		$('#password').css('border-color', 'lightgrey');
		$('#password').css('border', 'none');
	}
});

$('#new-password').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password2').hide();
		$('#new-password').css('border-color', 'lightgrey');
		$('#new-password').css('border', 'none');
	}
});

$('#new-password-con').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password-con').hide();
		$('#new-password').css('border-color', 'lightgrey');
		$('#new-password').css('border', 'none');
	}
});
 
 
 function checkPwd(htmlForm) {
  const password = htmlForm.password.value;
  const newPassword = htmlForm["new-password"].value;
  const newPasswordCon = htmlForm["new-password-con"].value;
  const storedPwd = htmlForm["storedPwd"].value;

  let check = true; 

  if (password === "") {
    $('#error-password1').show();
    $('#password').css('border-color', 'red');
 
    check = false;
    
  } else if (newPassword === "") {
    $('#error-password2').show();
		$('#newPassword').css('border-color', 'red');
		/*$('#password').css('border', 'solid 1px red');*/
		check = false;

  } else if (newPassword !== newPasswordCon) {
    
    $('#error-password-con').show();
    $('#new-password').css('border-color', 'red');
    /*$('#new-password').css('border', 'solid 1px red');*/
    check = false;
  }else if(storedPwd !==password  ){
	 alert("비밀번호가 일치하지 않습니다.");  
	    check = false;
  }else if(storedPwd===password && newPassword === newPasswordCon){
	  alert("비밀번호 변경 완료");
  }
  
  if (check) {
  
    htmlForm.submit();
  }
}








