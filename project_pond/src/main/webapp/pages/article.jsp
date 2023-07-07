<%@page import="model.articleComment.ArticleCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {
	height: 100%
}

;
.comment-box {
	padding: 10px auto
}
;
</style>



</head>
<body>

	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
		
			<h2>댓글</h2>
			<div class="comment-box">

				<form action="LeaveComment" method="post">

					<textarea rows="10" cols="60" placeholder="댓글을 남겨주세요" id="comment"
						name="comment"> </textarea>
					<!-- <input type="text" placeholder="댓글을 남겨주세요" id="comment" name="comment"> -->
					<button class="comment-btn" type="submit" value="Create">댓글
						쓰기</button>
				</form>

			<!-- 댓글 출력 > commentprint.jsp -->


				<h1>============글수정===========</h1>

				<div class="container">
					<div class="row">
						<form method="post" action="updateAction.jsp?userId=<=% userId %>">
							<table class="table"
								style="text-align: center; border: 1px solid #dddddd">

								<thead>
									<tr>
										<th colspan="2"
											style="background-color: #eeeeee; text-align: center;">게시판
											글쓰기 양식</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td><input type="text" class="form" placeholder="글제목"
											name="bbsTitle" maxlength="50"></td>

									</tr>
									<tr>

										<td><textarea class="form" placeholder="글내용"
												name="commentContent"></textarea></td>



									</tr>

								</tbody>


							</table>
							<input type="submit" class="btn" value="글쓰기">
						</form>

					</div>


				</div>





			</div>
	</div>


	</section>
	
	<jsp:include page="/footer"></jsp:include>
		<form action="LeaveComment" method="post">
				<input type="text" placeholder="댓글을 남겨주세요" id="comment" name="comment">
				<button>댓글 쓰기</button>
			</form>
		</section>
		<jsp:include page="/footer"></jsp:include>

	</div>
	
</body>
</html>