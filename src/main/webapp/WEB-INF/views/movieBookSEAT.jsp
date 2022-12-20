<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

.people {
	width: 30px;
	border: 2px solid black;
	margin: 5px;
	font-size: 15px;
	background-color: black;
	color: white;
}
</style>
<style>
.seat {
	width: 50px;
	height: 30px;
	background-color: black;
	color: white;
	border-color: gray;
}

.clicked {
	background-color: red;
}

.formbtnDiv {
	width: 200px;
	border: 2px solid black;
	margin: 10px;
	margin-left: 30px;
	margin-top: 0px;
	padding-top: 0px;
	font-size: 15px;
	background-color: black;
	color: white;
	margin-left: 20px;
	font-size: 15px;
}

td {
	width: 50px;
}
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div style="width: 1980px; margin: 100px;">
		<ul style="list-style: none;">
			<li id="mainDiv" style="display: inline-block;">
				<div class="input-form-backgroud row"
					style="padding-top: 85px; padding-left: 30px;">
					<div class="input-form col-md-12 mx-auto">
						<h1 class="text" style="text-align: center;">상영관 정보</h1>
						<div style="height: 400px; width: 300px;">
							<div>
								<br />
								<p style="text-align: center;">${passDTO.branch}|
									${passDTO.num} | 남은좌석 ${movietime.BSeat} / ${theater.TSize}</p>
								<p style="text-align: center; font-size: 20px;">${movietime.BTime}</p>
							</div>
							----------------------------------------------
							<div>
								<br />
								<h1 class="text" style="text-align: center;">인원</h1>
								<br />
								<ul style="margin-left: 30px;">

									<li class="li1"><a href="javascript:chpo(1);"><div
												class="people" id="po1">1</div></a></li>
									<li class="li1"><a href="javascript:chpo(2);"><div
												class="people" id="po2">2</div></a></li>
									<li class="li1"><a href="javascript:chpo(3);"><div
												class="people" id="po3">3</div></a></li>
									<li class="li1" style="margin-right: 60px;"><a
										href="javascript:chpo(4);"><div class="people" id="po4">4</div></a></li>
									<li class="li1"><a href="javascript:chpo(5);"><div
												class="people" id="po5">5</div></a></li>
									<li class="li1"><a href="javascript:chpo(6);"><div
												class="people" id="po6">6</div></a></li>
									<li class="li1"><a href="javascript:chpo(7);"><div
												class="people" id="po7">7</div></a></li>
									<li class="li1"><a href="javascript:chpo(8);"><div
												class="people" id="po8">8</div></a></li>
								</ul>

							</div>
						</div>

					</div>
				</div>
			</li>
			<li id="mainDiv2"
				style="display: inline-block; vertical-align: bottom;">
				<div class="input-form-backgroud row" style="margin-left: 15px;">
					<div class="input-form col-md-12 mx-auto" style="width: 1200px;">
						<div style="height: 420px; width: 1200px; color: black;">
							<div style="padding-left: 35%;">
								<hr
									style="background: black; height: 1px; border: 0; width: 50%" />
								<h1 class="text" style="padding-left: 175px; font-size: 20px;">Screen</h1>
								<hr
									style="background: black; height: 1px; border: 0; width: 50%" />
							</div>
							<div style="padding-left: 10px;">
								<div class="seat-wrapper" id="seatArea"
									style="font-size: 11px; text-align: center;"></div>
							</div>
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
							<li class='li1' style='vertical-align: top;'><img alt=''
								src='${passDTO.poster}' width='150px'></li>
							<li class='li1' style='margin-left: 10px;'>
								<div style='width: 230px; overflow: auto;'>
									${passDTO.title}</div> ${passDTO.genre} <br /> ${passDTO.age} <br />
								${passDTO.runTime} <br />
							</li>
						</ul>
					</li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1"
						style="vertical-align: top; width: 200px; text-align: left;">
						&nbsp;&nbsp;&nbsp;&nbsp;지점: <span>${passDTO.branch}</span><br />
						&nbsp;&nbsp;&nbsp;&nbsp;일시: <span>${passDTO.date}</span><br />&nbsp;&nbsp;&nbsp;&nbsp;상영관:
						<span>${passDTO.num}</span>
					</li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1" id="showSeat" style="vertical-align: top;"><div
							style='font-size: 40px; margin: 15px;'>&nbsp; ➤ &nbsp;좌석선택
							&nbsp;</div></li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1" id="showPrice"
						style="font-size: 40px; margin: 15px; vertical-align: top;">&nbsp;
						➤ &nbsp;결제 &nbsp;</li>
					<li class="li1" style="vertical-align: top;">
						<div
							style="padding-top: 100px; margin-left: 10px; margin-right: 10px; border-left: 2px solid black; height: 200px;"></div>
					</li>
					<li class="li1" style="vertical-align: top;">
						<form action="CMF033" method="post" name="makeByFish">
							<input type="hidden" id="sendPoster" name="Poster" /> <input
								type="hidden" id="sendTitle" name="Title" /> <input
								type="hidden" id="sendGenre" name="Genre" /> <input
								type="hidden" id="sendAge" name="Age" /> <input type="hidden"
								id="sendRunTime" name="RunTime" /> <input type="hidden"
								id="sendBranch" name="Branch" /> <input type="hidden"
								id="sendDate" name="Date" /> <input type="hidden" id="sendNum"
								name="Num" /> <input type="hidden" value="0" id="sendbCode"
								name="bCode" />
							<div id="nextbtn" class="formbtnDiv">
								<a href="javascript:next();"
									class="book-a-table-btn scrollto d-none d-lg-flex"
									style="margin-right: 50px; margin-left: 35px;">결제진행</a>
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
		let setpo = 0;
		let selectpo = false;
		let countpo = 0;
		let overseat = false;
		let output="";
		let price=0;
		let lastprice=0;
		let checkarry = new Array();
		let uuid = "";
		makeuuid();
		
		function makeuuid() {
			$.ajax({
				type : "POST",
				url : "CMF051",
				data : {
					"connect" : 'OK'
				},
				dataType : "text",
				success : function(result) {
					uuid=result;
					console.log(uuid);
				},
				error : function() {
					alert("CMF038함수 통신실패!");
				}
			});

		}
		
			
		let waitajax = 0;
		
		let endPayPrice=0;
		let endPayPoint=0;
		let endGetPoint=0;
		console.log(${price});
		
		
		
		$.ajax({
			type : "POST",
			url : "CMF038",
			data : {
				"bCode" : '${passDTO.BCode}'
			},
			dataType : "json",
			success : function(result) {
				checkarry = result;
				console.log(checkarry);
				s_result('${theater.TLineEnd}',${theater.TRowEnd});
			},
			error : function() {
				alert("CMF038함수 통신실패!");
			}
		});
		
		
		function chpo(po) {
			if(countpo>po){
				alert('선택한 좌석이 예매 인원보다 많습니다.');
			}else{
				setpo = po;
				selectpo = true;
				console.log(setpo);
				let pClass = document.getElementsByClassName("people");
				for (let i = 0; i < pClass.length; i++) {
					pClass[i].style.backgroundColor = "black";
				}
				document.getElementById("po" + po).style.backgroundColor = "red";
				output ="";
				output +="<div style='width:255px; font-size: 25px;'>";
				output +="결제금액 <br/>";
				output += ${price}+" x "+ po;
				output += "<br/>";
				output += "<span id = 'resultpay'>";
				output += ${price}*po;
				output += "</span>"+"원";
				output += "</div>";
				endPayPrice = ${price}*po;
				document.getElementById("showPrice").innerHTML = output;
			}
			

		}
		
		
		
		
		function s_result(line, row) {
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

			seatPlan(line2,row);
		}
		

		let selectedSeats = new Array();
		let selectedSeatsMap = [];
		
		function seatPlan(line, row) {
			let seatArea = document.getElementById("seatArea")
			seatArea.innerHTML="";
			let test = [];

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
					
					
					for (let w = 0; w < checkarry.length; w++) {
						if(checkarry[w]==input.value){
							input.value ="X";
						}
					}
					
					div.append(input);
					
					console.log(input.value);
					
					
					if(input.value!="X"){
					input.addEventListener('click', function (e) {
						console.log(e.target.value);
						//중복방지 함수
						selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);
						
						if(selectpo){
						//click class가 존재할때(제거해주는 toggle)
						if (input.classList.contains("clicked")) {
							if(countpo>0){
								input.classList.remove("clicked");
								clicked = document.querySelectorAll(".clicked");
								selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
								clicked.forEach((data) => {
									selectedSeats.push(data.value);
								});
								countpo -=1;
								if(countpo==0){
									overseat = true;
								}else{
								overseat=false;
								}
							}

							//click class가 존재하지 않을때 (추가해주는 toggle)
						} else {
							if(countpo<setpo){
								input.classList.add("clicked");
								clicked = document.querySelectorAll(".clicked");
								clicked.forEach((data) => {
									selectedSeats.push(data.value);
								})
							 countpo +=1;
								overseat= false;
							}else{
								alert('인원수를 확인해 주세요');
								overseat = true;
							}

						}
						}else{
							alert('인원수를 정해주세요');
							overseat = true;
						}
						if(!overseat){
							console.log(selectedSeats);
							output="";
							output +="<div style='width:255px; font-size: 25px;'><span>좌석번호 : </span>";
							for (let i = 0; i < selectedSeats.length; i++) {
								output +=selectedSeats[i];
								if(selectedSeats.length-i>1){
									output+=", ";
								}
								
							}
							output +="</div>";
							
							document.getElementById("showSeat").innerHTML = output;
						}else{
							if(countpo==0){
								document.getElementById("showSeat").innerHTML = "<div style='font-size: 40px; margin: 15px;'>&nbsp;➤ &nbsp;좌석선택 &nbsp;</div>";
							}
							
						}
						
					})}
					else{
						input.addEventListener('click', function (e) {
							alert('이미 예약된 좌석입니다.')
						})
					}
				}
			}
		}
		
		
		async function fetchHtmlAsText(url) {
			// 기본경로 추가해주기
			let path = "WEB-INF/views/include/"
			url = path+url;
			
		    return await (await fetch(url)).text();
		}

		async function importPage(target) {
			document.getElementById("mainDiv").innerHTML = await fetchHtmlAsText(target + '.jsp');
		}

		
		function next() {
			if(setpo>0 && setpo==countpo){
 				output ="";
				output +="<div class='input-form-backgroud row'";
				output +="style='padding-top: 85px; padding-left: 30px; width:1600px; height: 350px;'>";
				output +="<div class='input-form col-md-12 mx-auto'>";
				output +="<table style='background-color:black; width:100%; height:100%; color:white; font-size:30px; padding-right:500px;'>";
				output +="<tr style='width: 150px;'>";
				output +="<td>";
				output +="사용가능한 KPL포인트 : ";
				output +="</td>";
				output +="<td>"+'${point}'+"원";
				output +="</td>";
				output +="</tr>";
				output +="<tr style='width: 20px;'>";
				output +="<td>";
				output +="사용할 포인트 :";
				output +="</td>";
				output +="<td>";
				output +="<input type='number' id='mypoint' min='0' max='${point}' value='0' onchange='chPoint()' />";
				output +="</td>";
				output +="</tr>";				
				output +="<tr>";
				output +="<td>";
				output +="적립예정 금액 :";
				output +="</td>";
				output +="<td id='chpoint'>";
				output += (('${price}'*setpo)/100) +"원";
				endGetPoint=(('${price}'*setpo)/100);
				output +="</td>";
				output +="</tr>";
				output +="</table>";
				output +="</div>";
				output +="</div>"; 
				//importPage('pay'); 
				
				
				
				document.getElementById("mainDiv").innerHTML = output;
				document.getElementById("mainDiv2").innerHTML ="";
				output="";
				output+="<a href='javascript:checkajax();'";
				output+="class='book-a-table-btn scrollto d-none d-lg-flex'";
				output+="style='margin-right: 50px; margin-left: 35px;'>결제진행</a>";
				
				document.getElementById("nextbtn").innerHTML =output;
				lastprice = setpo*${price};
			}else if(setpo == 0){
				alert('인원수를 골라주세요');
			}else{
				alert('인원수와 좌석수가 맞지 않습니다.');
			}
		}
		
		
		
		function chPoint() {
			let spendpoint = document.getElementById("mypoint").value;
			let price = setpo*${price};
			let price2= Number(price);
			price2 = price2 - spendpoint;
			document.getElementById("resultpay").innerHTML =price2;
			lastprice = price2;
			endPayPrice = price2;
			
			price2 = price2/100;
			document.getElementById("chpoint").innerHTML =price2+"원";
			
			endPayPoint = spendpoint;
			endGetPoint =price2;
		}
		
		// gopay하기전에 좌석이 예매된 자리인가 확인
		function checkajax() {
			//alert('좌석확인');
			let bCode ='${passDTO.BCode}';
			
			$.ajax({
				type : "POST",
				url : "CMF038",
				data : {
					"bCode" : bCode
				},
				dataType : "json",
				success : function(result) {
						console.log(result);
						arraycheck(result);
				},
				error : function() {
					alert("CMF038함수 통신실패!");
				}
			});
		}
		
		
		function arraycheck(result) {
			let ercount = 0;
			
			for (var i = 0; i < result.length; i++) {
				for (var j = 0; j < selectedSeats.length; j++) {
					if(selectedSeats[j]==result[i]){
						ercount =1;
					}
				}
			}
			if(ercount==0){
				
				for (var m = 0; m < selectedSeats.length; m++) {
					insertseat(selectedSeats[m]);
				}
				gopay();
			}else{
				alert('선택한 좌석이 이미 예매 되었습니다.');
				window.location.reload();
			}
		}
		
		function insertseat(bSeat) {
			let bCode ='${passDTO.BCode}';
			let bId = '${loginId}';
			console.log('비코드:',bCode,' 유저아이디:',bId,' 좌석:',bSeat,' 유유아디:',uuid);
			$.ajax({
				type : "POST",
				url : "CMF039",
				data : {
					"bCode" : bCode,
					"bSeat" : bSeat,
					"bId"	: bId,
					"bUUID" : uuid
				},
				dataType : "text",
				success : function(result) {
						console.log(result);
				},
				error : function() {
					alert("CMF039함수 통신실패!");
				}
			});
		}
		
		
		function gopay() {
			alert('QR코드를 찍고 결제페이지가 넘어갈때까지 결제를 대기해주세요');
			 $(function(){
	    	        var IMP = window.IMP; // 생략가능
	    	        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    	        var msg;
	    	        
	    	        IMP.request_pay({
	    	            pg : 'kakaopay',
	    	            pay_method : 'card',
	    	            merchant_uid : 'merchant_' + new Date().getTime(),
	    	            name : 'KPL 영화티켓',
	    	            amount : lastprice,
	    	            buyer_email : '이메일',
	    	            buyer_name : '',
	    	            buyer_tel : '전화번호',
	    	            buyer_addr : '집주소',
	    	            buyer_postcode : '123-456',
	    	            //m_redirect_url : 'http://www.naver.com'
	    	        }, function(rsp) {
	    	            if ( rsp.success ) {
	    	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	                jQuery.ajax({
	    	                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    	                    type: 'POST',
	    	                    dataType: 'json',
	    	                    data: {
	    	                        imp_uid : rsp.imp_uid
	    	                        //기타 필요한 데이터가 있으면 추가 전달
	    	                    }
	    	                }).done(function(data) {
	    	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    	                    if ( everythings_fine ) {
	    	                        msg = '결제가 완료되었습니다.';
	    	                        msg += '\n고유ID : ' + rsp.imp_uid;
	    	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	    	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	    	                        
	    	                        alert(msg);
	    	                    } else {
	    	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	    	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    	                    }
	    	                });
	    	                //성공시 이동할 페이지
	    	                <%-- location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
	    	                endAll();
							
	    	            } else {
	    	                msg = '결제에 실패하였습니다.';
	    	                msg += '에러내용 : ' + rsp.error_msg;
	    	                //실패시 이동할 페이지
	    	                cancel(msg);
	    	            }
	    	        });
	    	        
	    	    });
		}
		
		function endAll() {
			let ajprice = endPayPrice;
			let ajpoint = (endGetPoint - endPayPoint);
			let endUserId = '${loginId}';

			$.ajax({
				type : "POST",
				url : "CMF043",
				data : {
					"point" : ajpoint,
					"userId" : endUserId,
					"price"	 : endPayPrice
				},
				dataType : "text",
				success : function(result) {
					if(!alert("결제가 완료됐습니다.")) document.location = 'index';
				},
				error : function() {
					if(!alert("결제가 완료됐습니다.")) document.location = 'index';
				}
			});
			
		}
		
		
		function cancel(msg) {
			$.ajax({
				type : "POST",
				url : "CMF040",
				data : {
					"bUUID" : uuid
				},
				dataType : "text",
				success : function(result) {
					alert(msg);
					setTimeout(function() {
						window.location.reload();
					}, 2000);
				},
				error : function() {
					alert("CMF040함수 통신실패!");
					alert('결제오류로인하여 해당 예매는 죄송한 마음으로 서비스입니다^^');
					setTimeout(function() {
						window.location.reload();
					}, 2000);
					
				}
			});
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
</c:if>
</html>