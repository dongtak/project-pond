/**
 * 
 */

 $('#password').on('change', e => {
	if($('#password').val() !== "") {
		$('#error-password1').hide();
		$('#password').parent().css('border-color', 'lightgrey');
		$('#password').parent().css('border-top', 'none');
	}
});

$('#new-password').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password2').hide();
		$('#new-password').parent().css('border-color', 'lightgrey');
		$('#new-password').parent().css('border-top', 'none');
	}
});

$('#new-password-con').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password-con').hide();
		$('#new-password').parent().css('border-color', 'lightgrey');
		$('#new-password').parent().css('border-top', 'none');
	}
});
 
 
 function checkPwd(htmlForm) {
  const password = htmlForm.password.value;
  const newPassword = htmlForm["new-password"].value;
  const newPasswordCon = htmlForm["new-password-con"].value;

  let check = true; 

  if (password === "") {
    $('#error-password1').show();
    $('#password').parent().css('border-color', 'red');
    $('#password').parent().css('border-top', 'solid 1px red');
    check = false;
    
  } else if (newPassword === "") {
    $('#error-password2').show();
		$('#password').parent().css('border-color', 'red');
		$('#password').parent().css('border-top', 'solid 1px red');
		check = false;

  } else if (newPassword !== newPasswordCon) {
    
    $('#error-password-con').show();
    $('#new-password').parent().css('border-color', 'red');
    $('#new-password').parent().css('border-top', 'solid 1px red');
    check = false;
  }

  if (check) {
  
    htmlForm.submit();
  }
}