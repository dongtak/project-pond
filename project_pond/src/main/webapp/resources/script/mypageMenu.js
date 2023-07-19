$('.aside-menu li').on('click', function() {
	const liId = $(this).attr('id');
	console.log(liId);
	
	$('.aside-menu li').removeClass('curr-menu');
    $(this).addClass('curr-menu');
    
	switch (liId) {
        case 'update':
		// 내 정보 수정
			insertPage(liId);
            break;
        case 'addCard':
        // 결제 수단 추가
            break;
        case 'payInfo':
        // 카드 정보
            break;
        case 'myPay':
        // 후원 기록
            break;
        case 'myMsg':
        // 내가 쓴 댓글
            break;
        case 'delete':
		// 회원 탈퇴
			insertPage(liId);
            break;
        default:
            break;
    }
	
});


function insertPage(liId) {
	$('#menu-container').empty();
	
	let url = "";
	
	if(liId==="update"){
		url="/UpdateUser";
	}else if(liId==="delete"){
		url = "/LeaveUser";
	}

	if (url !== "") {
		$.ajax({
			"method": "GET",
			"url": url,
		}).done(function(response) {
			$('#menu-container').append(response);
		}).fail(function() {
			console.log("Failed to load JSP page.");
		});
	}

}

