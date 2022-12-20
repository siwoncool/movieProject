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

html {
	height: 100%;
}

.login-box {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	padding: 40px;
	transform: translate(-50%, -50%);
	background: rgba(0, 0, 0, .5);
	box-sizing: border-box;
	box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
	border-radius: 10px;
}

.login-box h2 {
	margin: 0 0 30px;
	padding: 0;
	color: #fff;
	text-align: center;
}

.login-box .user-box {
	position: relative;
}

.login-box .user-box input {
	width: 100%;
	padding: 10px 0;
	font-size: 16px;
	color: #fff;
	margin-bottom: 30px;
	border: none;
	border-bottom: 1px solid #fff;
	outline: none;
	background: transparent;
}

.login-box .user-box label {
	position: absolute;
	top: 0;
	left: 0;
	padding: 10px 0;
	font-size: 16px;
	color: #fff;
	pointer-events: none;
	transition: .5s;
}

.login-box .user-box input:focus ~ label, .login-box .user-box input:valid 
	 ~ label {
	top: -20px;
	left: 0;
	font-size: 12px;
}

.login-box form a {
	position: relative;
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	text-decoration: none;
	text-transform: uppercase;
	overflow: hidden;
	transition: .5s;
	margin-top: 40px;
	letter-spacing: 4px
}

.login-box a:hover {
	color: white;
	box-shadow: 0 0 5px #03e9f4, 0 0 25px #03e9f4, 0 0 50px #03e9f4, 0 0
		100px #03e9f4;
}
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div style="width: 1500px; height: 2000px; margin-top: 200px;">
		<div style="padding-left: 300px; margin-top: 50px;">
			<h2 style="color: white" class="text">이벤트 상세보기</h2>
			<c:if test="${MODE eq 'admin'}">
				<input type="button" value="이벤트 삭제하기"
					onclick="location.href='SMF014?eNum=${offevent.ENum}'">
			</c:if>
			<br /> <input type="hidden" id="cId" value="${loginId}">
			<div style="margin: 15px;">
				<h1 class="text" style="color: white">${offevent.ETitle}</h1>
				<input type="hidden" id="cName" value="${offevent.ETitle}">
			</div>
			<div style="margin: 15px; text-align: center;">
				<img width="1000px" height="2000px"
					src="resources/eventimg/${offevent.EContent}">
			</div>
			<div style="text-align: center;">
				<c:if test="${offevent.copon eq 'YES'}">

					<input type="button" value="쿠폰 생성"
						style="width: 516px; height: 56px;"
						onclick="SMF013()">
				</c:if>
				<br /> <span id="cuponadd" style="color: white; font-size: 40px"
					class="text"></span> <br />
			</div>
			<div></div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<script>
	// 쿠폰 등록하고 생성해서 가져오기
	function SMF013() {
		let cName = document.getElementById("cName").value;
		let cId = document.getElementById("cId").value;
		console.log(cId);
		console.log(cName);

		$.ajax({
			type : "POST",
			url : "SMF013",
			data : {
				"cName" : cName,
				"cId" : cId
			},
			dataType : "text",
			success : function(result) {
				//alert("성공!" + result);
				cuponadd(result);
			},
			error : function() {
				alert("SMF013함수 통신실패!");
			}
		});
	}

	// html에다가 ajax로 가져온 쿠폰번호 넣기
	function cuponadd(result) {
		let output = "";

		output += " 쿠폰번호 : ";
		output += result;

		document.getElementById("cuponadd").innerHTML = output;
	}
</script>
</html>