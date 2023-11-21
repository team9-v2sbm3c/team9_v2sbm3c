<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko">
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>Resort world</title>

<script type="text/javascript">
  window.onload = function() {
    document.querySelector('#guestID').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('btn_checkID').focus();
      }
    }); 

    document.querySelector('#gpassword').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('gpasswd2').focus();
      }
    }); 

    document.querySelector('#passwd2').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('gname').focus();
      }
    }); 

    document.querySelector('#gname').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('gemail').focus();
      }
    });
    
  }

  // jQuery ajax 요청
  function checkID() {
    let id = document.getElementById('id');
    let id_msg = document.getElementById('id_msg');

    if (id.value.trim().length == 0) {
      id_msg.innerHTML= 'ID가 누락됬습니다. ID 입력은 필수 입니다. ID(이메일)는 3자이상 권장합니다.';
      id_msg.classList.add('span_warning');    // class 적용
      id.focus();

      return false;  // 회원 가입 진행 중지
      
    } else {  // when ID is entered
      id_msg.classList.remove('span_warning'); // class 삭제

      // let formData = 'id=' + id.value;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      // alert('params: ' + params);
      
      let id = document.getElementById('id');
      let url = './checkID.do?id=' + id.value;
  
      // fetch를 사용하여 데이터를 서버에 GET 요청합니다.
      fetch(url, {
          method: 'GET'
      })
      .then(response => response.json())
      .then(rdata => {
        if (rdata.cnt > 0) { // 아이디 중복
          id_msg.innerHTML= '이미 사용중인 ID 입니다. 다른 ID을 지정해주세요.';
          id_msg.classList.add('span_warning');
          id.focus();
            
        } else { // 아이디 중복 안됨.
          id_msg.innerHTML= '사용 가능한 ID 입니다.';
          id_msg.classList.add('span_info');
          document.getElementById('passwd').focus(); 
          // $.cookie('checkId', 'TRUE'); // Cookie 기록
        }
      })
      .catch(error => { // 서버 다운등 통신 에러
          console.error('Error:', error);
      });      
          
      // 처리중 출력
      id_msg.innerHTML="<img src='/member/images/ani04.gif' style='width: 5%;'>"; // static 기준
      
    }
  }

  function send() { // 회원 가입 처리
    let id = document.getElementById('id');
    let id_msg = document.getElementById('id_msg');

    if (id.value.trim().length == 0) {
      id_msg.innerHTML= 'ID가 누락됬습니다. ID 입력은 필수 입니다. ID(이메일)는 3자이상 권장합니다.';
      id_msg.classList.add('span_warning');    // class 적용
      id.focus();

      return false;  // 회원 가입 진행 중지
      
    }

    // 패스워드를 정상적으로 2번 입력했는지 확인
    let passwd = document.getElementById('passwd');
    let passwd2 = document.getElementById('passwd2');
    let passwd2_msg = document.getElementById('passwd2_msg');

    if (passwd.value != passwd2.value) {
      passwd2_msg.innerHTML= '입력된 패스워드가 일치하지 않습니다.';
      passwd2_msg.classList.add('span_warning');    // class 적용
      passwd.focus();  // 첫번째 패스워드로 focus 설정

      return false;  // 회원 가입 진행 중지
    }

    let gname = document.getElementById('gname');
    let gname_msg = document.getElementById('gname_msg');

    if (gname.value.length == 0) {
      gname_msg.innerHTML= '이름 입력은 필수입니다.';
      gname_msg.classList.add('span_warning');    // class 적용
      gname.focus();

      return false;  // 회원 가입 진행 중지
    }

    document.getElementById('frm').submit(); // required="required" 작동 안됨.
  }  
</script>
</head> 


<body>
<c:import url="/menu/top.do" />

  <DIV class='title_line'>회원 가입(*: 필수)</DIV>

  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
  </ASIDE> 

  <div class='menu_line'></div>
  
  <div style="width: 50%; margin: 0px auto ">
  <form name='frm' id='frm' method='POST' action='./create.do' class="">
  
    <div class="form-group">
      <label>아이디*:</label>
       <div class="input-group">
        <input type='text' class="form-control form-control-sm" name='id' id='id' value='' required="required" placeholder="아이디" autofocus="autofocus">
        <button type='button' id="btn_checkID" onclick="checkID()" class="btn btn-primary btn-sm">중복확인</button>
       </div>
      <span id='id_msg'></span>
    </div>   
                
    <div class="form-group">
      <label>패스워드*:</label>
      <div class="input-group">
        <input type='password' class="form-control form-control-sm" name='passwd' id='passwd' value='' required="required" placeholder="패스워드">
      </div>
    </div>   

    <div class="form-group">
      <label>패스워드 확인*:</label>
      <div class="input-group">
        <input type='password' class="form-control form-control-sm" name='passwd2' id='passwd2' value='' required="required" placeholder="패스워드 확인">
      </div>
      <span id='passwd2_msg'></span>
    </div>   
    
    <div class="form-group">
      <label>성명*:</label>
      <div class="input-group">
        <input type='text' class="form-control form-control-sm" name='gname' id='gname' value='' required="required" placeholder="성명">
      </div>
      <span id='gname_msg'></span>
    </div>   

    <div class="form-group">
      <label>이메일:</label>
      <div class="input-group">
        <input type='text' class="form-control form-control-sm" name='gemail' id='gemail' value='' required="required" placeholder="이메일">
      </div>  
    </div>    

    <div>
        </div>
    
    <div class="bottom_menu">
      <button type="button" id='btn_send' onclick="send()" class="btn btn-primary btn-sm">가입</button>
      <button type="button" onclick="history.back()" class="btn btn-primary btn-sm">취소</button>
    </div>   
  </form>
  </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>