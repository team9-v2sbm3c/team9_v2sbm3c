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
	<div class='title_line'>유저 관심사</div>

	<aside class="aside_right">
		<span class='menu_divide'>│</span> <a href="javascript:location.reload();">새로고침</a>
	</aside>
	<div class="menu_line"></div>

	<table class="table table-hover">
		<colgroup>
			<col style='width: 40%;' />
			<col style='width: 10%;' />
			<col style='width: 20%;' />
			<col style='width: 10% ' />
		</colgroup>
		<thead>
			<tr>
				<th class="th_bs">유저명</th>
				<th class="th_bs">관심사 활동코드</th>
				<th class="th_bs">업데이트 날짜</th>
				<th class="th_bs">기타</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recommendVO" items="${list}" varStatus="info">
				<c:set var="guestno" value="${recommendVO.guestno }" />
    <tr>
        <td class="td_bs">${recommendVO.gname}</td>
        	
        <td class="td_bs">
            <c:choose>
                <c:when test="${recommendVO.activecodeno eq 0}">문화체험</c:when>
                <c:when test="${recommendVO.activecodeno eq 1}">자연감상</c:when>
                <c:when test="${recommendVO.activecodeno eq 2}">활동과 스포츠</c:when>
                <c:when test="${recommendVO.activecodeno eq 3}">역사 탐방</c:when>
                <c:when test="${recommendVO.activecodeno eq 4}">쇼핑</c:when>
                <c:when test="${recommendVO.activecodeno eq 5}">맛집 탐방</c:when>
                <c:when test="${recommendVO.activecodeno eq 6}">휴양과 휴식</c:when>
                <c:otherwise>알 수 없음</c:otherwise>
            </c:choose>
        </td>
        <td class="td_bs">${recommendVO.rdate.substring(0, 10)}</td>
        <td class="td_bs">
        	<a href="./delete.do?guestno=${guestno }" title="삭제">삭제</a>
        </td>
    </tr>
</c:forEach>
		</tbody>

	</table>


	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>