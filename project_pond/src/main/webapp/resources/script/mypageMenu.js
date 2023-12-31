

$('.aside-menu li').on('click', function() {
	const liId = $(this).attr('id');
	console.log(liId);
	
	$('.aside-menu li').removeClass('curr-menu');
    $(this).addClass('curr-menu');
	
	let url="";
	
	switch (liId) {
		// 내 정보
		case 'myInfo':
        // 후원 기록
		case 'myPay':
		// 내 카드 정보
		case 'myCardInfo':
			url=`/showMyInfo?menu=${liId}`;
			break;
        case 'update':
		// 비밀번호 수정
			url="/UpdateUser";
            break;
        case 'delete':
		// 회원 탈퇴
			url = "/LeaveUser";
            break;
        default:
            break;
    }
    
    if(url!==""){
		insertPage(url);
	}
	
});


function insertPage(url) {
	
	if (url !== "") {
		$.ajax({
			"method": "GET",
			"url": url
		}).done(function(response) {
			$('#menu-container').empty();
			$('#menu-container').append(response);
			console.log("페이지 로드 성공");
		}).fail(function() {
			console.log("페이지를 불러오는 데 실패하였습니다.");
		});
	}
}

