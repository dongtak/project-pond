$('#id').on('change', e => {
	if($('#id').val() !== "") {
		$('#error-id').hide();
		$('#id').parent().css('border-color', 'lightgrey');
	}
});

$('#pwd').on('change', e => {
	if($('#pwd').val() !== "") {
		$('#error-password').hide();
		$('#pwd').parent().css('border-color', 'lightgrey');
		$('#pwd').parent().css('border-top', 'none');
	}
});




function checkValue(htmlForm) {
	const id = htmlForm.id.value;
	const pwd = htmlForm.pwd.value;

	
	let check = true;
	
	if(id === "") {
		$('#error-id').show();
		$('#id').parent().css('border-color', 'red');
		check = false;		
	} 
	else if(pwd === "") {
		$('#error-password').show();
		$('#pwd').parent().css('border-color', 'red');
		$('#pwd').parent().css('border-top', 'solid 1px red');
		check = false;
	}
	
		if(check === true)
		htmlForm.submit();
	
}