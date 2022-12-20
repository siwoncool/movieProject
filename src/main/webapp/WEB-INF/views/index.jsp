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

<style>
.mainvideo {
	box-shadow: 0 0 5px #03e9f4, 0 0 25px #03e9f4, 0 0 50px #03e9f4, 0 0
		100px #03e9f4;
}

.uptext2 {
	position: absolute;
	transform: translate(45%, -100%);
	font-size: 30px;
	font-family: 'ypseo';
}
</style>


</head>

<body>


	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div data-aos="zoom-in" data-aos-delay="100"
			style="padding-left: 50px;">

			<div class="poster_wrap">

				<div class="maindiv">

					<video class="mainvideo" autoplay="" muted="">
						<source
							src="http://h.vod.cgv.co.kr/vodCGVa/86490/86490_209190_1200_128_960_540.mp4"
							type="video/webm">



						이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the
						video tag.)
					</video>
				</div>
				<div class="video_text">
					<strong class="videoStrong">더 메뉴</strong> <span class="videoSpan">
						<br /> <더 메뉴> <br />
						오늘밤 식사가 벌어진다. <br />
					</span> <a href="CMF004?mCode=11" class="btn blue">상세보기</a>
				</div>
			</div>



		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container" data-aos="fade-up">
				<h1 class="textfont">무비차트</h1>
				<div style="margin-top: 20px;">
					<h1 class="text">예매순</h1>
					<ul id="boxoffi">

					</ul>
				</div>
				<div style="margin-top: 20px;">
					<h1 class="text">좋아요순</h1>
					<ul id="like">

					</ul>
				</div>

			</div>
		</section>
		<!-- End About Section -->



	</main>
	<!-- End #main -->

	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<div id="preloader"></div>

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
	crossorigin="anonymous"></script>
<script>
	$.ajax({
		type : "POST",
		url : "CMF049",
		data : {
			"connect" : 'OK'
		},
		dataType : "json",
		success : function(result) {
			boxoffice(result);
		},
		error : function() {
			alert("CMF049함수 통신실패!");
		}
	});
	$.ajax({
		type : "POST",
		url : "CMF050",
		data : {
			"connect" : 'OK'
		},
		dataType : "json",
		success : function(result) {
			like(result);
		},
		error : function() {
			alert("CMF050함수 통신실패!");
		}
	});

	function boxoffice(result) {
		let output = "";
		for (let i = 0; i < result.length; i++) {
			ouput = "";
			output += "<li class='li1'>";
			output += "<div class='poster_wrap'>";
			output += "<div class='movie_img'>";
			output += "<a href='CMF004?mCode=" + result[i].mcode + "'>";
			output += "<img src='"+result[i].mposter+"' alt='' width='200px'>";
			output += "</a>";
			output += "</div>";
			if (i < 8) {
				output += "<div class='uptext'>";
			} else {
				output += "<div class='uptext2'>";
			}
			output += "<p>" + (i + 1) + "</p>";
			output += "</div>";
			output += "<div class='text'>";
			output += "<p>" + result[i].mtitle.substr(0, 8) + "</p>";
			output += "</div>";
			output += "</div>";
			output += "</li>";
			document.getElementById("boxoffi").innerHTML = output;
		}

	}

	function like(result) {
		let output = "";
		for (let i = 0; i < result.length; i++) {
			ouput = "";
			output += "<li class='li1'>";
			output += "<div class='poster_wrap'>";
			output += "<div class='movie_img'>";
			output += "<a href='CMF004?mCode=" + result[i].mcode + "'>";
			output += "<img src='"+result[i].mposter+"' alt='' width='200px'>";
			output += "</a>";
			output += "</div>";
			output += "<div class='uptext2'>";
			output += "<p>" + result[i].mlike + "👍</p>";
			output += "</div>";
			output += "<div class='text'>";
			output += "<p>" + result[i].mtitle.substr(0, 8) + "</p>";
			output += "</div>";
			output += "</div>";
			output += "</li>";
			document.getElementById("like").innerHTML = output;
		}

	}
</script>
</html>