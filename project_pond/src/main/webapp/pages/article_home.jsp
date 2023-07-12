<%@page import="model.article.ArticleRequestDto"%>
<%@page import="model.article.Article"%>
<%@page import="java.util.List"%>
<%@page import="model.article.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/article.css">
<title>게시판</title>
</head>
<body>
<c:set var="articleList" value="${requestScope.articleList }"/>
<c:set var="count" value="${requestScope.count }"/>
<c:set var="pageNum" value="${requestScope.pageNum }"/>
<c:set var="pageSize" value="4"/>
<c:set var="currentPage" value="${pageNum }"/>
<c:set var="startRow" value="${(currentPage-1)*pageSize+1}"/>
<c:set var="pageBlock" value="5"/>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
			<div class="section_title">
				<h2>만월 게시판</h2>
			</div>
			<div class="items">
				<c:forEach var="articleList" items="${requestScope.articleList }" varStatus="vs">
					<div class="item">
						<a href='showArticle?moonNum=${articleList.getMoon_num() }' target='_self'>
	            		<img src='https://ifh.cc/g/zfn8YG.jpg' border='0'>
							<span>
								<span>${articleList.getArticle_title() }</span>
							</span>
						</a>
					</div>
				</c:forEach>
			</div>
			<div class="page">
				<c:if test="${count!=0 }">
					<c:set var="tempPageCount" value="${count / pageSize + (count%pageSize==0 ? 0 : 1) }"/>
					<c:set var="exTmp" value="${count/pageSize }"/>
					<fmt:parseNumber value="${tempPageCount}" var="pageCount" type="number" integerOnly="true"/>
					<c:set var="temp1" value="${(currentPage - 1) / pageBlock}"/>
					<fmt:parseNumber value="${temp1 }" var="temp2" type="number" integerOnly="true"/>
					<c:set var="tempStartPage" value="${temp2 * pageBlock + 1 }" />
					<fmt:parseNumber value="${tempStartPage}" var="startPage" integerOnly="true" />
					<c:set var="tempEndPage" value="${startPage + pageBlock-1 }"/>
					<fmt:parseNumber value="${tempEndPage }" var="endPage" integerOnly="true" />
					<c:if test="${endPage>pageCount }">
						<c:set target="${endPage}" value="${pageCount }"/>
					</c:if>
					<c:if test="${startPage>pageBlock }">
						<div>
							<a href="articleHomeAction?pageNum=${startPage-pageBlock }">Prev</a>
						</div>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" varStatus="vs">
						<div>
							<a href="articleHomeAction?pageNum=${vs.index }"
							<c:if test="${vs.index==pageNum }">
								class="currPage"
							</c:if>
							>${vs.index }
							</a>
						</div>
					</c:forEach>
					<c:if test="${endPage < pageCount }">
						<div>
							<a href="articleHomeAction?pageNum=${startPage+pageBlock }">Next</a>			
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	
</body>
</html>