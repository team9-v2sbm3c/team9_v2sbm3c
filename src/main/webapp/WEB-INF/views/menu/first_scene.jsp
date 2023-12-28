<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

</head>
<body>
	<!-- Carousel -->
	<div id="carouselSldier" class="carousel slide" data-bs-ride="carousel">
		<!-- 슬라이드 내용 -->
		<div class="carousel-inner">
			<div class="carousel-item active c-item">
				<img src="main/images/Seoul.png" alt="서울"
					class="d-block w-100 c-img">
				<div class="carousel-caption">
					<h3>서울</h3>
					<p class='tag'>#20대 #커플 #데이트</p>
					<p> 20대 커플들의 데이트 장소</p>
				</div>
			</div>
			<div class="carousel-item c-item">
				<img src="main/images/Jeju-do.png" alt="제주도"
					class="d-block w-100 c-img">
				<div class="carousel-caption">
					<h3>제주도</h3>
					<p class='tag'>#힐링 #가족</p>
					<p>부모님들과 같이 가기 좋은 장소</p>
				</div>
			</div>
			<div class="carousel-item c-item">
				<img src="main/images/Gyeongsangnam-do.png" alt="부산"
					class="d-block w-100 c-img">
				<div class="carousel-caption">
					<h3>부산</h3>
					<p class='tag'>#우정 #10대</p>
					<p>친구들과 추억쌓기 좋은 장소</p>
				</div>
			</div>
		</div>

		<!-- 좌 / 우 버튼 -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselSldier" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselSldier" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	
</body>
</html>