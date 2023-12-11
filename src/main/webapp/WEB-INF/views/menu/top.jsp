<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9093/</title>

</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">Logo</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="../guest/login.do">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="../owner/login.do">관리자</a></li>
					<li class="nav-item"><a class="nav-link" href="../plan/list_all.do">여행지 테스트</a></li>				
					<li class="nav-item"><a class="nav-link" href="../recommend/list_all.do">추천지 테스트</a></li>				
				</ul>
				<form class="d-flex"> <!-- 추후 검색 기능으로 업그레이드 예정 -->
					<input class="form-control me-2" type="text" placeholder="여행지 검색">
					<button class="btn btn-dark" type="button">search</button>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>