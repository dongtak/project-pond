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

  let check = true; 

  if (password === "") {
    $('#error-password1').show();
    $('#password').css('border-color', 'red');
    $('#password').css('border', 'solid 1px red');
    check = false;
    
  } else if (newPassword === "") {
    $('#error-password2').show();
		$('#password').css('border-color', 'red');
		$('#password').css('border', 'solid 1px red');
		check = false;

  } else if (newPassword !== newPasswordCon) {
    
    $('#error-password-con').show();
    $('#new-password').css('border-color', 'red');
    $('#new-password').css('border', 'solid 1px red');
    check = false;
  }

  if (check) {
  
    htmlForm.submit();
  }
}