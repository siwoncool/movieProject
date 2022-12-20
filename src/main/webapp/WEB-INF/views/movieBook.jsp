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

<title>설레는 KPL예매♥</title>

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
	margin-top: 0px;
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

.branchDiv {
	width: 100px;
	border: 2px solid black;
	margin: 5px;
	font-size: 15px;
	background-color: black;
	color: white;
}

.branchDiv2 {
	width: 100px;
	border: 2px solid black;
	margin: 5px;
	font-size: 15px;
	background-color: black;
	color: white;
}

.dateDiv {
	width: 100px;
	border: 2px solid black;
	margin: 10px;
	margin-left: 20px;
	font-size: 15px;
	background-color: black;
	color: white;
	margin-left: 20px;
}

.thDiv {
	border: 2px solid black;
	color: white;
	background-color: black;
	margin: 5px;
	font-size: 15px;
	margin: 5px;
}

.formbtnDiv {
	width: 200px;
	border: 2px solid black;
	margin: 10px;
	margin-left: 30px; font-size : 15px;
	background-color: black;
	color: white;
	margin-left: 20px;
	font-size: 15px;
}
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="" style="width: 1980px; margin: 100px;">
		<ul style="list-style: none;">
			<li style="display: inline-block;">
				<div class="input-form-backgroud row"
					style="padding-top: 85px; padding-left: 30px;">
					<div class="input-form col-md-12 mx-auto">
						<h1 class="text">영화</h1>
						<div style="height: 400px; overflow: auto;">
							<ul style="list-style: none; padding-left: 5px;">
								<c:forEach var="list" items="${movieList}">
									<li><a href="javascript:chMovie(${list.MCode});">
											<div class="mClass" id="a${list.MCode}"
												style='border: 2px solid black; margin: 5px; font-size: 18px; background-color: black; color: white; text-align: center;'>
												${list.MTitle}</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</li>
			<li style="display: inline-block;">
				<div class="input-form-backgroud row" style="margin-left: 15px;">
					<div class="input-form col-md-12 mx-auto" style="width: 300px;">
						<h1 class="text">지점</h1>
						<div style="height: 400px;">
							<ul style='padding-left: 0px;' id='selectedMovie'>
								<li class='li1' style='font-size: 25px;'>영화를 골라주세요</li>
							</ul>
						</div>
					</div>
				</div>
			</li>
			<li style="display: inline-block;">
				<div class="input-form-backgroud row"
					style="margin-left: 15px; width: 200px;">
					<div class="input-form col-md-12 mx-auto"
						style="width: 200px; text-align: center;">
						<h1 class="text">날짜</h1>
						<div style="height: 400px;">
							<ul style='padding-left: 0px; text-align: center;'
								id='selectDate' type="none">
								<li class='li1' style='font-size: 25px;'>영화와 지점을 골라주세요</li>
							</ul>
						</div>
					</div>
				</div>
			</li>
			<li style="display: inline-block;">
				<div class="input-form-backgroud row"
					style="margin-left: 15px; width: 620px;">
					<div class="input-form col-md-12 mx-auto" style="width: 620px;">
						<h1 class="text">시간</h1>
						<div style="height: 400px; width: 620px; overflow: auto;">
							<ul style='padding-left: 0px; text-align: center;'
								id='selectedDate' type="none">
								<li class='li1' style='font-size: 25px;'>시간을 골라주세요</li>
							</ul>
						</div>
					</div>
				</div>
			</li>
		</ul>
		<div class="input-form-backgroud row"
			style="margin-top: 0px; padding-top: 0px; padding-left: 30px; width: 1600px;">
			<div class="input-form col-md-12 mx-auto"
				style="margin-top: 0px; padding-top: 0px; width: 1600px; margin-left: 30px !important; margin-right: 30px !important;">
				<br />
				<h1 class="text">영화정보</h1>
				<ul style="width: 1600px;">
					<li class="li1">
						<ul id="movieinfo"
							style="width: 400px; padding-left: 0px; text-align: left;">
							<li class='li1' style="font-size: 25px;">영화를 골라주세요</li>
						</ul>
					</li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1"
						style="vertical-align: top; width: 200px; text-align: left;">
						&nbsp;&nbsp;&nbsp;&nbsp;지점: <span id="lowbranch"></span><br />
						&nbsp;&nbsp;&nbsp;&nbsp;일시: <span id="rowdate"></span><br />&nbsp;&nbsp;&nbsp;&nbsp;상영관:
						<span id="rownum"></span>
					</li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1" style="vertical-align: top; font-size: 40px; margin: 15px;">&nbsp;
						➤ &nbsp;좌석선택 &nbsp;</li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1" style="vertical-align: top; font-size: 40px; margin: 15px;">&nbsp;
						➤ &nbsp;결제 &nbsp;</li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1" style="vertical-align: top;">
 						<form action="CMF033" method="post" name="makeByFish">	
							<input type="hidden" id="sendPoster" name="Poster"/>
							<input type="hidden" id="sendTitle" name="Title"/>
							<input type="hidden" id="sendGenre" name="Genre"/>
							<input type="hidden" id="sendAge" name="Age"/>
							<input type="hidden" id="sendRunTime" name="RunTime"/>
							<input type="hidden" id="sendBranch" name="Branch"/>
							<input type="hidden" id="sendDate" name="Date"/>
							<input type="hidden" id="sendNum" name="Num"/>
							<input type="hidden" name="userId" value="${loginId}"/>
							
							<input type="hidden" value="0" id="sendbCode" name="bCode"/>
							<div class="formbtnDiv">
								<span id='lastCheck'>좌석선택</span>
							</div>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</div>




	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<c:if test="${loginId eq null }">
	<script>
		alert('로그인후 예매해 주세요');
		location.href = 'MMF006';
	</script>
