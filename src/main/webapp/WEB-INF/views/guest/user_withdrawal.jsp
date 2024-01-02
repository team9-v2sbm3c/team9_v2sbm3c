<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>Resort world</title>
 
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->


<script type="text/javascript">
  window.onload = () => {
    document.getElementById('btn_send').addEventListener('click', send);
  }
  
  function send() {
    // 현재 password 검사
    let current_passwd = document.getElementById('current_passwd');
    let current_passwd_msg = document.getElementById('current_passwd_msg');
    current_passwd_msg.classList.remove('span_warning');  // 스타일 제거
    current_passwd_msg.innerHTML =""; // 기존에 진행되는 애니메이션 삭제

    let url = './passwd_check.do?current_passwd=' + current_passwd.value;

    // fetch를 사용하여 데이터를 서버에 GET 요청합니다.
    fetch(url, {
        method: 'GET'
    })
    .then(response => response.json())
    .then(rdata => {
      if (rdata.cnt == 0) { // 패스워드 검사, 불일치
        current_passwd_msg.innerHTML= '패스워드가 일치하지 않습니다. 패스워드를 다시 입력해주세요.';
        current_passwd_msg.classList.add('span_warning');
        current_passwd.focus();

        return false;
          
      } else { // 패스워드 일치

        document.getElementById('frm').submit();
      }
    })
    .catch(error => { // 서버 다운등 통신 에러
        console.error('Error:', error);
    });  
  }
  
</script>

</head> 
 
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>
    회원 탈퇴
  </DIV>

  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 
  
  <div class='menu_line'></div>
  
  <div style='width: 60%; margin: 0px auto;'>  
  <form name='frm' id='frm' method='POST' action='./user_withdrawal.do'>

    <div class="form-floating mb-1 mt-3">
      <input type="password" class="form-control" id="current_passwd" name="current_passwd" placeholder="현재 패스워드" autofocus="autofocus">
      <label for="current_passwd">패스워드</label>
    </div>
    <div id='current_passwd_msg' style="width: 100%; text-align: center;"></div>
  
    <div class="bottom_menu">
      <button type="button" id='btn_send' class="input_button_form input_submit btn-sm">탈퇴</button>
      <button type="button" onclick="history.back()" class="input_button_form input_submit btn-sm">취소</button>
    </div>   

  </FORM>
  </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>