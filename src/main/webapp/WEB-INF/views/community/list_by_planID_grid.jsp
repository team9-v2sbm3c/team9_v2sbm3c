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
    
  </div>
  
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
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="communityVO" items="${list }" varStatus="status">
      <c:set var="title" value="${communityVO.title }" />
      <c:set var="content" value="${communityVO.content }" />
      <c:set var="planID" value="${communityVO.planID }" />
      <c:set var="communityID" value="${communityVO.communityID }" />
      <c:set var="thumb1" value="${communityVO.thumb1 }" />
      <c:set var="size1" value="${communityVO.size1 }" />
        
      <!-- 4기준 하나의 이미지, 24 * 4 = 96% -->
      <!-- 5기준 하나의 이미지, 19.2 * 5 = 96% -->
      <div onclick="location.href='./read.do?communityID=${communityID}&now_page=${param.now_page == null ? 1 : param.now_page }&planID=${param.planID }'" 
             style='width: 19%; height: 200px; float: left; margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: left; cursor: pointer;'>
        
        <c:choose> 
          <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
            <%-- registry.addResourceHandler("/community/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir()); --%>
            <img src="/community/storage/${thumb1 }" style="width: 100%; height: 120px;">
          </c:when>
          <c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 출력: /static/community/images/none1.png -->
            <IMG src="/community/images/none1.png" style="width: 100%; height: 120px;">
          </c:otherwise>
        </c:choose>
        ${title }
        
      </div>
      
      <%-- 하나의 행에 이미지를 5개씩 출력후 행 변경, index는 0부터 시작 --%>
      <c:if test="${status.count % 5 == 0}"> 
        <HR class='menu_line'> <%-- 줄바꿈 --%>
      </c:if>
      
    </c:forEach>
  </div>
  
  <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
