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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
/* cdn import */
@import
	url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap')
	;

body {
	background-color: black;
	font-family: 'Roboto', sans-serif;
	font-family: 'Dongle', sans-serif;
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

.tbl_edit01 {
	width: 100%;
	border-top: 1px solid black;
	box-sizing: border-box;
}

.tbl_edit01 tr {
	height: 46px;
	border-bottom: 1px solid black;
	box-sizing: border-box;
}

.tbl_edit01 th {
	background-color: white;
	color: #black;
	font-size: 14px;
	font-weight: bold;
	vertical-align: top;
	line-height: 46px;
}

.tbl_edit01 td {
	height: 46px;
	font-size: 14px;
	box-sizing: border-box;
	padding: 5px;
}
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div
		style="width: 980px; height: 500px; margin: auto; padding: 20px; background-color: white; margin-top: 300px; margin-bottom: 100px; color: black;">

		<table class="tbl_edit01">
			<h2>결제</h2>
			<colgroup>
				<col width="90px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th style="font-size: 18px">결제 금액</th>
					<td style="width: 610px; border-bottom: 1px solid black;"><span
						class="bold txt_blue" style="font-size: 30px;">${sum}</span></td>
				</tr>
				<tr>
					<th
						style="font-size: 20px; border-bottom: 1px solid black; color: #333333;">포인트</th>
					<td
						style="font-size: 30px; border-bottom: 1px solid black; color: #333333;">
						사용가능 포인트 : <span name="left_pnt" style="font-size: 30px">${point}</span>p
						<span style="font-size: 18px"><input type="checkbox"
							id="chk_use" onclick="chkPoint(${sum},${point},5000,100)">포인트
							전체 사용</span>
						<div>
							<span style="float: right; font-size: 15px">포인트는 최소
								5000p부터 100p단위로 사용 가능합니다.</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><br /> <span> <input type="number"
							name="use_pnt" id="use_pnt" min="5000" max="65000"
							onchange="changePoint(${sum},${point},5000,100)" />
					</span> p <span> ( 남은포인트 : </span> <span name="left_pnt" id="left_pnt">${point}</span>p
						)
						<p class="bold txt_red" style="font-size: 30px">
							최종 결제 금액 : <span class="bold txt_red" id="result_pnt">${sum}</span>
							원
						</p></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-dark" onclick="payment()">결제</button>
					</td>
				</tr>
			</tbody>
		</table>


	</div>









	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>



<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>
let lastprice=${sum};
let proname='${pName}';
let savepoint=(lastprice/100);
function chkPoint(amt,pnt,min,unit) {
	//input값을 전체 마일리지로 설정 > minusPoint 
	//amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
	var v_point = 0; //사용할 포인트 (input 입력값)

	if (document.getElementById("chk_use").checked)  
	{
		if (pnt < min)  //최소 사용 단위보다 작을 때
		{
			v_point = 0; 
		}else {
			v_point = pnt - pnt%unit; //사용할 포인트 = 전체 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
		}

		if(pnt > amt ){ //결제금액보다 포인트가 더 클 때
			v_point = amt; //사용할 포인트는 결제금액과 동일하게 설정
		}
		
	}
	document.getElementById("use_pnt").value = v_point; //input 값 설정

	changePoint(amt,pnt,min,unit);
}

function changePoint(amt,pnt,min,unit){
	//input값을 불러옴 > left_pnt 변경 > 최종결제 변경
	//amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
	var v_point = parseInt(document.getElementById("use_pnt").value); //사용할 포인트 (input 입력값)
	if (v_point > pnt) //입력값이 사용가능 포인트보다 클때
	{
		v_point = pnt;
		document.getElementById("use_pnt").value = v_point; //input 값 재설정
	}

	if(v_point > amt ){ //결제금액보다 포인트가 더 클 때
		v_point = amt; //사용할 포인트는 결제금액과 동일하게 설정
		document.getElementById("use_pnt").value = v_point; //input 값 재설정
	}

	if (v_point < min)  //최소 사용 단위보다 작을 때
	{
		v_point = 0; 
		document.getElementById("use_pnt").value = v_point; //input 값 재설정
	}else {
		v_point = v_point - v_point%unit; //사용할 포인트 = 사용할 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
	}

	var v_left = document.getElementsByName("left_pnt"); //사용가능 마일리지, 남은 포인트 값 설정
	for (var i = 0; i < v_left.length; i++) {

		v_left[i].innerHTML = pnt - v_point; //= 전체 포인트 중에 사용할 포인트빼고 남은 포인트

	}
	document.getElementById("result_pnt").innerHTML = amt - v_point; //최종 결제금액 = 결제금액 - 사용할 포인트
	lastprice = amt - v_point;
	savepoint = (lastprice/100)-v_point;
}

function payment(){
	if(lastprice==0){
		if(!alert("결제가 완료됐습니다.")) document.location = 'SMF027?point='+savepoint+'&&userId=${loginId}';
	}else{
	proname +=" 결제";
	 $(function(){
	        var IMP = window.IMP; // 생략가능
	        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	        IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : proname,
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
	                if(!alert("결제가 완료됐습니다.")) document.location = 'SMF027?point='+savepoint+'&&userId=${loginId}';
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	           
	                alert(msg);
	            }
	        });
	        
	    });
	}
}
</script>

</html>