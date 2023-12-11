<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
	<br>
	<br>
	<div class='title_line'>여행지 카테고리</div>

	<aside class="aside_right">
		<a href="#">등록</a> <span class='menu_divide'>│</span> <a href="javascript:location.reload();">새로고침</a>
	</aside>
	<div class="menu_line"></div>

	<form name='frm' method='post' action='/plan/create.do'>
		<div style="text-align: center;">
			<label>여행지 이름</label> 
			<input type="text" name="pname" value="" required="required" autofocus="autofocus" class=""style="width: 50%">
			<button type="submit" class="btn btn-secondary btn-sm"
				style="height: 28px; margin-bottom: 5px;">등록</button>
			<button type="button" onclick="location.href='./list_all.do'"
				class="btn btn-secondary btn-sm"
				style="height: 28px; margin-bottom: 5px;">목록</button>
		</div>
	</form>

	<table class="table table-hover">
		<colgroup>
			<col style='width: 10%;' />
			<col style='width: 40%;' />
			<col style='width: 10%;' />
			<col style='width: 20%;' />
			<col style='width: 20%;' />
		</colgroup>
		<thead>
			<tr>
				<th class="th_bs">순서</th>
				<th class="th_bs">여행지 이름</th>
				<th class="th_bs">자료수</th>
				<th class="th_bs">등록일</th>
				<th class="th_bs">기타</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="planVO" items="${list }" varStatus="info">
				<c:set var="planID" value="${planVO.planID }" />

				<tr>
					<td class="td_bs">${planVO.planID }</td>
					<td class="td_bs">${planVO.pname }</a></td>
					<td class="td_bs">${planVO.planCnt }</td>
					<td class="td_bs">${planVO.pdate.substring(0,10) }</td>
					<td class="td_bs">
						<a href="./update.do?planID=${planID }" title="수정">수정</a>
						<a href="./delete.do?planID=${planID }" title="삭제">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>


	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>