<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9091/</title>
<link rel="shortcut icon" href="/images/star.png" />
<%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<!-- /static 기준 -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
	<br>
	<br>
	<div class='title_line'>카테고리</div>

	<aside class="aside_right">
		<a href="#">등록</a> <span class='menu_divide'>│</span> <a
			href="javascript:location.reload();">새로고침</a>
	</aside>
	<div class="menu_line">
		<div id='panel_delete'
			style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
			<form name='frm_delete' id='frm_delete' method='post'
				action='./delete.do'>
				<input type="hidden" name="planID" value="${param.planID }">
				<%-- 삭제할 카테고리 번호 --%>
				<c:choose>
					<c:when test="${count_by_planID >= 1 }">
						<%-- 자식 레코드가 있는 상황 --%>
						<div class="msg_warning">
							관련 자료 ${count_by_planID } 건이 발견되었습니다.<br> 관련 자료와 카테고리를 모두
							삭제하시겠습니까?
						</div>

						<label>여행지 이름</label>:  ${planVO.pname } 
          <button type="submit" id='submit' class='btn btn-danger btn-sm' style='height: 28px; margin-bottom: 5px;'>관련 자료와 함께 여행지 삭제</button>

					</c:when>
					<c:otherwise>
						<%-- 자식 레코드가 없는 상황 --%>
						<div class="msg_warning">카테고리를 삭제하면 복구 할 수 없습니다.</div>
						<label>여행지 이름</label>: ${palnVO.pname }
      
          <button type="submit" id='submit'
							class='btn btn-warning btn-sm'
							style='height: 28px; margin-bottom: 5px;'>삭제</button>
					</c:otherwise>
				</c:choose>
				<button type="button" onclick="location.href='/plan/list_all.do'"
					class='btn btn-info btn-sm'
					style='height: 28px; margin-bottom: 5px;'>취소</button>
			</form>
		</div>
	</div>

	<form name='frm' method='post' action='/plan/create.do'>
		<div style="text-align: center;">
			<label>카테고리 이름</label> <input type="text" name="pname" value=""
				required="required" autofocus="autofocus" class=""
				style="width: 50%">
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
				<th class="th_bs">카테고리 이름</th>
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
					<td class="td_bs"><a href="#" style="display: block;">${planVO.pname }</a></td>
					<td class="td_bs">${planVO.planCnt }</td>
					<td class="td_bs">${planVO.pdate.substring(0,10) }</td>
					<td class="td_bs"><a href="./delete.do?planID=${planID }"
						title="삭제">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>


	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</body>
</html>