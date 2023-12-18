<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="name" value="${planVO.pname }" />
<c:set var="planID" value="${communityVO.planID }" />
<c:set var="communityID" value="${communityVO.communityID }" />
<c:set var="thumb1" value="${communityVO.mainImagePreview }" />
<c:set var="file1saved" value="${communityVO.mainImage }" />
<c:set var="title" value="${communityVO.title }" />
<c:set var="content" value="${communityVO.content }" />
<c:set var="cdate" value="${communityVO.cdate }" />
<c:set var="youtube" value="${communityVO.youtube }" />
<c:set var="map" value="${communityVO.map }" />
<c:set var="size1_label" value="${communityVO.size1_label }" />

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
	<aside class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.admin_id != null }">
      <%--
      http://localhost:9093/community/create.do?planID=1
      http://localhost:9093/community/create.do?planID=2
      http://localhost:9093/community/create.do?planID=3
      --%>
      <a href="./create.do?planID=${planID }">등록</a>
      <span class='menu_divide' >│</span>
      <a href="./update_text.do?communityID=${communityID}&now_page=${param.now_page}&word=${param.word }">글 수정</a>
      <span class='menu_divide' >│</span>
      <a href="./update_file.do?communityID=${communityID}&now_page=${param.now_page}">파일 수정</a>  
      <span class='menu_divide' >│</span>
      <a href="./map.do?planID=${planID }&communityID=${communityID}">지도</a>
      <span class='menu_divide' >│</span>
      <a href="./youtube.do?planID=${planID }&communityID=${communityID}">Youtube</a>
      <span class='menu_divide' >│</span>
      <a href="./delete.do?communityID=${communityID}&now_page=${param.now_page}&planID=${planID}">삭제</a>  
      <span class='menu_divide' >│</span>
    </c:if>

    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_by_planID.do?planID=${planID }&now_page=${param.now_page}&word=${param.word }">목록형</a>    
    <span class='menu_divide' >│</span>
    <a href="./list_by_planID_grid.do?planID=${planID }&now_page=${param.now_page}&word=${param.word }">갤러리형</a>
  </aside> 
  
  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">
        <span style="font-size: 1.5em; font-weight: bold;">${title }</span>
          <span style="font-size: 1em;"> ${cdate }</span><br>
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <%-- /static/community/storage/ --%>
              <img src="/community/storage/${file1saved }" style='width: 50%; display:left; margin-top: 0.5%; margin-right: 1%;'> 
            </c:when>
            <c:otherwise> <!-- 기본 이미지 출력 -->
              <img src="/community/images/none1.png" style='width: 50%; float: left; margin-top: 0.5%; margin-right: 1%;'> 
            </c:otherwise>
          </c:choose>
			
          
        </DIV>
        ${content }
      </li>
      
      <c:if test="${youtube.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;">
          <DIV style="text-align: center;">
            ${youtube }
          </DIV>
        </li>
      </c:if>
      
      <c:if test="${map.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;">
          <DIV style='text-align: center; width:640px; height: 360px; margin: 0px auto;'>
            ${map }
          </DIV>
        </li>
      </c:if>

      <li class="li_none">
        <div>
          <c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <a href='/download?dir=/community/storage&filename=${file1saved}&downname=${file1}'>${file1}</a> (${size1_label}) 
            <a href='/download?dir=/community/storage&filename=${file1saved}&downname=${file1}'><img src="/community/images/download.png"></a>
          </c:if>
        </div>
      </li>   
    </ul>
  </fieldset>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>