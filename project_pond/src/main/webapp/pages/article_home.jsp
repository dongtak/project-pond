<%@page import="model.article.ArticleRequestDto"%>
<%@page import="model.article.Article"%>
<%@page import="java.util.List"%>
<%@page import="model.article.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style/article.css">
<title>게시판</title>
</head>
<body>
<%
	ArticleDao articleDao = ArticleDao.getInstance();

	// 전체 게시글 수 
	int cnt = articleDao.getCount();
	// 한 페이지에서 보여 줄 게시글 수
	int pageSize = 4;
	
	// 현재 페이지 정보 설정
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	// 현재 페이지
	int currentPage = Integer.parseInt(pageNum);
	// 첫 행 번호
	int startRow = (currentPage-1)*pageSize+1;
	
	List<ArticleRequestDto> list = articleDao.getArticleList(startRow, pageSize);
	
%>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<div class="section">
		<div class="section_title">
        	<h2>만월 게시판</h2>
     	</div>
		<div class="items">
		
		<%
			for(int i=0;i<list.size();i++){
				String title = list.get(i).getArticle_title();
				%>
			<div class="item">
				<a href='https://ifh.cc/v-zfn8YG' target='_blank'>
	            	<img src='https://ifh.cc/g/zfn8YG.jpg' border='0'>
					<span>
						<span><%=title %></span>
					</span>
				</a>
			</div>
		<% } %>
		
		</div>

		<div class="page">		
			<%
			if(cnt!=0){
				// 전체 페이지 수
				int pageCount = cnt / pageSize + (cnt%pageSize==0 ? 0 : 1);
				
				// 페이지 블럭
				int pageBlock = 5;
				
				// 페이지 블럭 시작번호
				int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
				
				// 페이지 블럭 끝 번호
				int endPage = startPage + pageBlock-1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
			
			%>
		
			<% if(startPage > pageBlock) { %>
				<div>
					<a href="articleHome?pageNum=<%=startPage-pageBlock %>">Prev</a>
				</div>
			<% } %>
			
			<% for(int i=startPage;i<=endPage;i++){ %>
				<div>
					<a href="articleHome?pageNum=<%=i %>"
						<% if(i==Integer.parseInt(pageNum)){ %>
						class="currPage"
						<%} %>
					><%=i %></a>
				</div>
			<% } %>
			
			<% if(endPage < pageCount){ %>
				<div>
					<a href="articleHome?pageNum=<%=startPage+pageBlock %>">Next</a>			
				</div>
			<% } %>

			<% } %>
			
		</div>
		
		</div>
		<jsp:include page="/footer"></jsp:include>
	</div>
	
	<script type="text/javascript">
		
	
	</script>
</body>
</html>