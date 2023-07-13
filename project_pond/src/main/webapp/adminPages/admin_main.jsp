<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/style/admin.css"/>
<title>관리자</title>
</head>
<body>
	<div id="wrap">
		<header>
			<span>(admin_id) 님</span>
			<button class="out-button" onclick="location.href='../main'">나가기</button>
		</header>
		<nav>
			<div class="logo">
				<a href="#" onclick="location.reload()">로고</a>
			</div>
			<div class="menu">
				<div>사이트 관리</div>
				<ul>
					<li><a>회원관리</a></li>
					<li><a>활동관리</a></li>
					<li><a>게시글관리</a></li>
					<li><a>후원관리</a></li>
				</ul>
			</div>
		</nav>
		<section>
			<div class="content">
				내용1
			</div>
			<div class="content">
				내용2
			</div>
		</section>
		<footer>
			푸터
		</footer>
	</div>
	<script type="text/javascript">
		function adminPageOut() {
			
		}
	</script>
</body>
</html>