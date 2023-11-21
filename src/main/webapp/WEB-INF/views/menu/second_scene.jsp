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
		<p class='title'>추천 여행지</p>
		<div class="container">
			<c:forEach var="plan" items="${list}" varStatus="loop">
				<c:if test="${loop.index < 3}">
					<div class="item">
						<div class="card">
							<a href="${plan.planID}">
								<div class="image-container">
									<img src="main/images/maintest.png" alt="Card Image">
									<div class="overlay">
										<p class="description">${plan.pname}</p>
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>