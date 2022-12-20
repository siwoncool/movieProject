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
						<h4 class="mb-3" style="font-family: 'ypseo';">마이페이지</h4>
						<ul style="list-style: none;">
							
							<c:choose>
							<c:when test="${loginId eq member.MId}">
							<li class="navright"><a href="MMF012?mId=${member.MId}"
								class="book-a-table-btn scrollto d-none d-lg-flex"
								onclick="mDelete1()">탈퇴</a></li>
							<li class="navright"><a href="MMF010?mId=${member.MId}"
								class="book-a-table-btn scrollto d-none d-lg-flex">수정</a></li>
							</c:when>
							<c:when test="${MODE ne member.MMode}">
							<li class="navright"><a href="MMF012?mId=${member.MId}"
								class="book-a-table-btn scrollto d-none d-lg-flex"
								onclick="mDelete2()">강제 탈퇴</a></li>
							<li class="navright"><a href="MMF022?mId=${member.MId}"
								onclick="mAdmin()" class="book-a-table-btn scrollto d-none d-lg-flex">관리자 부여</a></li>
							</c:when>
														
							</c:choose>
							
						</ul>
						<div class="col-mb-3">
							<label for="nickname"><i class="bi bi-file-image"></i>
								프로필사진 <br /> <img alt=""
								src="resources/profile/${member.MProFileName}" width="200px"></label>
							<div class="invalid-feedback"></div>
							
						</div>
						<hr />
						<div class="col-mb-3">
							<label for="name"> <i class="bi bi-person-fill"></i> 아이디 <span style="margin-left: 250px;">포인트: ${member.MPoint}</span><br />${member.MId}</label>
							<br />
						</div>
						<hr />
						<div class="col-mb-3">
							<label for="nickname"><i class="bi bi-tag"></i> 이름<br />${member.MName}</label>
						</div>
						<hr />
						<div class="col-mb-3">
							<label for="nickname"><i class="bi bi-gift"></i> 생년월일 <br />
								${member.MBirth}</label>
						</div>
						<hr />
						<div class="col-mb-3">
							<label for="nickname"><i class="bi bi-gender-ambiguous"></i>
								성별 <br /> ${member.MGender}</label>
						</div>
						<hr />
						<div class="col-mb-3">
							<label for="nickname"><i class="bi bi-envelope"></i> 이메일
								<br /> ${member.MEmail}</label>
						</div>
						<hr />
						<c:if test="${member.MAddr eq '(null) null, null'}">
							<div class="col-mb-3">
								<i class="bi bi-briefcase"></i> 주소 <br />주소를 입력해주세요.
							</div>
						</c:if>
						<c:if test="${member.MAddr ne '(null) null, null'}">
							<div class="col-mb-3">
								<label for="nickname"><i class="bi bi-briefcase"></i> 주소
									<br /> ${member.MAddr}</label>
							</div>
						</c:if>
						<hr />
						<div class="col-mb-3">
							<label for="nickname"><i class="bi bi-phone"></i> 연락처 <br />${member.MPhone}</label>
							<div class="invalid-feedback"></div>
						</div>


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

	<script>
		function mDelete1() {
			alert('탈퇴가 완료되었습니다.')
			location.href = "index";
		}
		function mDelete2() {
			alert('강제탈퇴 하였습니다.')
			location.href = "index";
		}
		
		function mAdmin() {
			alert('관리자 권한이 부여되었습니다.');		
		}
		
	</script>
	
</body>
<c:if test="${loginId eq null }">
	<script>
		alert('로그인을 해주세요~');
		location.href = "MMF006";
	</script>
</c:if>

</html>