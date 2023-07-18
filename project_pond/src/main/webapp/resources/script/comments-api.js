$('#msg-box').click(e => {
	$('#msg-box').empty();
})

function addComment() {
	const moonNum = $('#moonNum').text();
	
	$.ajax({
		"method" : "POST",
		"url" : `/comments?moonNum=${moonNum}&msg=${$('#msg-box').val()}`,
	}).done(response => {
		console.log(response);
		
		if(response.msg === 'success') {
			drawCommnets();
		} else {
			alert('Beep-');
		}
	})
	
}

function drawCommnets() {
	
	$.ajax({
		"method" : "GET",
		"url" : `/comments?moonNum=${$('#moonNum').text()}`
	}).done(response => {
		const list = response;
		console.log(list);
		
		$('#comments-container').empty();
		
		list.forEach(comment => {
			$('#comments-container').append(`
				<p>${comment.commentContent}</p>
			`);
		})
	})
	
	
}