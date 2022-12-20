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

<title>상영관추가</title>

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
.seat {
	width: 30px;
	height: 30px;
	background-color: black;
	color: white;
	border-color: gray;
}

.clicked {
	background-color: red;
}
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container" style="width: 1980px;">
		<ul style="list-style: none;">
			<li style="display: inline-block;">
				<div class="input-form-backgroud row" style="padding-top: 85px">
					<div class="input-form col-md-12 mx-auto">
						<h4 class="mb-3" style="font-family: 'ypseo';">상영관추가</h4>
						<form action="CMF013" method="POST">
							<div class="col-mb-3">
								<label for="name">지점</label> <select name="tName" id="tName"
									onchange="CMF012()">
									<c:forEach var="list" items="${branchName}">
										<option value="${list}">${list}</option>
									</c:forEach>
								</select> <br /> <br />
							</div>


							<div class="col-mb-3">
								<label for="name">지점 상영관 넘버: </label> <br /> <input
									id="branchTheather" name="tNum" type="number" value="${count}"
									readonly="readonly">
							</div>
							<br />
							<div class="col-mb-3">
								<label for="name">상영관 타입 : </label> <select name="tType">
									<option value="2D">2D</option>
									<option value="4DX">4DX</option>
									<option value="IMAX">IMAX</option>
								</select>

							</div>
							<br />

							<div class="col-mb-3">
								<label for="name">좌석 끝행 : </label> <select name="tLineEnd"
									id="line" onchange="s_result()">
									<option value="I">I</option>
									<option value="J">J</option>
									<option value="K">K</option>
									<option value="L">L</option>
								</select>

							</div>
							<br />

							<div class="col-mb-3">
								<label for="name">좌석 끝열 : </label> <input type="number" min="10"
									max="18" value="10" name="tRowEnd" id="row"
									onchange="s_result()">

							</div>
							<br />


							<div class="col-mb-3">
								<label for="name">총좌석수 : </label> <span>좌석</span> <input
									type="number" name="tSize" value="0" id="tSize" style="width: 58px;"
									readonly="readonly">

							</div>
							<br />
							<div class="col-mb-3">
								<label for="name">영화 배정: </label> <select name="tMCode" style="width: 150px;">
									<c:forEach var="movieList" items="${movieList}">
										<option value="${movieList.MCode}">${movieList.MTitle}</option>
									</c:forEach>
								</select>

							</div>
							<br />
							<hr class="mb-4">

							<div class="mb-4"></div>
							<button class="btn btn-primary btn-lg btn-block" type="submit">상영관 추가</button>
						</form>
					</div>
				</div>
			</li>
			<li style="display: inline-block;">
				<div class="input-form-backgroud row" style="padding-left: 80px;">
					<div class="input-form col-md-12 mx-auto"
						style="width: 1500px; height: 700px; font-size: 25px;">
						<div style="text-align: center;">
							<hr />
							Screen
							<hr />
							<br/>
							<br/>
						</div>
						<div style="padding-left: 10px;">
							<div class="seat-wrapper" id="seatArea" style="font-size: 11px; text-align: center;"></div>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>
	function CMF012() {
		let tName = document.getElementById("tName").value;
		let branchTheather = document.getElementById("branchTheather");
		$.ajax({
			type : "POST",
			url : "CMF012",
			data : {
				"tName" : tName
			},
			dataType : "json",
			success : function(result) {
				branchTheather.value = result;

			},
			error : function() {
				alert("CMF012함수 통신실패!");
			}
		});
	}
