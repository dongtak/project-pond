$('#msg-box').click(e => {
	$('#msg-box').empty();
})

function addComment() {
	const moonNum = $('#moonNum').val();
	const msgBoxValue=$('#msg-box').val();
	let id = $('#logVal');
	
	console.log(id);

	if(id.length===0){
		id = "";
	}else{
		id = $('#logVal').val();
	}
	

	$.ajax({
		"method": "POST",
		"url": `/comments?moonNum=${moonNum}&msg=${msgBoxValue}`,
	}).done(response => {
		console.log(response);

		if (response.msg === 'success') {
			drawComments();
			$('#msg-box').val('');
		} else {
			if (id === "") {
				alert('로그인 후 이용 가능합니다.');
			} else {
				alert('댓글을 입력해주세요.');
			}
		}
	});

}

function drawComments() {

	$.ajax({
		"method": "GET",
		"url": `/comments?moonNum=${$('#moonNum').val()}`
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


