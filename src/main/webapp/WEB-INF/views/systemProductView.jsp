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
	color: black;
	text-transform: uppercase;
	font-style:;
}

td {
	padding: 15px;
	text-align: center;
	vertical-align: middle;
	font-weight: 300;
	font-size: 20px;
	color: black;
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

	<div
		style="width: 980px; height: 500px; margin: auto; padding: 20px; background-color: white; margin-top: 300px; margin-bottom: 100px; color: black;">

		<table style="color: black; height: 460px;">
			<tr>
				<td style="padding-right: 90px;"><img width="130px"
					height="90px" src="resources/menu/${price.PImgName}"
					style="width: 400px; height: 400px;"></td>
				<td>
					<div id="move1" style="padding-bottom: 0px; margin-bottom: 310px; font-size:28px">
						${price.PName}</div>


					<div>
						<input type="hidden" name="pPrice" id="sum"
							value="${price.PPrice}"> <input type="hidden" name="pDc"
							id="pDc" value="${price.PDc}"> <input type="button"
							value="+" name="add" onclick="add()"class="btn btn-dark" /> <input type="text"
							min="1" value="1" class="btn btn-dark" id="count" size="1" name=inputValue readonly>
						<input type="button" value="-" name="minus" onclick="minus()" class="btn btn-dark" /> <span
							id="result1" class="btn btn-dark"></span>
					</div>

					<div class="fw-bolder">할인율 : ${price.PDc}%</div>
					<div id="move3">
						<button class="btn btn-dark" onclick="SMF026()">구매하기</button>
					</div>
				</td>
			</tr>
		</table>


	</div>









	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>



<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>
	let sum = Number(document.getElementById("sum").value);
	let pdc = Number(document.getElementById("pDc").value);
	let sum1 = 0;
	if(pdc!=0){
		 sum1 = sum - (sum * pdc / 100);
	}else{
		 sum1 = sum;
	}
	
	let endcount=1;
	
	sum1 = sum1/100;
	sum1 = (Math.round(sum1)*100);
	result1.innerHTML =  sum1+ "원";
	
	function add() {

		let count = Number(document.getElementById("count").value);
		console.log(sum1);
		console.log(count);

		count++;
		if(count>10){
			alert('최대 10개까지만 구매 가능합니다');
			count=10;
		}

		result = sum1 * count;
		console.log(count);
		endcount = count;
		result = result/100;
		result1.innerHTML = (Math.round(result)*100) + "원";
		$('input[name=inputValue]').attr('value', count);

	}
	function minus() {
		let count = Number(document.getElementById("count").value);
		console.log(sum);
		console.log(count);

		count--;
		if (count < 0) {
			count = 0;
		}
		let result = 0;
		result = sum1 * count;
		result = result/100;
		console.log(count);
		endcount = count;
		result1.innerHTML = (Math.round(result)*100)+ "원";
		$('input[name=inputValue]').attr('value', count);
		
	}
	function SMF026(){
		let pName=($("#move1").html());
		location.href='SMF026?sum='+(sum1*endcount)+'&pName='+pName+'&userId='+'${loginId}';
	}
	
</script>

</html>