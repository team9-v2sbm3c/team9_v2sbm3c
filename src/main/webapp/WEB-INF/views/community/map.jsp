<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>Resort world</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    
</head> 
 
<body>
<c:import url="../menu/top.do" />

  <DIV class='title_line'><A href="/contents/list_by_planID.do?planID=${planVO.planID }" class="title_link">${planVO.pname }</A> > ${communityVO.title } > 지도 등록/수정/삭제</DIV>
 
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>    
    <A href="./list_by_planID.do?planID=${param.planID }&now_page=${param.now_page == null ? 1 : param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_planID_grid.do?planID=${param.planID }&now_page=${param.now_page == null ? 1 : param.now_page}&word=${param.word }">갤러리형</A>

  </ASIDE>
 
  <DIV class='menu_line'></DIV>
  <%--등록/수정/삭제 폼 --%>
  <FORM name='frm_map' method='post' action='./map.do'>
    <input type="hidden" name="communityID" value="${param.communityID }">
    
    <div>
       <label>지도 스크립트</label>
       <textarea name='map' class="form-control" rows="12" style='width: 100%;'>${communityVO.map }</textarea>
    </div>
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">저장</button>
      <button type="button" onclick="frm_map.map.value=''; frm_map.submit();" class="btn btn-secondary btn-sm">지도 삭제</button>
      <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">취소</button>
    </div>
  
  </FORM>

  <HR>
  <DIV style="text-align: center;">
      <H4>[참고] 다음 지도의 등록 방법</H4>
      <IMG src='/community/images/map01.jpg' style='width: 60%;'><br><br>
      <IMG src='/community/images/map02.jpg' style='width: 60%;'><br><br>
      <IMG src='/community/images/map03.jpg' style='width: 60%;'><br><br>
      <IMG src='/community/images/map04.jpg' style='width: 60%;'><br><br>
      <IMG src='/community/images/map05.jpg' style='width: 60%;'><br>
  </DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

 