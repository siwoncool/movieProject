<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">


<!-- Vendor CSS Files -->
<link href="resources/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/assets/css/index.css" rel="stylesheet">

<title>영화 그 이상의 감동. KPL</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background-color: #212121;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container">
		<div class="input-form-backgroud row" style="padding-top: 85px">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" style="font-family: 'ypseo';">이벤트게시물 작성하기</h4>
				<form action="SMF012" method="POST" enctype="multipart/form-data">
					<div class="col-mb-3">
						<label for="name">제목</label> <input type="text"
							class="form-control" 
							placeholder="제목을 입력해주세요" name="eTitle" required> <br />
					</div>
					<div class="row">
						<div class="col-md-5 mb-3">
							<label for="nickname">제목이미지</label> <input type="file"
								class="form-control" name="eImgFile"
								placeholder="영문, 숫자, 특수문자 혼합" required> <br /> <span
								id="pwResult1"></span>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-5 mb-3">
							<label>내용이미지</label> <input type="file"
								name="eContentFile" class="form-control" required>
							
						</div>
					</div>
				
				
					<div class="col-mb-3">
						<label for="nickname">쿠폰사용여부</label> <br /> 사용<input type="radio"
							name="Copon" value="YES" checked /> 사용안함<input type="radio"
							name="Copon" value="NO" />
						<div class="invalid-feedback">쿠폰사용여부를 선택해주세요.</div>
					</div>
				








				
					<button class="btn btn-primary btn-lg btn-block"
						type="submit">가입 완료</button>
				</form>
			</div>
		</div>
	
	</div>


</body>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>


</script>

</html>