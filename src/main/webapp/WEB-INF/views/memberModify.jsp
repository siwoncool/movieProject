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

<title>회원 수정</title>

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
</style>
</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container">
		<div class="input-form-backgroud row" style="padding-top: 85px">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" style="font-family: 'ypseo';">회원 수정</h4>
				<form action="MMF011" method="POST" name="joinForm"
					enctype="multipart/form-data">


					<label for="name">프로필사진</label><br />
					<!-- 기존 이미지 불러오기 -->
					<div id="imageUpload" class="type02">
						<img src="resources/profile/${member.MProFileName}" width="200px" />
					</div>

					<input type="hidden" name="mProFileName"
						value="${member.MProFileName}" readonly> <input
						type="file" name="mProFile" class="real-upload" accept="image/*"
						required multiple>
					<ul class="image-preview"
						style="width: 100%; height: 100%; object-fit: cover"></ul>



					<button class="upload" onclick="'imageUpload.remove()'">사진업로드</button>

					<br /> <br />



					<div class="col-mb-3">
						<label for="name">아이디</label> <br /> <input type="text"
							name="mId" value="${member.MId}" readonly> <br /> <span
							id="check1"></span> <br />
					</div>
					<div class="row">
						<div class="col-md-5 mb-3">
							<input type="hidden" name="mPw" value="${member.MPw}" readonly>
							<label for="nickname">비밀번호(입력시 변경)</label> <input type="password"
								class="form-control" name="mcPw" id="memPw" onkeyup="MMF003()"
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
						<label for="nickname">이름</label> <input value="${member.MName}"
							type="text" class="form-control" placeholder="이름을 입력해주세요"
							id="memName" name="mName" required> <br /> <span
							id="pwResult3"></span>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>

					<!-- 이부분만 건들것 -->
					<div class="col-mb-3">
						<label for="nickname">생년월일</label> <input type="text"
							class="form-control" name="mBirth" value="${member.MBirth}"
							placeholder="생년월일을 입력해주세요." readonly required>
						<div class="invalid-feedback"></div>
						<br />

					</div>
					<!-- 여기까지 -->


					<div class="col-mb-3">
						<c:if test="${member.MGender == '남성'}">
							<label for="nickname">성별</label>
							<br /> 남성<input type="radio" name="mGender" value="남성" checked /> 여성<input
								type="radio" name="mGender" value="여성" />
						</c:if>
						<c:if test="${member.MGender == '여성'}">
							<label for="nickname">성별</label>
							<br /> 남성<input type="radio" name="mGender" value="남성" /> 여성<input
								type="radio" name="mGender" value="여성" checked />
						</c:if>



						<div class="invalid-feedback">성별을 선택해주세요.</div>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">이메일</label> <input type="email"
							class="form-control" id="mEmail" name="mEmail" size="40" required
							value="${member.MEmail}" placeholder="이메일을 입력해주세요.">

						<div class="invalid-feedback"></div>
					</div>
					<div class="col-mb-3">
						<label for="nickname">연락처</label> <input value="${member.MPhone}"
							type="text" class="form-control" id="nickname" name="mPhone"
							placeholder="연락처를 입력해주세요." required>
						<div class="invalid-feedback"></div>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">주소</label>
						<c:if test="${member.MAddr1 != 'null'}">
							<input type="text" class="form-control" name="mAddr1"
								id="sample6_postcode" placeholder="우편번호"
								value="${member.MAddr1}">
							<button class="form-control" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기">우편번호 찿기</button>
							<br>
							<input type="text" class="form-control" name="mAddr2" size="40"
								id="sample6_address" placeholder="주소" value="${member.MAddr2}">
							<br>
							<input type="text" class="form-control" name="mAddr3" size="40"
								id="sample6_detailAddress" placeholder="상세주소"
								value="${member.MAddr3}">
						</c:if>

						<c:if test="${member.MAddr1 == 'null'}">
							<input type="text" class="form-control" name="mAddr1"
								id="sample6_postcode" placeholder="우편번호">
							<button class="form-control" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기">우편번호 찿기</button>
							<br>
							<input type="text" class="form-control" name="mAddr2" size="40"
								id="sample6_address" placeholder="주소">
							<br>
							<input type="text" class="form-control" name="mAddr3" size="40"
								id="sample6_detailAddress" placeholder="상세주소">
						</c:if>

					</div>









					<hr class="mb-4">

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" onclick="MMF005()"
						type="submit">수정 완료</button>
				</form>
			</div>
		</div>
		<!-- 풋터 삽입 -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>


</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
	  function getImageFiles(e) {
		const uploadFiles = [];
		const files = e.currentTarget.files;
		const imagePreview = document.querySelector('.image-preview');
		const docFrag = new DocumentFragment();
		 $('div.type02').remove()
		if ([...files].length >= 2) {
		  alert('이미지는 1개만 업로드가 가능합니다.');
		  return;
		}
  
		// 파일 타입 검사
		[...files].forEach(file => {
		  if (!file.type.match("image/.*")) {
			alert('이미지 파일만 업로드가 가능합니다.');
			return
		  }
  
		  // 파일 갯수 검사
		  if ([...files].length == 1) {
			uploadFiles.push(file);
			const reader = new FileReader();
			reader.onload = (e) => {
			  const preview = createElement(e, file);
			  imagePreview.appendChild(preview);
			};
			reader.readAsDataURL(file);
		  }
		});
	  }
  
	  function createElement(e, file) {
		  
		const li = document.createElement('li');
		const img = document.createElement('img');
		img.setAttribute('src', e.target.result);
		img.setAttribute('data-file', file.name);
		li.appendChild(img);
  
		return li;
	  }
  
	  const realUpload = document.querySelector('.real-upload');
	  const upload = document.querySelector('.upload');
  
	  upload.addEventListener('click', () => realUpload.click());
  
	  realUpload.addEventListener('change', getImageFiles);
	</script>
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

	
	if(memPw == "" || memPw == null){
		return true;
	} else if(memPw.length < 8 || memPw.length > 16){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 8자리에서 16자리 이내로 입력해주세요.";
		return false;
	}else if(spc >= 0){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 공백없이 입력해주세요.";
		return false;
	}else if(num < 0 || eng < 0 || spe < 0){
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

function MMF005() {
	if(MMF003() && MMF004()){
		// submit이 되도록
		joinForm.submit();
	}  else {
		alert('비밀번호를 확인하세요.')
	}
		
}



</script>

</html>