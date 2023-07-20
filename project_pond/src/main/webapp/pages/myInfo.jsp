<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/myInfo.css">
</head>
<body>
<c:if test="${empty user }">
	location.href = "mainAction";
</c:if>
<c:set var="user" value="${requestScope.user }"/>
<c:set var="menu" value="${requestScope.menu }"/>

	<div class="mypage-content">
		<c:choose>
			<c:when test="${menu eq 'myInfo'}">
				<h2>내 정보</h2>
				<div class="info-box">
					<span>이름 : ${user.getName() }</span> 
					<span>아이디 : ${user.getId() }</span> 
					<span>이메일 : ${user.getEmail() }</span>
					<span>생년월일 : ${user.getBirth() }</span>
					<span>전화번호 : ${user.getPhone() }</span>
					<span>주소 : ${user.getAddress() }</span>
				</div>
			</c:when>
			<c:when test="${menu eq 'myCardInfo'}">
				<h2>내 카드 정보</h2>
				<div class="info-box" id="cardList-box">
					<c:choose>
						<c:when test="${not empty requestScope.cardList }">
							<c:set var="cardList" value="${requestScope.payList }"/>
							<c:forEach var="card" items="${cardList }">
							<div class="card-item">
								<span>카드 번호 : ${card.getCardNum()}</span>
								<span>카드 금융사 : ${card.getCardName()}</span>
								<span>카드 유효기간 : ${card.getCardExpire()}</span>
							</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span class="noList">등록된 카드가 없어요!</span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
			<c:when test="${menu eq 'myPay'}">
				<h2>후원 기록</h2>
				<div class="info-box" id="payList-box">
					<c:choose>
						<c:when test="${not empty requestScope.payList }">
							<c:set var="payList" value="${requestScope.payList }" />
							<c:forEach var="pay" items="${cardList }">
								<div class="pay-item">
									<c:set var="do_loof" value="true" />
									<c:set var="moonNum" value="${pay.getMoonNum() }" />
									<c:set var="num" value="${fn:substringAfter(moonNum, '0')}" /> 
									<c:set var="do_loof" value="true" /> 
									<c:forEach var="item" begin="1" end="${fn:length(num)}">
										<c:if test="${do_loof eq true }">
											<c:choose>
												<c:when test="${fn:startsWith(num, '0')}">
													<c:set var="num" value="${fn:substringAfter(num, '0')}" />
												</c:when>
												<c:otherwise>
													<c:set var="do_loof" value="false" />
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach> 
									<span>모금 회차 : ${num }회</span>
									<span>결제 번호 : ${pay.getPayNum() }</span>
									<span>결제 카드 : ${pay.getCardNum() }</span>
									<span>후원 금액 : ${pay.getPayMoney() }</span>
									<span>후원일 : ${pay.getPayDay() }</span>
									<span class="psyMsg">
										등록 메세지<br>
										${pay.getMessage() }
									</span>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span class="noList">후원 내역이 없어요!</span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
			<c:when test="${menu eq 'myMsg'}">
				<h2>내가 쓴 댓글</h2>
				<div class="info-box" id="commentList-box">
					<c:choose>
						<c:when test="${not empty requestScope.commentList }">
							<c:set var="commentList" value="${requestScope.commentList }" />
							<c:forEach var="comment" items="${commentList }">
								<span></span>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span class="noList">작성한 댓글이 없어요!</span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
		</c:choose>
	</div>
</body>
</html>