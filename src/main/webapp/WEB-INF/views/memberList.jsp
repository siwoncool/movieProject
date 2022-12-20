<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>영화 그 이상의 감동. MY KPL</title>
<meta content="" name="description">
<meta content="" name="keywords">

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

<!-- =======================================================
  * Template Name: Restaurantly - v3.9.1
  * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->



</head>

<body>


	<!-- 헤더 삽입 -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- ======= Hero Section ======= -->

	<section id="hero" class="d-flex align-items-center">
		<div data-aos="zoom-in" data-aos-delay="100"
			style="width: 100%; height: 60%; padding-right: 15%; padding-left: 15%;">
			<div>
				<h3 class="text">회원목록 페이지</h3>
			</div>
			<br />
			<div style="float: left; width: 100%">
				<table style="width: 100%">
					<tr>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 성별</th>
						<th>회원 이메일</th>
					</tr>
					<c:forEach var="list" items="${memberList}">
						<tr>
							<td><a href="MMF009?mId=${list.MId}">${list.MId}</a></td>
							<td>${list.MName}</td>
							<td>${list.MGender}</td>
							<td>${list.MEmail}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" class="limitr"><select
							onchange="changeLimit(this.value)">
								<option value="5">회원목록 갯수</option>
								<option value="5">5개씩</option>
								<option value="10">10개씩</option>
								<option value="20">20개씩</option>
						</select></td>
					</tr>

					<tr>
						<td colspan="5" class="trcenter">
							<!-- 페이징 처리 --> <!-- [처음]페이지에 대한 처리 --> <c:if
								test="${paging.page <= 1}">
								<c:out value="<< 처음" />
							</c:if> <c:if test="${paging.page > 1}">
								<a href="MMF018?page=1&limit=${paging.limit}"><c:out
										value="<< 처음" /></a>
							</c:if> <!-- [이전]페이지에 대한 처리 --> <c:if test="${paging.page <= 1}">
								<c:out value="< 이전" />
							</c:if> <c:if test="${paging.page > 1}">
								<a href="MMF018?page=${paging.page-1}&limit=${paging.limit}"><c:out
										value="< 이전" /></a>
							</c:if> <!-- [페이지번호]페이지에 대한 처리 --> <c:forEach var="i"
								begin="${paging.startPage}" end="${paging.endPage}">

								<c:choose>

									<c:when test="${paging.page == i}">
										<span class="space1">[${i}]</span>
									</c:when>

									<c:otherwise>
										<span class="space1"><a
											href="MMF018?page=${i}&limit=${paging.limit}">${i}</a></span>
									</c:otherwise>

								</c:choose>

							</c:forEach> <!-- [다음]페이지에 대한 처리 --> <c:if
								test="${paging.page >= paging.maxPage}">
								<c:out value="다음 >" />
							</c:if> <c:if test="${paging.page < paging.maxPage}">
								<a href="MMF018?page=${paging.page+1}&limit=${paging.limit}"><c:out
										value="다음 >" /></a>

							</c:if> <!-- [마지막]페이지에 대한 처리 --> <c:if
								test="${paging.page >= paging.maxPage}">
								<c:out value="마지막 >>" />
							</c:if> <c:if test="${paging.page < paging.maxPage}">
								<a href="MMF018?page=${paging.maxPage}&limit=${paging.limit}"><c:out
										value="마지막 >>" /></a>

							</c:if>

						</td>
					</tr>
					<tr>
						<td colspan="4">
							<!-- 검색기능 -->
							<form action="MMF020" method="GET">

								<!-- 카테고리 -->
								<select name="category">
									<option value="mNAME">이름</option>
									<option value="mID">아이디</option>
									<option value="mEMAIL">이메일</option>
								</select>

								<!-- 검색어 -->
								<input type="text" name="keyword">
								<!-- 검색버튼 -->
								<input type="submit" value="검색">
							</form>
						</td>

					</tr>


				</table>


			</div>



		</div>
	</section>
	<!-- End Hero -->

	<!-- 풋터 삽입 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="resources/assets/vendor/aos/aos.js"></script>
	<script
		src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/assets/js/main.js"></script>

</body>
<script>
	function changeLimit(limit) {
		location.href = "MMF018?limit=" + limit;
	}
</script>

</html>