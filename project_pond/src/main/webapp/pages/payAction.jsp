<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	const IMP = window.IMP; // 생략 가능
	IMP.init("imp67511331"); // 예: imp00000000a

	function requestPay() {
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({ // param
			pg : "kcp.TC0ONETIME",
			pay_method : "card",
			merchant_uid : IMP + "ORD20180131-0000011",
			name : "노르웨이 회전 의자",
			amount : 64900,
			buyer_email : "gildong@gmail.com",
			buyer_name : "홍길동",
			buyer_tel : "010-4242-4242",
			buyer_addr : "서울특별시 강남구 신사동",
			buyer_postcode : "01181"
		}, function(rsp) { // callback
			if (rsp.success) {

				// 결제 성공 시 로직,
				System.out.print("결제성공");

			} else {
				System.out.print("결제실패");
				// 결제 실패 시 로직,

			}
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<button onclick="requestPay()">결제하기</button>
</body>

</html>