<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>Resort world</title>

<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<script type="text/javascript">
  window.onload = function() {
    document.querySelector('#id').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('btn_checkID').focus();
      }
    }); 

    document.querySelector('#passwd').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('passwd2').focus();
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
        document.getElementById('gmail').focus();
      }
    });
    
    document.querySelector('#gmail').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('btn_DaumPostcode').focus();
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

      params = 'id=' + id.value;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      // alert('params: ' + params);
  
      $.ajax({
        url: './checkID.do', // spring execute, http://localhost:9093/guest/checkID.do?id=user1@gmail.com
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우, 통신 성공: {"cnt":1}
          if (rdata.cnt > 0) { // 아이디 중복
            id_msg.innerHTML= '이미 사용중인 ID(이메일) 입니다. 다른 ID(이메일)을 지정해주세요.';
            id_msg.classList.add('span_warning');
            id.focus();
            
          } else { // 아이디 중복 안됨.
            id_msg.innerHTML= '사용 가능한 ID(이메일) 입니다.';
            id_msg.classList.add('span_info');
            document.getElementById('passwd').focus(); 
            // $.cookie('checkId', 'TRUE'); // Cookie 기록
          }
          
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      });
      
      // 처리중 출력
      id_msg.innerHTML="<img src='/guest/images/ani04.gif' style='width: 6%;'>"; // static 기준
      
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
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 

  <div class='menu_line'></div>
  
  <div style="width: 60%; margin: 0px auto ">
  <form name='frm' id='frm' method='POST' action='./create.do' class="">
  
    <div class="form-group">
      <label>아이디*:
        <input type='text' class="form-control form-control-sm" name='id' id='id' value='user1@gmail.com' required="required" placeholder="아이디" autofocus="autofocus">
      </label>
      <button type='button' id="btn_checkID" onclick="checkID()" class="btn btn-primary btn-sm">중복확인</button>
      <span id='id_msg'></span>
    </div>   
                
    <div class="form-group">
      <label>패스워드*: 
        <input type='password' class="form-control form-control-sm" name='passwd' id='passwd' value='' required="required" placeholder="패스워드">
      </label>
    </div>   

    <div class="form-group">
      <label>패스워드 확인*: 
        <input type='password' class="form-control form-control-sm" name='passwd2' id='passwd2' value='' required="required" placeholder="패스워드 확인">
      </label>
      <span id='passwd2_msg'></span>
    </div>   
    
    <div class="form-group">
      <label>성명*:
        <input type='text' class="form-control form-control-sm" name='gname' id='gname' value='' required="required" placeholder="성명">
      </label>
      <span id='gname_msg'></span>
    </div>   

    <div class="form-group">
      <label>이메일:
        <input type='text' class="form-control form-control-sm" name='gemail' id='gemail' value=''  placeholder="이메일">
      </label>
    </div>   

 

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

