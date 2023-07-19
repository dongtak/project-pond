$('#msg-box').click(e => {
	$('#msg-box').empty();
})

function addComment() {
	const moonNum = $('#moonNum').text();
	console.log(moonNum);
	console.log($('#msg-box').val());
	$.ajax({
		"method" : "POST",
		"url" : `/comments?moonNum=${moonNum}&msg=${$('#msg-box').val()}`,
	}).done(response => {
		console.log(response);
		
		if(response.msg === 'success') {
			drawComments();
		} else {
			alert('Beep-');
		}
	});
	
}

function drawComments() {
	
	$.ajax({
		"method" : "GET",
		"url" : `/comments?moonNum=${$('#moonNum').text()}`
	}).done(response => {
		const list = response; // JsonArray
		console.log(list);
		
		$('#comments-container').empty();
		
		list.forEach(comment => {
			$('#comments-container').append(`
				<div class="comments-item">
				<p>${comment.userName}</p>
				<p>${comment.commentContent}</p>
				<p>${comment.commentCreatedAt}</p>
				</div>
			`);
		})
	});
	
}