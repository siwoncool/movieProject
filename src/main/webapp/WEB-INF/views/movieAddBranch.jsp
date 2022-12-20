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

<title>지점추가</title>

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
				<h4 class="mb-3" style="font-family: 'ypseo';">지점추가</h4>
				<form action="CMF008" method="POST">
					<div class="col-mb-3">
						<label for="nickname">이름</label> <input type="text"
							class="form-control" placeholder="이름을 입력해주세요" id="mName"
							name="bName" required>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">전화번호</label> <input type="text"
							class="form-control" name="bCall" placeholder="연락처를 입력해주세요."
							required>
						<div class="invalid-feedback"></div>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">지역</label> <select name="bLocation">
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
						</select>
					</div>
					<br />
					<div class="col-mb-3">
						<label for="nickname">지점 주소</label> <input type="text"
							class="form-control" name="bAddr1" id="sample6_postcode"
							placeholder="우편번호"> <input class="form-control"
							type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기" /> <input type="text" class="form-control"
							name="bAddr2" size="40" id="sample6_address" placeholder="주소">
						<input type="text" class="form-control" name="bAddr3" size="40"
							id="sample6_detailAddress" placeholder="상세주소">
					</div>
					<br />
					<button class="btn btn-primary btn-lg btn-block" type="submit">지점추가</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

</html>