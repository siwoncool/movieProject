<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>영화 그 이상의 감동. MY KPL</title>
<meta content="" name="description">
<meta content="" name="keywords">

<style>
body {
	background-color: #212121;
	background-size: cover;
	background: rgba(0, 0, 0, 0.5);
}
</style>


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

<!-- =======================================================
  * Template Name: Restaurantly - v3.9.1
  * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->



</head>

<body>


	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div data-aos="zoom-in" data-aos-delay="100"
			style="padding-left: 700px; padding-top: 175px;">

			<div class="container">
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto"
						style="font-size: 15px; width: 450px">
						<h4 class="mb-3" style="font-family: 'ypseo';">비밀번호찾기</h4>
						<form name="pwfindscreen" method="POST">
							<div class="search-title"></div>
							<section class="form-search">
								<div class="find-id">
									<label>아이디</label> <input type="text" name="mId" id="mId"
										class="btn-name" placeholder="아이디"> <br>
								</div>

								<div class="find-phone">
									<label>이름</label> <input type="text" name="mName" id="mName"
										class="btn-phone" placeholder="">
								</div>
								<div class="find-phone">
									<label>전화번호</label> <input type="text" name="mPhone"
										id="mPhone" class="btn-phone" placeholder="휴대폰번호를 '-'없이 입력">
								</div>
								<br>
							</section>
							<div class="btnSearch">
								<input type="button" name="enter" value="찾기" onClick="MMF015()"
									class="btn btn-dark"> <input type="button"
									name="cancle" value="취소" onClick="history.back()"
									class="btn btn-dark">
							</div>
						</form>

						<hr />
						<div class="mb-4"></div>
					</div>
				</div>
			</div>
		</div>



	</section>
	<!-- End Hero -->



	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="resources/assets/vendor/aos/aos.js"></script>
	<script
		src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/assets/js/main.js"></script>



</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<script>
	function MMF015() {
		let mId = document.getElementById("mId").value;
		let mName = document.getElementById("mName").value;
		let mPhone = document.getElementById("mPhone").value;

		$.ajax({
			type : "POST",
			url : "MMF015",
			data : {
				"mId" : mId,
				"mName" : mName,
				"mPhone" : mPhone
			},
			dataType : "text",
			success : function(result) {
				if (result != "NO") {
					alert("성공!" + result);
					location.href = "MMF016?mId=" + result;
				} else {
					alert("회원정보가 틀렸습니다.")
				}

			},
			error : function() {
				alert("MMF006함수 통신실패!");
			}
		});
	}
</script>
</html>