</script>
<script>
	s_result();
	function s_result() {
		let line = document.getElementById("line").value;
		let row = document.getElementById("row").value;
		let line2 = 0;

		switch (line) {
		case "A":
			line2 = 1;
			break;
		case "B":
			line2 = 2;
			break;
		case "C":
			line2 = 3;
			break;
		case "D":
			line2 = 4;
			break;
		case "E":
			line2 = 5;
			break;
		case "F":
			line2 = 6;
			break;
		case "G":
			line2 = 7;
			break;
		case "H":
			line2 = 8;
			break;
		case "I":
			line2 = 9;
			break;
		case "J":
			line2 = 10;
			break;
		case "K":
			line2 = 11;
			break;
		case "L":
			line2 = 12;
			break;
		case "M":
			line2 = 13;
			break;
		case "N":
			line2 = 14;
			break;
		case "O":
			line2 = 15;
			break;
		case "P":
			line2 = 16;
			break;
		case "Q":
			line2 = 17;
			break;
		case "R":
			line2 = 18;
			break;
		case "S":
			line2 = 19;
			break;
		case "T":
			line2 = 20;
			break;
		case "U":
			line2 = 21;
			break;
		case "V":
			line2 = 22;
			break;
		case "W":
			line2 = 23;
			break;
		case "X":
			line2 = 24;
			break;
		case "Y":
			line2 = 25;
			break;
		case "Z":
			line2 = 26;
			break;
		}

		let size = (line2 * row);
		document.getElementById("tSize").value = size;
		seatPlan(line2,row);
	}
	
	function seatPlan(line, row) {
		let seatArea = document.getElementById("seatArea")
		seatArea.innerHTML="";
		let test = [];
		let selectedSeats = new Array();
		let selectedSeatsMap = [];
		const seatWrapper = document.querySelector(".seat-wrapper");
		let clicked = "";
		let div = "";

		for (let i = 1; i <= line; i++) {
			div = document.createElement("div");
			seatWrapper.append(div);
			for (let j = 1; j <= row; j++) {
				const input = document.createElement('input');
				input.type = "button";
				input.name = "seats"
				input.classList = "seat";
				//3중포문을 사용하지 않기위해 
				mapping(input, i, j);
				div.append(input);
				input.addEventListener('click', function (e) {
					console.log(e.target.value);
					//중복방지 함수
					selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

					//click class가 존재할때(제거해주는 toggle)
					if (input.classList.contains("clicked")) {
						input.classList.remove("clicked");
						clicked = document.querySelectorAll(".clicked");
						selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
						clicked.forEach((data) => {
							selectedSeats.push(data.value);
						});
						//click class가 존재하지 않을때 (추가해주는 toggle)
					} else {
						input.classList.add("clicked");
						clicked = document.querySelectorAll(".clicked");
						clicked.forEach((data) => {
							selectedSeats.push(data.value);
						})
					}
					console.log(selectedSeats);
				})
			}
		}
	}


	function mapping(input, i, j) {
		if (i === 1) {
			input.value = "A" + j;
		} else if (i === 2) {
			input.value = "B" + j;
		} else if (i === 3) {
			input.value = "C" + j;
		} else if (i === 4) {
			input.value = "D" + j;
		} else if (i === 5) {
			input.value = "E" + j;
		} else if (i === 6) {
			input.value = "F" + j;
		} else if (i === 7) {
			input.value = "G" + j;
		} else if (i === 8) {
			input.value = "H" + j;
		} else if (i === 9) {
			input.value = "I" + j;
		} else if (i === 10) {
			input.value = "J" + j;
		} else if (i === 11) {
			input.value = "K" + j;
		} else if (i === 12) {
			input.value = "L" + j;
		} else if (i === 13) {
			input.value = "M" + j;
		} else if (i === 14) {
			input.value = "N" + j;
		} else if (i === 15) {
			input.value = "O" + j;
		} else if (i === 16) {
			input.value = "P" + j;
		} else if (i === 17) {
			input.value = "Q" + j;
		} else if (i === 18) {
			input.value = "R" + j;
		} else if (i === 19) {
			input.value = "S" + j;
		} else if (i === 20) {
			input.value = "T" + j;
		} else if (i === 21) {
			input.value = "U" + j;
		} else if (i === 22) {
			input.value = "V" + j;
		} else if (i === 23) {
			input.value = "W" + j;
		} else if (i === 24) {
			input.value = "X" + j;
		} else if (i === 25) {
			input.value = "Y" + j;
		} else if (i === 26) {
			input.value = "Z" + j;
		}
	}
</script>

</html>