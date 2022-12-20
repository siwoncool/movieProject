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
			style="padding-left: 50px;">

			<div class="container">
				<div class="input-form-backgroud row"
					style="padding-left: 650px; padding-top: 75px;">
					<table>
						<tr>
							<td rowspan="8" style="width: 310px;"><img alt=""
								src="${movie.MPoster}" width="300px"></td>
						</tr>
						<tr>
							<td>제목 :</td>
							<td>${movie.MTitle}<input type="hidden" id="memId"
								value="${loginId}" /> <input type="hidden" id="mCode"
								value="${movie.MCode}" />
							</td>
						</tr>
						<tr>
							<td>장르 :</td>
							<td>${movie.MGenre}</td>
						</tr>
						<tr>
							<td>개봉일 :</td>
							<td>${movie.MOpen}</td>
						</tr>
						<tr>
							<td>상영시간 :</td>
							<td>${movie.MRunTime}</td>
						</tr>
						<tr>
							<td>관람가 :</td>
							<td>${movie.MAge}</td>
						</tr>
						<tr>
							<td colspan="2"><a href="CMF025?mCode=${movie.MCode}"
								class="book-a-table-btn scrollto d-none d-lg-flex"
								style="padding: 5px 14px !important; margin: 0px; width: 90px; float: right;">예매하기</a>
								<div style="float: right;">&nbsp;&nbsp;&nbsp;</div> <a href="#"
								class="book-a-table-btn scrollto d-none d-lg-flex"
								onclick="CMF006();" id="likebtn"
								style="padding: 5px 10px !important; margin: 0px; width: auto; float: right;"><span
									style="margin-right: 10px;">좋아요 👍 </span><span id="like"></span></a></td>
						</tr>
						<tr></tr>
						<tr>

							<td colspan="3" style="padding-top: 15px; font-size: 25px;">
								예고편</td>
						</tr>
						<tr>
							<td colspan="3">${movie.MPreView}</td>
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

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<script>
	let memId = document.getElementById("memId").value;
	let mCode = document.getElementById("mCode").value;
	let click = 0;
	$.ajax({
		type : "POST",
		url : "CMF006",
		data : {
			"memId" : memId,
			"mCode" : mCode,
			"click" : click
		},
		dataType : "json",
		success : function(result) {
			console.log(result);
			changeLike(result);
		},
		error : function() {
			alert("MMF006함수 통신실패!");
		}
	});

	function CMF006() {
		click = 1;

		$.ajax({
			type : "POST",
			url : "CMF006",
			data : {
				"memId" : memId,
				"mCode" : mCode,
				"click" : click
			},
			dataType : "json",
			success : function(result) {
				changeLike(result);
			},
			error : function() {
				alert("MMF006함수 통신실패!");
			}
		});
	}

	function changeLike(result) {
		let like = document.getElementById("like");
		let likebtn = document.getElementById("likebtn");

		// 좋아요 갯수 표시
		like.innerHTML = result.mlcount;

		// 좋아요 눌렀나 안눌렀나? css 변화 1이면 누른거
		if (result.mldo == 1) {
			likebtn.style.background = '#ff0000';
			likebtn.style.borderColor = '#ff0000';

			likebtn.addEventListener('mouseover', function() {
				likebtn.style.background = 'black';
				likebtn.style.borderColor = 'white';

			});
			likebtn.addEventListener('mouseout', function() {
				likebtn.style.background = '#ff0000';
				likebtn.style.borderColor = '#ff0000';

			});
		} else {
			likebtn.style.background = 'none';
			likebtn.style.borderColor = 'white';

			likebtn.addEventListener('mouseover', function() {
				likebtn.style.background = '#ff0000';
				likebtn.style.borderColor = '#ff0000';

			});
			likebtn.addEventListener('mouseout', function() {
				likebtn.style.background = 'none';
				likebtn.style.borderColor = 'white';

			});
		}
	}
</script>

</html>