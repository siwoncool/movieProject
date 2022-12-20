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
			style="width: 100%; height: 60%; padding-right: 15%; padding-left: 15%;">
			<div style="padding-right: 225px;">
				<c:if test="${MODE eq 'admin' }">
				<a href="javascript:SMF007();"
					class="book-a-table-btn scrollto d-none d-lg-flex"
					style="float: right;">답변 등록</a> 					
					<a href="#"
					onclick="location.href='SMF008?cCode=${view.CCode}'"
					class="book-a-table-btn scrollto d-none d-lg-flex"
					style="float: right;">삭제</a></c:if> <br />
			</div>
			<br /> <br />
			<div style="float: left; width: 100%">
				<table style="width: 100%; font-size: 25px;">
					<tr>
						<th rowspan="2" style="width: 100px;">작성자</th>
						<td rowspan="2" style="color: white; width: 50px;">${loginId}<input
							type="hidden" value="${loginId}" id="cId" name="cId" /></td>
					</tr>
					<tr>
						<th rowspan="1" style="width: 100px; float: right;">글제목</th>
						<td>${view.CTitle}</td>
					</tr>
					<tr>
						<th rowspan="1" style="width: 100px; float: left;">글내용</th>
						<td>${view.CContent}</td>
					</tr>
					<tr>
						<th colspan="3"><br/><br/>답변 내용</th>
					</tr>
					<tr>
					<td colspan="4">${view.CAnswer1}</td>
					</tr>
					<c:if test="${MODE eq 'admin'}">
						<tr>
							<td colspan="3"><form action="SMF007" method="POST"
									name="answer">
									<input type="hidden" name="cCode" value="${view.CCode}" />
									<textarea name="cAnswer1"
										style="width: 80%; height: 120px; font-size: 18px;">${view.CAnswer1}</textarea>
								</form></td>
						</tr>
					</c:if>
				</table>

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
<script>
	function SMF007() {
		answer.submit();
	}
</script>
</html>