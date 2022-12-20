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


</head>

<body>
	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div style="width: 1200px; margin: 400px; margin-top: 100px;">
		<c:if test="${movieList ne null}">
			<ul style="list-style: none;">

				<c:forEach var="list" items="${movieList}">
					<li id="mainDiv" style="display: inline-block;">
						<ul>
							<li class="li1">
								<div class="input-form-backgroud row"
									style="padding-top: 85px; width: 350px; height: 475px;">
									<div class="input-form col-md-12" style="font-size: 25px; height: 614;">
										<div>${list.uuid}</div>
										<div>${list.btn}</div>
										<div>${list.title}</div>
										<div><a href='CMF004?mCode=${list.code}'><img alt="영화포스터" src="${list.poster}" width="200px;"></a></div>		
										<div>${list.date}</div>
										<div>${list.time}</div>
										<div>${list.seat}</div>
									</div>
								</div>
							</li>
						</ul>
					</li>
				</c:forEach>

			</ul>
			<c:if test="${movieList[0] eq null}">
				<div class="input-form-backgroud row"
					style="padding-top: 85px; margin-left:300px; width: 600px; height: 200;">
					<div class="input-form col-md-12" style="text-align: center;">
						<h1 class='text' style="font-size: 32px;">예매된 티켓이 없습니다.</h1>
					</div>
				</div>
			</c:if>
		</c:if>
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
</html>