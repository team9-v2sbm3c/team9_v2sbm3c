<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title></title>
<link rel="shortcut icon" href="/images/star.png" />
<%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<!-- /static 기준 -->
</head>

<body>
  <c:import url="/menu/top.do" />

  <div class='title_line'>회원 탈퇴</div>

  <aside class="aside_right">
    <a href="javascript:location.reload();">새로고침</a>
  </aside>

  <div class='menu_line'></div>

  <div class='message'>
    <form name='frm' method='post' action='./user_withdrawal.do'>
      '${gname }(${id })' 회원을 탈퇴하면 복구 할 수 없습니다. <br> 정말로 탈퇴하시겠습니까?<br> <br>
      <input type='hidden' name='guestno' value='${guestVO.guestno}'>

      <button type="submit" class="btn btn-outline-warning btn-sm">탈퇴하기</button>
      <button type="button" onclick="location.href='../index.do'" class="btn btn-outline-warning btn-sm">취소</button>

    </form>
  </div>

  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>