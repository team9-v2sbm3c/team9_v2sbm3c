<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title></title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">

  window.onload = function() {
    document.querySelector('#gname').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('gemail').focus();
      }
    });

    document.querySelector('#email').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('btn_send').focus();
      }
    }); 
  }

  function send() {
    let gname = document.getElementById('gname');
    let gname_msg = document.getElementById('gname_msg');
  
    if (gname.value.length == 0) {
      gname_msg.innerHTML= '이름 입력은 필수입니다.';
      gname_msg.classList.add('span_warning');    // class 적용
      gname.focus();
  
      return false;  // 회원 가입 진행 중지
    }


    let gemail = document.getElementById('gemail');
    let gemail_msg = document.getElementById('gemail_msg');
  
    if (gemail.value.length == 0) {
      gemail_msg.innerHTML= '메일주소 입력은 필수입니다.';
      gemail_msg.classList.add('span_warning');    // class 적용
      gemail.focus();
  
      return false;  // 회원 가입 진행 중지
    }
  
    document.getElementById('frm').submit(); // required="required" 작동 안됨.
  }
    

</script>
</head>
<body>
<c:import url="/menu/top.do" />

 <div class='title_line'>아이디 찾기</div>
  
 <aside class="aside_right">
   <a href="javascript:location.reload();">새로고침</a>
   <span class='menu_divide'>│</span>
   <a href='./create.do'>회원 가입</a>
 </aside>
 <div class='menu_line'></div>

 <div style="width: 60%; margin: 0px auto">
   <form name='frm' id='frm' method='POST' action='./id_find.do' class="">
   
    <div class="form-group" style="margin-bottom: 15px;">
      <label style="margin-right: 15px;">
        성명:
        <input type='text' class="form-control form-control-sm" name='gname' id='gname' value='' required="required"
          placeholder="성명">
      </label>
      <span id='mname_msg'></span>
    </div>
    
    <div class="form-group" style="margin-bottom: 15px;">
      <label style="margin-right: 15px;">
        메일 주소:
        <input type='text' class="form-control form-control-sm" name='gemail' id='gemail' value='' required="required"
          placeholder="메일주소">
      </label>
    </div>
    
    <div class="bottom_menu">
      <button type="button" id='btn_send' onclick="send()" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">아이디 찾기</button>
      <button type="button" onclick="history.back()" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">취소</button>
    </div>
   </form>
 </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>