</c:if>
<c:if test="${loginId ne null }">
	<script>
		let mCode = '${mCode}';
		let mClass = document.getElementsByClassName("mClass");
		let age = 0;
		let bLocation = "";
		let tName = "";
		let checkPoint = 0;
		let bDate = "";
		let mTitle = "";
		let tNum = 0;
		let endchoice = '${bCode}';
		let once = 0;
		let check952 = 0;
		let passCode ='${bCode}';

		// 구매자 나이 구해오기
		let user = '${loginId}';
		$.ajax({
			type : "POST",
			url : "CMF028",
			data : {
				"user" : user
			},
			dataType : "json",
			success : function(result) {
				age = result;
				// 여기서 예매 불러온 정보 미리 넣어줄거 넣어주기
				if (endchoice != 0) {
					chMovie('${result.MCode}');

				} else if (mCode != 0) {
					chMovie(mCode);
				}
			},
			error : function() {
				alert("CMF028함수 통신실패!");
			}
		});

		function chMovie(chM) {
			mCode = chM;
			console.log(mCode);
			for (let i = 0; i < mClass.length; i++) {
				mClass[i].style.backgroundColor = "black";
			}
			document.getElementById("a" + chM).style.backgroundColor = "red";
			resetCheckPoint();
			resetlow();
			resetright();
			CMF027();
		}

		// 해당 영화를 상영하는 지점의 이름과 지역 가져오기
		function CMF026() {
			$.ajax({
				type : "POST",
				url : "CMF026",
				data : {
					"mCode" : mCode
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					showBranchLocation(result);

					if (endchoice != 0 && once == 0) {
						chbLocation('${result.BLocation}');
					}

				},
				error : function() {
					alert("CMF026함수 통신실패!");
				}
			});
		}
		// 선택한 영화 정보
		function CMF027() {
			$.ajax({
				type : "POST",
				url : "CMF027",
				data : {
					"mCode" : mCode
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					movieInfo(result);
				},
				error : function() {
					alert("CMF027함수 통신실패!");
				}
			});
		}

		// 영화정보와 나이계산
		function movieInfo(result) {
			let output = "<li class='li1' style='vertical-align: top;'>";
			output += "<img alt='' src='"+result.mposter+"' width='150px'>";
			output += "</li>";
			output += "<li class='li1' style='margin-left:10px;'>";
			output += "<div style='width:230px; overflow: auto;'>";
			output += result.mtitle.substr(0, 15);
			output += "</div>";
			output += result.mgenre;
			output += "<br/>";
			output += result.mage;
			output += "<br/>";
			output += result.mrunTime;
			output += "<br/>";
			output += "</li>";
			document.getElementById("movieinfo").innerHTML = output;
			mTitle = result.mtitle;
			
			document.getElementById("sendPoster").value = result.mposter;
			document.getElementById("sendTitle").value = result.mtitle.substr(0, 15);
			document.getElementById("sendGenre").value = result.mgenre;
			document.getElementById("sendAge").value = result.mage;
			document.getElementById("sendRunTime").value = result.mrunTime;

			output = "<li class='li1' style='vertical-align: top;'>";
			output += "<ul style='padding-left: 0px;' type='none' id='brLocation'>";

			output += "</ul>";
			output += "</li>";
			output += "<li class='li1' style='vertical-align: top;'>";
			output += "<ul style='padding-left: 0px;' type='none' id='brName'>";

			output += "</ul>";
			output += "</li>";

			let output2 = "<li class='li1' style='font-size: 25px;'>영화를 골라주세요</li>";
			if (result.mage == "전체") {
				document.getElementById("selectedMovie").innerHTML = output;
				CMF026();

			} else if (result.mage.substr(5, 3) == "청소년") {
				let ageCheck = 19;

				if (age >= ageCheck) {
					document.getElementById("selectedMovie").innerHTML = output;
					CMF026();
				} else {
					alert('예매 불가한 관람가입니다.');
					document.getElementById("selectedMovie").innerHTML = output2;
				}
			} else {
				let ageCheck = parseInt(result.mage.substr(5, 2));

				if (age >= ageCheck) {
					document.getElementById("selectedMovie").innerHTML = output;
					CMF026();

				} else {
					document.getElementById("selectedMovie").innerHTML = output2;
					alert('예매 불가한 관람가입니다.');
				}

			}

		}

		// 해당영화를 상영하는 지점 지역 보여주기
		function showBranchLocation(result) {
			let output = "";
			for ( let i in result) {
				output += "<li><a href=\"javascript:chbLocation('"
						+ result[i].blocation + "');\">";
				output += "<div class='branchDiv' id='l"+result[i].blocation+"'>"
						+ result[i].blocation + "</div></a></li>";
			}

			document.getElementById("brLocation").innerHTML = output;
		}

		// 상영관 지역 바꾸기
		function chbLocation(chBLocation) {
			let lClass = document.getElementsByClassName("branchDiv");
			for (let i = 0; i < lClass.length; i++) {
				lClass[i].style.backgroundColor = "black";
			}
			document.getElementById("l" + chBLocation).style.backgroundColor = "red";
			bLocation = chBLocation;
			console.log(bLocation);
			resetCheckPoint();
			resetlow();
			resetright();
			CMF029();
		}

		function CMF029() {
			$.ajax({
				type : "POST",
				url : "CMF029",
				data : {
					"mCode" : mCode,
					"bLocation" : bLocation
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					showBranch(result);
					if (endchoice != 0 && once == 0) {
						chBranch('${result.TName}');
					}
				},
				error : function() {
					alert("CMF029함수 통신실패!");
				}
			});
		}

		function showBranch(result) {
			let output = "";
			for ( let i in result) {
				output += "<li><a href=\"javascript:chBranch('"
						+ result[i].tname + "');\">";
				output += "<div class='branchDiv2' id='b"+result[i].tname+"'>"
						+ result[i].tname + "</div></a></li>";
			}

			document.getElementById("brName").innerHTML = output;
		}

		function chBranch(chBran) {
			let bClass = document.getElementsByClassName("branchDiv2");
			for (let i = 0; i < bClass.length; i++) {
				bClass[i].style.backgroundColor = "black";
			}
			document.getElementById("b" + chBran).style.backgroundColor = "red";
			
			console.log(bLocation);
			tName = chBran;
			document.getElementById("lowbranch").innerHTML = chBran;
			document.getElementById("sendBranch").value = chBran; 
			resetCheckPoint();
			resetright();
			CMF030();

		}

		function CMF030() {
			$.ajax({
				type : "POST",
				url : "CMF030",
				data : {
					"mCode" : mCode,
					"tName" : tName
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					showDate(result);
					if (endchoice != 0 && once == 0) {
						chDate('${result.BDate}');
					}
				},
				error : function() {
					alert("CMF030함수 통신실패!");
				}
			});
		}

		function showDate(result) {
			let output = "";
			for ( let i in result) {
				output += "<li><a href=\"javascript:chDate('" + result[i].bdate
						+ "');\">";
				output += "<div class='dateDiv' id='d"+result[i].bdate+"'>"
						+ result[i].bdate + "</div></a></li>";
			}

			document.getElementById("selectDate").innerHTML = output;
		}

		function chDate(chdate) {
			let dClass = document.getElementsByClassName("dateDiv");
			for (let i = 0; i < dClass.length; i++) {
				dClass[i].style.backgroundColor = "black";
			}
			document.getElementById("d" + chdate).style.backgroundColor = "red";

			console.log(chdate);
			bDate = chdate;
			document.getElementById("rowdate").innerHTML = chdate;
			document.getElementById("sendDate").value =chdate;
			resetCheckPoint();
			resetthea();
			resetrownum();
			CMF031();
		}

		function CMF031() {
			console.log(mTitle);
			console.log(tName);
			$.ajax({
				type : "POST",
				url : "CMF023",
				data : {
					"branchName" : tName,
					"movieName" : mTitle
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					mlist(result);
				},
				error : function() {
					alert("CMF023함수 통신실패!");
				}
			});
		}

		function mlist(result) {
			let output = "";
			document.getElementById("selectedDate").innerHTML = "";
			for ( let i in result) {
				output = "<p style='text-align: left;'>";
				output += result[i].tnum + "관 | " + result[i].ttype + " | "
						+ result[i].tsize + " 좌석";
				output += "</p>";
				output += "<div style='text-align: left;'>";
				output += "<ul id='tNum"+result[i].tnum+"' style='padding-left: 0px;'>";

				output += "</ul>";
				output += "</div>";
				let output2 = document.createElement('li');
				output2.innerHTML = output;
				takeTime(result[i].tnum);

				tNum = result[i].tnum;
				document.getElementById("selectedDate").appendChild(output2);

			}
		}

		function takeTime(tNum2) {
			$.ajax({
				type : "POST",
				url : "CMF024",
				data : {
					"tName" : tName,
					"bDate" : bDate,
					"mCode" : mCode,
					"tNum" : tNum2
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					mlist3(result, tNum2);
				},
				error : function() {
					alert("CMF024함수 통신실패!");
				}
			});
		}

		function mlist3(result, tNum2) {
			let output = "";
			output += "<ul style='padding-left: 0px;'>";

			for ( let i in result) {
				output += "<li class='li1'>";

				output += "<a href=\"javascript:chThea('" + result[i].bcode
						+ "', '" + tNum2 + "');\">";
				output += "<div id='bCode"+result[i].bcode+"' class='thDiv'>";
				output += result[i].btime;
				output += "<br/>";
				output += result[i].bseat + " 석";

				output += "</div>";
				output += "</a>";
				output += "</li>";
			}

			output += "</ul>";
			document.getElementById("tNum" + tNum2).innerHTML = output;
			if (endchoice != 0 && once == 0 && check952 == 0 ) {
				if(passCode !=0){
					chThea(passCode, '${result.TNum}');
					once = 1;
				}

			}
		}

		function chThea(bCode, tNum2) {
			let dClass = document.getElementsByClassName("thDiv");
			for (let i = 0; i < dClass.length; i++) {
				dClass[i].style.backgroundColor = "black";
			}
			document.getElementById("bCode" + bCode).style.backgroundColor = "red";
			document.getElementById("rownum").innerHTML = tNum2 + "관";
			document.getElementById("sendNum").value = tNum2 + "관";
			console.log('bCode가 바뀌나요?'+bCode);
			document.getElementById("sendbCode").value = bCode;
			
			youcanbook();
		}

		 function youcanbook() {

			document.getElementById("lastCheck").innerHTML = "<a href='javascript:iWantBook();'"
					+ "class='book-a-table-btn scrollto d-none d-lg-flex'>좌석선택</a>";
		} 
		
		  function iWantBook() {
			  makeByFish.submit();
		} 
	</script>
	<script>
		//reset 함수만 모아둔 곳

		// 하단 지점 초기화
		function resetlowbranch() {
			document.getElementById("lowbranch").innerHTML = "";
			resetCheckPoint();
			if(once==1){
				passCode = 0;
			}
		}

		// 하단 날짜 초기화
		function resetrowdate() {
			document.getElementById("rowdate").innerHTML = "";
			resetCheckPoint();
			if(once==1){
				passCode = 0;
			}

		}

		// 하단 상영관 초기화
		function resetrownum() {
			document.getElementById("rownum").innerHTML = "";
			resetCheckPoint();
			if(once==1){
				passCode = 0;
			}
		}

		// 하단 전부 초기화
		function resetlow() {
			resetlowbranch();
			resetrowdate();
			resetrownum();
			resetCheckPoint();
			if(once==1){
				passCode = 0;
			}
		}

		// 날짜랑 상영관 초기화
		function resetright() {
			resetdate();
			resetthea();
			resetCheckPoint();
			if(once==1){
				passCode = 0;
			}
		}

		// 날짜 초기화
		function resetdate() {
			document.getElementById("selectDate").innerHTML = "<li class='li1' style='font-size: 25px;'>영화와 지점을 골라주세요</li>";
			resetCheckPoint();
			if(once==1){
				passCode = 0;
			}
		}

		// 상영관 초기화
		function resetthea() {
			document.getElementById("selectedDate").innerHTML = "<li class='li1' style='font-size: 25px;'>날짜를 골라주세요</li>";
			resetCheckPoint();
			if(once==1){
				passCode = 0;
			}
		}

		// 폼 전송 막기
		function resetCheckPoint() {
			let output = "<a href='javascript:youcannot();'";
			    output += "class='book-a-table-btn scrollto d-none d-lg-flex'>좌석선택</a>";
			 document.getElementById("lastCheck").innerHTML = output;
			checkPoint = 0;
		} 
		
		function youcannot() {
			alert('상영관을 선택해주세요');
		}
		
	</script>
</c:if>
</html>