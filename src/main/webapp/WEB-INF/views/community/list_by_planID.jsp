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
<c:import url="/menu/top.do" />

  <div class='title_line'>
    ${planVO.pname }
    <c:if test="${param.word.length() > 0 }">
      > 「${param.word }」 검색 ${search_count } 건
    </c:if> 
  </div>
  
  <aside class="aside_right">
    <%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.admin_id != null }">
      <a href="./create.do?planID=${planVO.planID }">등록</a>
      <span class='menu_divide' >│</span>
    </c:if>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_by_planID.do?planID=${param.planID }&now_page=${param.now_page == null ? 1 : param.now_page }">목록형</a>    
    <span class='menu_divide' >│</span>
    <a href="./list_by_planID_grid.do?planID=${param.planID }&now_page=${param.now_page == null ? 1 : param.now_page }">갤러리형</a>
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
          <c:set var="thumb1" value="${communityVO.thumb1 }" />
    
          <tr onclick="location.href='./read.do?communityID=${communityID}&now_page=${param.now_page == null ? 1 : param.now_page }&planID=${param.planID }'" style="cursor: pointer;">
            <td>
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
                  <%-- registry.addResourceHandler("/community/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir()); --%>
                  <img src="/community/storage/${thumb1 }" style="width: 120px; height: 90px;">
                </c:when>
                <c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 출력: /static/community/images/none1.png -->
                  <img src="/community/images/none1.png" style="width: 120px; height: 90px;">
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
              (${communityVO.rdate.substring(0, 16) })
            </td>
            <td class="td_bs">
              <a href="/community/map.do?planID=${planID }&communityID=${communityID}&now_page=${param.now_page}" title="지도 설정"><img src="/community/images/map.png" class="icon"></a>
              <a href="/community/youtube.do?planID=${planID }&communityID=${communityID}&now_page=${param.now_page}" title="Youtube 설정"><img src="/community/images/youtube.png" class="icon"></a>
              <a href="/community/delete.do?planID=${planID }&communityID=${communityID}&now_page=${param.now_page}" title="삭제"><img src="/community/images/delete.png" class="icon"></a>
            </td>
          </tr>
        </c:forEach>
    </tbody>
      
  </table>
  
  <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
