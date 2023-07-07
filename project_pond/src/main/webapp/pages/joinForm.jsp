<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/form.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/header"></jsp:include>
		<section id="main-section">
			<h2>JOIN</h2>
			<form method="POST" action="Join">
				<div class="div-form">
					<div>
						<input type="text" id="id" name="id" placeholder="아이디" autofocus>
					</div>
					<button action="duplIdCheck">아이디 중복체크</button>
					<div>
						<input type="text" id="password" name="password"
							placeholder="비밀번호">
					</div>
					<div>
						<input type="email" id="email" name="email"
							placeholder="[선택] 비밀번호 분실 시 확인용 이메일">
					</div>
				</div>
				<ul>
					<li class="error" id="error-id">아이디: 필수 정보입니다.</li>
					<li class="error" id="error-password">비밀번호: 필수 정보입니다.</li>
				</ul>

				<div class="div-form">
					<div>
						<input type="text" id="name" name="name" placeholder="이름">
					</div>
					<div>
						<input type="text" id="birth" name="birth" placeholder="생년월일 8자리">
					</div>
					<div>
						<select name="telecom">
							<option value="">통신사 선택</option>
							<option value="skt">SKT</option>
							<option value="kt">KT</option>
							<option value="lgu">LG U+</option>
						</select>
					</div>
					<div>
						<input type="radio" id="gender-man" name="gender" value="man"
							checked> <input type="radio" id="gender-woman"
							name="gender" value="woman"> <input type="radio"
							id="foreigner-false" name="foreigner" value="false" checked>
						<input type="radio" id="foreigner-true" name="foreigner"
							value="true">

						<div class="label-wrapper">
							<div class="label-container">
								<label for="gender-man">
									<div class="radio-box radio-left" id="box-gender-man">남</div>
								</label> <label for="gender-woman">
									<div class="radio-box radio-right" id="box-gender-woman">여</div>
								</label>
							</div>

							<div class="label-container">
								<label for="foreigner-false">
									<div class="radio-box radio-left" id="box-foreigner-false">내국인</div>
								</label> <label for="foreigner-true">
									<div class="radio-box radio-right" id="box-foreigner-true">외국인</div>
								</label>
							</div>
						</div>

					</div>
					<div>
						<input type="text" id="phone" name="phone" placeholder="휴대전화 번호">
					</div>
				</div>
				<ul>
					<li class="error" id="error-name">이름: 필수 정보입니다.</li>
					<li class="error" id="error-birth">생년월일: 필수 정보입니다.</li>
					<li class="error" id="error-phone">휴대전화: 필수 정보입니다.</li>
				</ul>
				<button>alter</button>
				<input type="button" id="submit-btn" value="회원가입"
					onclick="checkValue(form)">
			</form>
		</section>
		<jsp:include page="/footer"></jsp:include>
	</div>



	<script src="resources/script/validation.js"></script>
</body>
</html>