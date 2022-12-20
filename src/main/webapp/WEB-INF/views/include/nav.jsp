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
	<nav id="navbar" class="navbar order-last order-lg-0">
		<ul>
			<li><a class="nav-link scrollto" href="index">Home</a></li>

			<li class="dropdown"><a href="#"><span>영화</span> <i
					class="bi bi-chevron-down"></i></a>
				<ul>

					<li><a class="nav-link scrollto" href="index #about">무비차트</a></li>
					<li><a class="nav-link scrollto" href="CMF021">KPL 상영시간표</a></li>
					<li><a class="nav-link scrollto" href="CMF005">영화정보</a></li>
				</ul></li>




			<li class="dropdown"><a href="#"><span>카테고리</span> <i
					class="bi bi-chevron-down"></i></a>
				<ul>
					<li class="dropdown"><a href="#"><span>극장</span> <i
							class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="CMF009">KPL 지점</a></li>
							<li><a href="CMF021">KPL 상영시간표</a></li>
						</ul></li>
					<li class="dropdown"><a href="#"><span>스토어</span> <i
							class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="SMF022">매점</a></li>
						</ul></li>

					<li class="dropdown"><a href="#"><span>이벤트</span> <i
							class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="SMF009">오프라인 이벤트</a></li>
						</ul></li>
				</ul></li>
			<li><a class="nav-link scrollto" href="SMF001">고객센터</a></li>
			<li class="dropdown"><a href="#"><span>MY KPL</span> <i
					class="bi bi-chevron-down"></i></a>
				<ul>
					<li class="dropdown"><a href="MMF009?mId=${loginId}"><span>내정보</span>
							<i class="nav-link scrollto"></i></a></li>
					<li class="dropdown"><a href="CMF045?userId=${loginId}"><span>예매정보</span>
							<i class="nav-link scrollto"></i></a></li>
				</ul></li>






			<c:if test="${MODE eq 'admin'}">
				<li class="dropdown"><a href="#"><span>관리자모드</span> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li class="dropdown"><a href="#"><span>회원</span> <i
								class="bi bi-chevron-right"></i></a>
							<ul>
								<li><a href="MMF018">회원목록</a></li>
							</ul></li>

						<li class="dropdown"><a href="#"><span>영화</span> <i
								class="bi bi-chevron-right"></i></a>
							<ul>
								<li><a href="CMF001 ">영화추가</a></li>
								<li><a href="CMF014 ">상영시간생성</a></li>
							</ul></li>
						<li class="dropdown"><a href="#"><span>지점</span> <i
								class="bi bi-chevron-right"></i></a>
							<ul>
								<li><a href="CMF007">지점추가</a></li>
								<li><a href="CMF011">상영관추가</a></li>
							</ul></li>

						<li class="dropdown"><a href="#"><span>가격</span> <i
								class="bi bi-chevron-right"></i></a>
							<ul>
								<li><a href="SMF015">상품등록</a></li>
								<li><a href="SMF018">상품리스트</a></li>
								<li><a href="#">매출</a></li>
							</ul></li>
					</ul></li>
			</c:if>

		</ul>
		<i class="bi bi-list mobile-nav-toggle"></i>
	</nav>
	<!-- .navbar -->

</body>
</html>