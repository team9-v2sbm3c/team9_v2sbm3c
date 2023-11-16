<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dev.mvc.plan.PlanVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9093/</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">
<!-- /static 기준 -->

</head>
<body>
	<div class=second_scene_container>
		<p class="ssc_title">최근 여행지 </p>
		<div class=image-grid>
			<!-- 최근 3개 이내 이미지가 나오도록 출력 -->
			<c:forEach var="plan" items="${list}" varStatus="loop">
				<c:if test="${loop.index < 3}">
					<a href="?id=${plan.planID}"> <!-- 추후에 관련 사이트로 접속 가능하도록 만드는 코드  -->
					<div>
						<div class="image-container">
							<img class="image-item" src="main/images/maintest.jpg"
								alt="Image 1">
							<div class="image-text">${plan.pname }</div>
						</div>
						<p class="description">${plan.pdescription }</p>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>