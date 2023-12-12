<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>

<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
<c:import url="../menu/top.jsp" />
	<div class='title_line'>${planVO.pname }> 글 등록</div>
	<form name='frm' method='post' action='./create.do' enctype="multipart/form-data">
		<input type="hidden" name="planID" value="${param.planID }">

		<div>
			<label>제목</label> <input type='text' name='title' value='올 겨울 시원하게 날려버리자~' required="required" autofocus="autofocus" class="form-control" style='width: 100%;'>
		</div>
		<div>
			<label>내용</label>
			<textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>시원한 일상을 날려버리고 싶다 </textarea>
		</div>
		<div>
			<label>검색어</label> <input type='text' name='word' value='스포츠 , 스키 , 눈 ' required="required" class="form-control" style='width: 100%;'>
		</div>
		<div>
			<label>이미지</label> <input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택">
		</div>
		<div>
			<label>패스워드</label> <input type='password' name='passwd' value='1234'
				required="required" class="form-control" style='width: 50%;'>
		</div>
		<div class="content_body_bottom">
			<button type="submit" class="btn btn-secondary btn-sm">등록</button>
			<button type="button"
				onclick="location.href='./list_by_planID_search_paging.do?planID=${param.planID}'"
				class="btn btn-secondary btn-sm">목록</button>
		</div>

	</form>

	<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>