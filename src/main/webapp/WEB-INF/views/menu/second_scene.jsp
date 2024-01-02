<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dev.mvc.plan.PlanVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9093/</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="/css/style.css" rel="Stylesheet" type="text/css">


</head>
<body>
	<div class="button-container">
		<span class="btn-message">새로운 여행, 새로운 기억. 세상을 탐험하며 쌓아가는 순간들</span>
		<span class="btn-message">여행지를 추천받아보세요. 🌍</span>
		 <a href="http://3.36.154.83:8000/recommend_system/recommend_form?guestno=1" class="btn btn-primary recommend">추천받기</a>
	</div>

</body>
</html>