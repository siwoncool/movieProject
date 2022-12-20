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

<title>상품리스트</title>

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

<style>
li {
	list-style: none;
}

img {
	width: 200px;
	height: 200px;
}

.real-upload {
	display: none;
}

.upload {
	
}

.image-preview {
	width: 200px;
}

h1 {
	font-size: 30px;
	color: #fff;
	text-transform: uppercase;
	font-weight: 300;
	text-align: center;
	margin-bottom: 15px;
}

table {
	width: 100%;
	table-layout: fixed;
}

.tbl-header {
	background-color: rgba(255, 255, 255, 0.3);
}

.tbl-content {
	height: 300px;
	overflow-x: auto;
	margin-top: 0px;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

th {
	padding: 20px 15px;
	text-align: center;
	font-weight: 600;
	font-size: 20px;
	color: #fff;
	text-transform: uppercase;
	font-style:;
}

td {
	padding: 15px;
	text-align: center;
	vertical-align: middle;
	font-weight: 300;
	font-size: 20px;
	color: #fff;
	border-bottom: solid 1px rgba(255, 255, 255, 0.1);
}

/* demo styles */
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

body {
	background-color: black;
	font-family: 'Roboto', sans-serif;
}

section {
	margin: 50px;
}

/* follow me template */
.made-with-love {
	margin-top: 40px;
	padding: 10px;
	clear: left;
	text-align: center;
	font-size: 10px;
	font-family: arial;
	color: #fff;
}

.made-with-love i {
	font-style: normal;
	color: #F50057;
	font-size: 14px;
	position: relative;
	top: 2px;
}

.made-with-love a {
	color: #fff;
	text-decoration: none;
}

.made-with-love a:hover {
	text-decoration: underline;
}

/* for custom scrollbar for webkit browser*/
::-webkit-scrollbar {
	width: 6px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

::-webkit-scrollbar-thumb {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container" style="margin-top: 200px;">





		<section>
			<!--for demo wrap-->
			<h1 class="text">상품리스트</h1>
			<div class="tbl-header" style="width: 1200px">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>이미지</th>
							<th>상품이름</th>
							<th>종류</th>
							<th>가격</th>
							<th>할인</th>


						</tr>
					</thead>
				</table>
			</div>
			<div class="tbl-content" style="height: 1000px; width: 1200px">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>


						<c:forEach var="price" items="${price}">
							<c:if test="${price.PType ne '예매'}">
								<tr>
									<td><a href="SMF023?pName=${price.PName}"><img
											width="130px" height="90px"
											src="resources/menu/${price.PImgName}"></a></td>
									<td>${price.PName}</td>
									<td>${price.PType}</td>
									<td>${price.PPrice}</td>
									<td>${price.PDc}%</td>

								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</section>


		<!-- follow me template -->
		<div class="made-with-love">
			Made with <i>♥</i> by <a target="_blank"
				href="https://codepen.io/nikhil8krishnan">Nikhil Krishnan</a>
		</div>


	</div>










	</div>
	</div>
	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>


</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>
	
</script>

</html>