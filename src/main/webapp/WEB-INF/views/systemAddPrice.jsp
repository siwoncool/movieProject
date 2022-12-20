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

<title>가격정책</title>

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
				<h4 class="mb-3" style="font-family: 'ypseo';">상품추가</h4>
				<form action="SMF016" method="POST" enctype="multipart/form-data">
					<label for="name">상품사진</label><br />

					<div id="imageUpload" class="type02"></div>

					<input type="file" name="pImgFile" class="real-upload"
						accept="image/*" required multiple>
					<ul class="image-preview"
						style="width: 100%; height: 100%; object-fit: cover"></ul>



					<button class="upload" onclick="'imageUpload.remove()'">사진업로드</button>

					<br /> <br />

					<div class="col-mb-3">
						<label for="nickname">상품이름</label> <input type="text"
							class="form-control" placeholder="이름을 입력해주세요" id="pName"
							name="pName" onkeyup="SMF017()" name="pName" required><span
							id="check"></span>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">분류</label> <select name="pType">

							<%-- 			이부분 나중에 가능하면 구현. 리스트는 가져옴 <c:forEach var="list" items="${pTypeList}">
							<option value="${list.PType}">${list.PType}</option>
							</c:forEach> --%>

							<option value="음식">음식</option>
							<option value="예매">예매</option>
							<option value="기념품">기념품</option>
							<option value="기프티카드">기프티카드</option>
							<option value="관람권">관람권</option>
						</select>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">가격</label> <input type="number"
							class="form-control" value="0" name="pPrice" required>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">할인</label> <input type="number"
							class="form-control" value="0" name="pDc" required>
					</div>


					<br />
					<button class="btn btn-primary btn-lg btn-block" type="submit">상품추가</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>


<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>
	function SMF017 () {
		let pName = document.getElementById("pName").value;
		// location.href = "idCheck?memId=" + memId;
		let check = document.getElementById("check");
		
		$.ajax({
			type : "POST",
			url : "SMF017",
			data : {
				"pName" : pName		
			},
			dataType : "text",
			success : function(result){
				if(result=="OK"){
					// 사용할 수 있는 아이디일 경우 실행
					check.innerHTML = "사용가능한 상품이름";
					check.style.color = "#0000ff";
				} else {
					// 사용할 수 없는 아이디일 경우 실행
					check.innerHTML = "사용중인 상품이름";
					check.style.color = "#ff0000";
				}
			},
			error : function(){
				alert("SMF017함수 통신실패!");
			}
		});	
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
</html>