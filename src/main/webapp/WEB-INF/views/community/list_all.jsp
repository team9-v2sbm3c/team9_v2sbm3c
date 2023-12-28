<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/community/list_all.do</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
<c:import url="../menu/top.jsp" />

  <div class='title_line'>전체 글 목록</div>
  
  <aside class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.admin_id != null }">
      <a href="./create.do?planID=${planVO.planID }">등록</a>
      <span class='menu_divide' >│</span>
    </c:if>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_by_planID.do?planID=${param.planID }&now_page=${param.now_page}">목록형</a>    
    <span class='menu_divide' >│</span>
    <a href="./list_by_planID_grid.do?planID=${param.planID }&now_page=${param.now_page}">갤러리형</a>    
  </aside>
  <div class="menu_line"></div> 
  
  <table class="table table-hover">
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 80%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    <thead>
      <tr>
        <th style='text-align: center;'>파일</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    </thead>
    <tbody>
        <c:forEach var="communityVO" items="${list }" varStatus="info">
          <c:set var="communityID" value="${communityVO.communityID }" />
          <c:set var="cimage" value="${communityVO.cimage }" />
    
          <tr onclick="location.href='./read.do?communityID=${communityID}'" style="cursor: pointer;">
            <td>
              <c:choose>
                <c:when test="${cimage.endsWith('jpg') || cimage.endsWith('png') || cimage.endsWith('gif')}"> <%-- 이미지인지 검사 --%>    
                  <img src="/community/storage/${cimage }" style="width: 120px; height: 90px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 출력: /static/community/images/none1.png -->
                  <img src="/community/images/test.png" style="width: 120px; height: 90px;">
                </c:otherwise>
              </c:choose>
            </td>
            <td class="td_bs_left">
              <span style="font-weight: bold;">${communityVO.title }</span><br>
              <c:choose>
                <c:when test="${communityVO.content.length() > 160 }">
                  ${communityVO.content.substring(0, 160) }...
                </c:when>
                <c:otherwise>
                  ${communityVO.content }
                </c:otherwise>
              </c:choose>
              (${communityVO.cdate.substring(0, 16) })
            </td>
            <td class="td_bs">
              <a href="/community/map.do?planID=${param.planID }&communityID=${communityID}&now_page=${param.now_page}" title="지도 설정"><img src="/community/images/map.png" class="icon"></a>
              <a href="/community/youtube.do?planID=${param.planID }&communityID=${communityID}&now_page=${param.now_page}" title="Youtube 설정"><img src="/community/images/youtube.png" class="icon"></a>
              <a href="/community/delete.do?planID=${param.planID }&communityID=${communityID}&now_page=1" title="삭제"><img src="/community/images/delete.png" class="icon"></a>
            </td>
          </tr>
        </c:forEach>
    </tbody>
      
  </table>
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
