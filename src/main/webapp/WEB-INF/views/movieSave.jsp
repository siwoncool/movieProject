<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>영화 그 이상의 감동. KPL</title>
<meta content="" name="description">
<meta content="" name="keywords">

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
			style="padding-left: 50px; padding-top: 200px;">

			<div class="container">
				<div class="input-form-backgroud row" style="padding-left: 800px">
					<form action="CMF003" method="POST">
						<h1 class="text">예고편 유트브 퍼가기</h1>
						<input type="text" name="mPreView" /> <input type="hidden"
							name="mTitle" value="${movie.MTitle}" /> <input type="hidden"
							name="mGenre" value="${movie.MGenre}" /> <input type="hidden"
							name="mOpen" value="${movie.MOpen}" /> <input type="hidden"
							name="mRunTime" value="${movie.MRunTime}" /> <input type="hidden"
							name="mAge" value="${movie.MAge}" /> <input type="hidden"
							name="mPoster" value="${movie.MPoster}" /> <input type="submit"
							value="저장하기" />
					</form>
					<table>
						<tr>
							<td>제목</td>
							<td>${movie.MTitle}</td>
						</tr>
						<tr>
							<td>장르</td>
							<td>${movie.MGenre}</td>
						</tr>
						<tr>
							<td>개봉일</td>
							<td>${movie.MOpen}</td>
						</tr>
						<tr>
							<td>상영시간</td>
							<td>${movie.MRunTime}</td>
						</tr>
						<tr>
							<td>관람가</td>
							<td>${movie.MAge}</td>
						</tr>
						<tr>
							<td>포스터</td>
						</tr>
						<tr>
							<td colspan="2"><img alt="" src="${movie.MPoster}"
								width="300px"></td>
						</tr>
					</table>
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
<c:if test="${loginId eq null }">
	<script>
		alert('로그인을 해주세요~');
		location.href = "MMF006";
	</script>
</c:if>

</html>