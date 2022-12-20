<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 그 이상의 감동</title>
<style>
body {
	padding: 0px;
	margin: 0px;
	background-color: black;
}

.jb-box {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0px auto;
	position: relative;
}

video {
	width: 100%;
}

.jb-text {
	position: absolute;
	top: 50%;
	width: 100%;
}

.jb-text p {
	margin-top: -24px;
	text-align: center;
	font-size: 48px;
	color: #ffffff;
}
</style>


</head>
<body style="text-align: center;">
	<div class="jb-box">
		<video muted autoplay>
			<source src="resources/intro/indexIntro.mp4" type="video/mp4">
			<strong>Your browser does not support the video tag.</strong>
		</video>
		<div class="jb-text">
		</div>
	</div>
</body>
<script>
	setTimeout(function() {
		location.href = 'index';
	}, 8000);
</script>

</html>