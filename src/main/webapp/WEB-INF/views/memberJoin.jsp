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

<title>회원가입</title>

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
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container">
		<div class="input-form-backgroud row" style="padding-top: 85px">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" style="font-family: 'ypseo';">회원가입</h4>
				<form action="MMF005" method="POST" name="joinForm"
					enctype="multipart/form-data">
					<div class="col-mb-3">
						<label for="name">아이디</label> <input type="text"
							class="form-control" placeholder="아이디를 입력해주세요." id="memId"
							placeholder="" name="mId" onkeyup="MMF002()" required> <br />
						<span id="check1"></span>
					</div>
					<div class="row">
						<div class="col-md-5 mb-3">
							<label for="nickname">비밀번호</label> <input type="password"
								class="form-control" name="mPw" id="memPw" onkeyup="MMF003()"
								placeholder="영문, 숫자, 특수문자 혼합" required> <br /> <span
								id="pwResult1"></span>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-5 mb-3">
							<label for="password">비밀번호 확인</label> <input type="password"
								class="form-control" id="checkPw" onkeyup="MMF004()" required>
							<br /> <span id="pwResult2"></span>
							<div class="invalid-feedback">비밀번호 확인</div>
						</div>
					</div>
					<div class="col-mb-3">
						<label for="nickname">이름</label> <input type="text"
							class="form-control" placeholder="이름을 입력해주세요" id="mName"
							name="mName" required> <br /> <span id="pwResult3"></span>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<div class="col-mb-3">
						<label for="nickname">생년월일</label> <input type="date"
							class="form-control" name="mBirth" placeholder="생년월일을 입력해주세요."
							required>
						<div class="invalid-feedback"></div>
						<br />

					</div>
					<div class="col-mb-3">
						<label for="nickname">성별</label> <br /> 남성<input type="radio"
							name="mGender" value="남성" checked /> 여성<input type="radio"
							name="mGender" value="여성" />
						<div class="invalid-feedback">성별을 선택해주세요.</div>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">연락처</label> <input type="text"
							class="form-control" id="mPhone" name="mPhone"
							placeholder="연락처를 입력해주세요." required>
						<div class="invalid-feedback"></div>
					</div>








					<div class="row"></div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" onclick="MMF005()"
						type="submit">가입 완료</button>
				</form>
			</div>
		</div>
		<!-- 풋터 삽입 -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>


</body>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>

function MMF003(){
	let memPw = document.getElementById("memPw").value;
	let pwResult1 = document.getElementById("pwResult1");
	
	let num = memPw.search(/[0-9]/);
	let eng = memPw.search(/[a-z]/);
	let spe = memPw.search(/[`~!@#$%^&*|\\\'\":;\/?]/);
	let spc = memPw.search(/\s/);
	
	console.log("num : " + num + " , eng : " + eng + " , spe : " + spe);

	
	if(memPw.length < 8 || memPw.length > 16){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 8자리에서 16자리 이내로 입력해주세요.";
		return false;
		
	} else if(spc >= 0){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 공백없이 입력해주세요.";
		return false;
	
	} else if(num < 0 || eng < 0 || spe < 0){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요.";
		return false;
	
	} else {
		pwResult1.style.color = "#0000ff";
		pwResult1.innerHTML = "사용가능한 비밀번호 입니다.";
		return true;
	}
	

}

function MMF004(){
	
	let memPw = document.getElementById("memPw").value;
	let checkPw = document.getElementById("checkPw").value;
	let pwResult2 = document.getElementById("pwResult2");
	
	if(memPw == checkPw){
		pwResult2.style.color = "#0000ff";
		pwResult2.innerHTML = "비밀번호가 일치합니다.";
		return true;
	} else {
		pwResult2.style.color = "#ff0000";
		pwResult2.innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	}
	
	
}

function joinformcheck(){
	var mPhone = document.getElementById("mPhone");
	var mName = document.getElementById("mName");
	var mBirth = document.getElementById("mBirth");
	
	if(mPhone.value ==""){
		alert("전화번호를 입력하세요");
		mPhone.focus();
		return false;
	}
	if(mName.value ==""){
		alert("이름을 입력하세요");
		mName.focus();
		return false;
	}
	if(mBirth.value ==""){
		alert("생년월일을 입력하세요");
		mBirth.focus();
		return false;
	}
	return true;
}

function MMF005() {
	
	if(MMF002() && MMF003() && MMF004() && joinformcheck()){
		// submit이 되도록
		joinForm.submit();
	} else if(! MMF002()) {
		alert('아이디 중복체크를 실행해주세요.');
	} else if (!MMF003 && MMF004){
		alert('비밀번호를 확인하세요.')
	}
		
}

function MMF002() {
	let memId = document.getElementById("memId").value;
	// location.href = "idCheck?memId=" + memId;
	let check1 = document.getElementById("check1");
	let conf = false;
	
	$.ajax({
		type : "POST",
		url : "MMF002",
		data : {
			"memId" : memId		
		},
		async : false,
		dataType : "text",
		success : function(result){
			if(result=="OK"){
				// 사용할 수 있는 아이디일 경우 실행
				check1.innerHTML = "사용가능한 아이디";
				check1.style.color = "#0000ff";
				conf = true;
			} else {
				// 사용할 수 없는 아이디일 경우 실행
				check1.innerHTML = "사용중인 아이디";
				check1.style.color = "#ff0000";
			}
		},
		error : function(){
			alert("MMF002함수 통신실패!");
		}
	});	
	return conf;
}
</script>

</html>