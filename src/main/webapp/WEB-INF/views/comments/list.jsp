<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'>Resort 3.0 영화와 여행이있는 리조트</DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >힐링 리조트</A><span class='top_menu_sep'> </span>
      
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
           ${sessionScope.id } <A class='menu_link'  href='/guest/logout.do' >Logout</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/guest/login.do' >Login</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>    
      
      <A class='menu_link'  href='/plangrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/plan/list_all.do'>카테고리 전체 목록</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/plan/list_all_join.do'>카테고리 전체 목록 Join</A><span class='top_menu_sep'> </span>
      
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
          <!--  로그인한 회원만 가능 -->
          <A class='menu_link'  href='/cart/list_by_guestno.do'>쇼핑카트</A><span class='top_menu_sep'> </span>
          <A class='menu_link'  href='/order_pay/list_by_guestno.do'>주문결재</A><span class='top_menu_sep'> </span>         </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/guest/create.do'>회원가입</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>    

      <c:choose>
        <c:when test="${sessionScope.grade < 10}"> <%-- 로그인 한 경우 --%>
          <!--  로그인한 관리자만 가능 -->
          <A class='menu_link'  href='/guest/list.do'>회원목록</A><span class='top_menu_sep'> </span>
          <!-- <A class='menu_link'  href='/reply/list.do'>댓글 목록</A><span class='top_menu_sep'> </span> -->
          <A class='menu_link'  href='/reply/list_join.do'>댓글 목록</A><span class='top_menu_sep'> </span>
        </c:when>            
        <c:otherwise>
        
        </c:otherwise>
      </c:choose>    
       
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>