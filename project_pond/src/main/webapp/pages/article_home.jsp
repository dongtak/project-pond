<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="stylesheet" href="resources/style/article.css">
<title>히스토리</title>
</head>
<body>
<c:set var="moonMenu" value="${requestScope.moonMenu }"/>
<c:set var="count" value="${requestScope.count }"/>
<c:set var="pageNum" value="${requestScope.pageNum }"/>
<c:set var="pageSize" value="4"/>
<c:set var="currentPage" value="${pageNum }"/>
<c:set var="startRow" value="${(currentPage-1)*pageSize+1}"/>
<c:set var="pageBlock" value="5"/>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
			<div class="menu">
				<ul>
					<li><a href="articleHomeAction?moonMenu=new">최신순</a></li>
					<li><a href="articleHomeAction?moonMenu=done">100% 달성</a></li>
					<li><a href="articleHomeAction?moonMenu=peak">최고 금액</a></li>
					<li><a href="articleHomeAction?moonMenu=topMsg">가장 많은 메시지</a></li>
				</ul>
			</div>
			<div class="content">
				<h2 class="title">
					<c:choose>
						<c:when test="${moonMenu eq 'new' }">최신순</c:when>
						<c:when test="${moonMenu eq 'done' }">100% 달성</c:when>
						<c:when test="${moonMenu eq 'peak' }">최고 금액</c:when>
						<c:when test="${moonMenu eq 'topMsg' }">가장 많은 메시지</c:when>
					</c:choose>
				</h2>
				<div class="items">
					<c:forEach var="moonList" items="${requestScope.moonList }"
						varStatus="vs">
						<div class="item">
							<a href='showArticle?moonNum=${moonList.getMoonNum() }'
								target='_self'> <img src='https://ifh.cc/g/pOdz9l.jpg'
								border='0'> <span class="moonNum"> <c:set
										var="moonNum" value="${moonList.getMoonNum()}" /> <c:set
										var="num" value="${fn:substringAfter(moonNum, '0')}" /> <c:set
										var="do_loof" value="true" /> <c:forEach var="item" begin="1"
										end="${fn:length(num)}">
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
									</c:forEach> [제 ${num }회]
							</span> <span class="moonTitle"> ${moonList.getTitle() } </span>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="page">
					<c:if test="${count!=0 }">
						<c:if test="${moonMenu eq 'new' || moonMenu eq 'done'  }">
							<c:set var="tempPageCount"
								value="${count / pageSize + (count%pageSize==0 ? 0 : 1) }" />
							<c:set var="exTmp" value="${count/pageSize }" />
							<fmt:parseNumber value="${tempPageCount}" var="pageCount"
								type="number" integerOnly="true" />
							<c:set var="temp1" value="${(currentPage - 1) / pageBlock}" />
							<fmt:parseNumber value="${temp1 }" var="temp2" type="number"
								integerOnly="true" />
							<c:set var="tempStartPage" value="${temp2 * pageBlock + 1 }" />
							<fmt:parseNumber value="${tempStartPage}" var="startPage"
								integerOnly="true" />
							<c:set var="tempEndPage" value="${startPage + pageBlock-1 }" />
							<fmt:parseNumber value="${tempEndPage }" var="endPage"
								integerOnly="true" />

							<c:if test="${endPage>pageCount }">
								<c:set target="${endPage}" value="${pageCount }" />
							</c:if>
							<c:if test="${startPage>pageBlock }">
								<div>
									<a
										href="articleHomeAction?moonNum=${moonNum }&pageNum=${startPage-pageBlock }">&lt;</a>
								</div>
							</c:if>
							<c:forEach begin="${startPage }" end="${endPage }" varStatus="vs">
								<div>
									<a
										href="articleHomeAction?moonNum=${moonNum }&pageNum=${vs.index }"
										<c:if test="${vs.index==pageNum }">
								class="currPage"
							</c:if>>${vs.index }
									</a>
								</div>
							</c:forEach>
							<c:if test="${endPage < pageCount }">
								<div>
									<a href="articleHomeAction?pageNum=${startPage+pageBlock }">&gt;</a>
								</div>
							</c:if>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	<script type="text/javascript" src="resources/script/moonMenu.js"></script>
</body>
</html>