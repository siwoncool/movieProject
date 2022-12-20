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
.li1 {
	width: 120px;
	height: 40px;
	line-height: 40px;
	/* 세로 가운데 정렬 : height의 값과 동일하게 설정*/
	text-align: center;
	/* 가로 가운데 정렬 : text-align을 center로 지정*/
	font-weight: bold; /* 글자 굵기*/
	font-size: 15px; /* 글자 크기*/
	border-radius: 20px; /* 모서리 각진 부분을 둥굴게 함*/
	display: inline-block; /* 한줄 정렬 + 리스트 모양이 사라짐*/
}

.modal {
	display: none;
	z-index: 1;
	background-color: rgba(0, 0, 0, .3);
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.modal>#content {
	width: 400px;
	margin-top: 500px;
	margin-left: 750px;
	position: relative;
	background-color: black;
	text-align: left;
	padding-left: 30px;
	font-size: 20px;
}

.modal .close {
	font-size: 25px;
	height: 30px;
	border: 0;
	color: white;
	float: right;
	background-color: black;
}

.modal .close:hover, .modal .close:focus {
	color: red;
	text-decoration: none;
	cursor: pointer;
}
</style>

</head>

<body>


	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex">
		<div data-aos="zoom-in" data-aos-delay="100"
			style="padding-top: 110px;">
			<div style="padding-left: 310px; padding-top: 100px; width: 1500px;">
				<h1 class="text">지점</h1>
				<br />
				<ul>

					<li class="li1"><a
						style="padding: 0px 20px !important; margin: 0px; margin-right: 45px;"
						href="javascript:takeLocation('서울');"
						class="book-a-table-btn scrollto d-none d-lg-flex">서울</a></li>
					<li class="li1"><a
						style="padding: 0px 20px !important; margin: 0px; margin-right: 45px;"
						href="javascript:takeLocation('경기');"
						class="book-a-table-btn scrollto d-none d-lg-flex">경기</a></li>
					<li class="li1"><a
						style="padding: 0px 20px !important; margin: 0px; margin-right: 45px;"
						href="javascript:takeLocation('인천');"
						class="book-a-table-btn scrollto d-none d-lg-flex">인천</a></li>
				</ul>
			</div>
			<div
				style="margin-left: 310px; margin-top: 50px; padding-top: 50px; padding-left: 20px; width: 1300px; height: 500px; border: 2px inset white; border-color: white;">

				<ul id="branchArea">



				</ul>


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
	// 페이지 시작시 서울지점으로 불러오기
	let bLocation = "서울";
	$.ajax({
		type : "POST",
		url : "CMF010",
		data : {
			"bLocation" : bLocation
		},
		dataType : "json",
		success : function(result) {
			//console.log(result);
			changeLi(result);
		},
		error : function() {
			alert("MMF010함수 통신실패!");
		}
	});

	// a태그 클릭시 지점 불러오기
	function takeLocation(bLocation) {
		$.ajax({
			type : "POST",
			url : "CMF010",
			data : {
				"bLocation" : bLocation
			},
			dataType : "json",
			success : function(result) {
				//console.log(result);
				changeLi(result);
			},
			error : function() {
				alert("MMF010함수 통신실패!");
			}
		});
	}

	// 지점 불러온거 띄어주기
	function changeLi(result) {
		let output = "";

		for ( let i in result) {
			//console.log(i);
			//console.log(result[0].bname);
			//console.log(result[0].blocation);
			//console.log(result[0].baddr);
			//console.log(result[0].bcall);
			output += "<li class='li1'><a ";
			output += "style='padding: 0px 5px !important; margin: 15px; margin-top: 20px;'";
			output += "href='javascript:openbtn(" + i + ");'";
			output += "class='book-a-table-btn scrollto d-none d-lg-flex'>"
					+ result[i].bname + "</a>";
			output += "<div class='modal' id='modal"+i+"'>";
			output += "<div id='content'>";
			output += "<input type='button' value='X' class='close' ";
			output += "onclick='closebtn(" + i + ")' /> <label>이름 : "
					+ result[i].bname + " </label><br /> <label>지역";
			output += ": " + result[i].blocation
					+ " </label><br /> <label>주소 : " + result[i].baddr
					+ " </label><br /> <label>전화번호 : " + result[i].bcall
					+ "</label><br />";
			output += "</div></div></li>";
		}

		document.getElementById("branchArea").innerHTML = output;
	}
</script>

<script>
	// modal 창을 감춤
	function closebtn(num) {
		var modal = document.getElementById('modal' + num);
		modal.style.display = 'none';

	}

	// modal 창을 보여줌
	function openbtn(num) {
		var modal = document.getElementById('modal' + num);
		modal.style.display = 'block';

	}
</script>
</html>