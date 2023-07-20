$('#id').on('change', e => {
	if($('#id').val() !== "") {
		$('#error-id').hide();
		$('#id').css('border-color', '#1E3269');
	}
});

$('#pwd').on('change', e => {
	if($('#pwd').val() !== "") {
		$('#error-password').hide();
		$('#pwd').css('border-color', '#1E3269');
	}
});



function checkValue(htmlForm) {
	const id = htmlForm.id.value;
	const pwd = htmlForm.pwd.value;

	
	let check = true;
	
	if(id === "") {
		$('#error-id').show();
		$('#id').css('border-color', 'red');
		check = false;		
	} 
	else if(pwd === "") {
		$('#error-password').show();
		$('#pwd').css('border-color', 'red');
		check = false;
	}
	
		if(check === true)
		htmlForm.submit();
	
}