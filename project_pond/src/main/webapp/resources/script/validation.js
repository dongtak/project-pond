/**
 * 
 */

 $('#id').on('change', e => {
	if($('#id').val() !== "") {
		$('#error-id').hide();
		$('#id').parent().css('border-color', 'lightgrey');
	}
});



$('#password').on('change', e => {
	if($('#password').val() !== "") {
		$('#error-password').hide();
		$('#password').parent().css('border-color', 'lightgrey');
		$('#password').parent().css('border-top', 'none');
	}
});

$('#new-password').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password').hide();
		$('#new-password').parent().css('border-color', 'lightgrey');
		$('#new-password').parent().css('border-top', 'none');
	}
});

$('#new-password').on('change', e => {
	if($('#new-password').val() !== "") {
		$('#error-password-con').hide();
		$('#new-password').parent().css('border-color', 'lightgrey');
		$('#new-password').parent().css('border-top', 'none');
	}
});



$('#email').on('change', e => {
	if($('#email').val() !== "") {
		$('#error-email').hide();
		$('#email').parent().css('border-color', 'lightgrey');
		$('#email').parent().css('border-top', 'none');
	}
});
$('#name').on('change', e => {
	if($('#name').val() !== "") {
		$('#error-name').hide();
		$('#name').parent().css('border-color', 'lightgrey');
	}
});

$('#birth').on('change', e => {
	if($('#birth').val().length === 8 && $('#birth').val().match(/\d{8}/) !== null) {
		$('#error-birth').hide();
		$('#birth').parent().css('border-color', 'lightgrey');
		$('#birth').parent().css('border-top', 'none');
	}
});

$('#phone').on('change', e => {
	if($('#phone').val().length === 13 && $('#phone').val().match(/\d{3}-\d{4}-\d{4}/) !== null) {
		$('#error-phone').hide();
		$('#phone').parent().css('border-color', 'lightgrey');
		$('#phone').parent().css('border-top', 'none');
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
		$('#id').parent().css('border-color', 'red');
		check = false;		
	} 
	else if(password === "") {
		$('#error-password').show();
		$('#password').parent().css('border-color', 'red');
		$('#password').parent().css('border-top', 'solid 1px red');
		check = false;
	}
	else if(email === "") {
		$('#error-password').show();
		$('#password').parent().css('border-color', 'red');
		$('#password').parent().css('border-top', 'solid 1px red');
		check = false;
	}
	else if(name === "") {
		$('#error-name').show();
		$('#name').parent().css('border-color', 'red');
		check = false;
	}
	
	else if(birth.length !== 8 || birth.match(/\d{8}/) === null) {
		$('#error-birth').show();
		$('#birth').parent().css('border-color', 'red');
		$('#birth').parent().css('border-top', 'solid 1px red');
		check = false;
	}
	else if(phone.length !== 13 || phone.match(/\d{3}-\d{4}-\d{4}/) === null) {
		$('#error-phone').show();
		$('#phone').parent().css('border-color', 'red');
		$('#phone').parent().css('border-top', 'solid 1px red');
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