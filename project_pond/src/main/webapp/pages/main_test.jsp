<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="util.DBManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/script/payment_modal.js"></script>
<link rel="stylesheet" href="resources/style/form.css">
<link rel="stylesheet" href="resources/style/main.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section class="main_moon section">
			<c:set var="sql" value="select * from `fullmoon`" />
			<sql:query dataSource="${dataSource}" var="result">
				${sql}
			</sql:query>

			<c:forEach var="row" items="${result.rows}">
				<c:if test="${row.moon_status eq '1'}">
					<div class="fullmoon" id="fullmoon">
						<h2>${row.moon_title}</h2>
						<span>${row.moon_num}</span><br>
						<span>목표모금액: ${row.moon_goal}원</span><br>
						<span>누적모금액: ${row.moon_donate}원</span><br>
						<c:set var="donate" value="${row.moon_donate}" />
						<c:set var="total" value="${row.moon_goal}" />
						<c:set var="money" value="${(donate / total) * 100}" />
						<progress value="${money}" max="100"></progress><br>
						<span>달성률: ${money}%</span><br>

						<!-- Trigger/Open The Modal -->
						<button id="myBtn">후원하기</button>

						<!-- The Modal -->
						<div id="myModal" class="modal">
							<!-- Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<span class="close">&times;</span>
									<h2>결제페이지</h2>
								</div>
								<div class="modal-body">
									<jsp:include page="/join"></jsp:include>
								</div>
								<div class="modal-footer">
									<h3>Modal Footer</h3>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>

			<c:if test="${not empty sessionScope.log}">
				<p>로그인상태</p>
			</c:if>
		</section>

		<jsp:include page="/footer"></jsp:include>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>
