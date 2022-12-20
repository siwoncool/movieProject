<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-cente">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-lg-between"
			style="padding-right: 0px;">

			<h1 class="logo me-auto me-lg-0">
				<a href="index">KPL</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="resources/assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<%@ include file="/WEB-INF/views/include/nav.jsp"%>

			<c:if test="${loginId == null}">
			<ul style="list-style: none;">
				<li class="navright"><a href="MMF001"
					class="book-a-table-btn scrollto d-none d-lg-flex">회원가입</a></li>
				<li class="navright"><a href="MMF006"
					class="book-a-table-btn scrollto d-none d-lg-flex">로그인</a></li>
			</ul>
			</c:if>
			<c:if test="${loginId != null}">
			<a href="MMF008"
					class="book-a-table-btn scrollto d-none d-lg-flex">로그아웃</a>
			</c:if>

		</div>
	</header>
	<!-- End Header -->
</body>
</html>