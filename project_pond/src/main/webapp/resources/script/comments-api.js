$('#msg-box').click(e => {
	$('#msg-box').empty();
})

function addComment() {
	const moonNum = $('#moonNum').text();
	const msgBoxValue = $('#msg-box').val();
	console.log(moonNum);
	console.log(msgBoxValue);
	
	
	$.ajax({
		"method" : "POST",
		"url" : `/comments?moonNum=${moonNum}&msg=${$('#msg-box').val()}`,
	}).done(response => {
		console.log(response);
		
		if(response.msg === 'success') {
			drawComments();
		 $('#msg-box').val(''); 
			
		} else {
			
		
			alert('댓글을 입력해주세요.');
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
			$('#comments-container').prepend(`
				<div class="comments-item">
				<p>${comment.userName}</p>
				<p>${comment.commentContent}</p>
				<p>${comment.commentCreatedAt}</p>
				</div>
			`);
		})
	});
	
}