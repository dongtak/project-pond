/**
 * 
 */

 $('#id').on('change', e => {
	if($('#id').val() !== "") {
		$('#error-id').hide();
		$('#id').css('border-color', 'lightgrey');
	}
});



$('#password').on('change', e => {
	//최소한 하나의 특수문자를 포함하고, 8자 이상 20자 이하
	if ($('#password').val() !== "" && $('#password').val().match(/^(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/)) {

		$('#error-password').hide();
		$('#password').css('border-color', 'lightgrey');
		/*$('#password').css('border-top', 'none');*/
	}
});

$('#new-password').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password').hide();
		$('#new-password').css('border-color', 'lightgrey');
		/*$('#new-password').parent().css('border-top', 'none');*/
	}
});

$('#new-password').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password-con').hide();
		$('#new-password').css('border-color', 'lightgrey');
		/* $('#new-password').parent().css('border-top', 'none'); */
	}
});



$('#email').on('change', e => {
	if($('#email').val() !== "") {
		$('#error-email').hide();
		$('#email').css('border-color', 'lightgrey');
		/* $('#email').parent().css('border-top', 'none'); */
	}
});
$('#name').on('change', e => {
	if($('#name').val() !== "") {
		$('#error-name').hide();
		$('#name').css('border-color', 'lightgrey');
	}
});

$('#birth').on('change', e => {
	if($('#birth').val().length === 8 && $('#birth').val().match(/\d{8}/) !== null) {
		$('#error-birth').hide();
		$('#birth').css('border-color', 'lightgrey');
		/* $('#birth').parent().css('border-top', 'none');*/
	}
});

$('#phone').on('change', e => {
	if($('#phone').val().length === 13 && $('#phone').val().match(/\d{3}-\d{4}-\d{4}/) !== null) {
		$('#error-phone').hide();
		$('#phone').css('border-color', 'lightgrey');
		/* $('#phone').parent().css('border-top', 'none');*/
	}
});







function checkValue(htmlForm) {
	const id = htmlForm.id.value;
	const password = htmlForm.password.value;
	const email = htmlForm.email.value;
	const name = htmlForm.name.value;
	const birth = htmlForm.birth.value;
	const phone = htmlForm.phone.value;
	
	let check = true;
	
	if(id === "") {
		$('#error-id').show();
		$('#id').css('border-color', 'red');
		check = false;		
	} 
	else if(password === "") {
		$('#error-password').show();
		$('#password').css('border-color', 'red');
		/*$('#password').css('border-bottom', 'solid 1px red');*/
		check = false;
	}
	else if(email === "") {
		$('#error-password').show();
		$('#password').css('border-color', 'red');
		$('#password').css('border-bottom', 'solid 1px red');
		check = false;
	}
	else if(name === "") {
		$('#error-name').show();
		$('#name').css('border-color', 'red');
		check = false;
	}
	
	else if(birth.length !== 8 || birth.match(/\d{8}/) === null) {
		$('#error-birth').show();
		$('#birth').css('border-color', 'red');
		/* $('#birth').parent().css('border-top', 'solid 1px red');*/
		check = false;
	}
	else if(phone.length !== 13 || phone.match(/\d{3}-\d{4}-\d{4}/) === null) {
		$('#error-phone').show();
		$('#phone').css('border-color', 'red');
		 /* $('#phone').parent().css('border-top', 'solid 1px red'); */
		check = false;
	}
	
	if(check === true)
		htmlForm.submit();
	
}












function checkPwd(htmlForm) {
  const password = htmlForm.password.value;
  const newPassword = htmlForm["new-password"].value;
  const newPasswordCon = htmlForm["new-password-con"].value;

  let check = true; 

  if (password === "") {
    $('#error-password').show();
    $('#password').parent().css('border-color', 'red');
    $('#password').parent().css('border-top', 'solid 1px red');
    check = false;
    
  } else if (newPassword === "") {
    $('#error-password').show();
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