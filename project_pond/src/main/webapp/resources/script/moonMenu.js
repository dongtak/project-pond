function navigo() {
	const header = $('.header'); // 헤더 부분 획득
	const headerHeight = header.height(); // 헤더 높이

	$(document).scroll(onScroll); // 스크롤 이벤트

	function onScroll() {
		const scrollPosition = $(window).scrollTop(); // 스크롤 위치
		const nav = $('.menu'); // 메뉴

		if (headerHeight <= scrollPosition) {
			nav.addClass('fix'); // fix 클래스를 네비에 추가
		} else {
			nav.removeClass('fix'); // fix 클래스를 네비에서 제거
		}
	}
}

navigo();


$('.menu a').click(function(event) {
	event.preventDefault();
	// $.ajax({경로, 동기화 여부, 성공시 할 일})
	// $.ajax({url:"경로", async:true, success:function(result){}})
	var moonMenu = event.target.id;
	console.log(moonMenu);
	
	$.ajax({
		'method': 'GET',
		'url': '/MoonContentAction?moonMenu=' + moonMenu,
		'async' : true,
		'success' : function(result) {
			console.log(result);
			const num = result.moonNum;
			console.log("num: "+num);
			$('#moon-container').append(num);
		}
	});

});

