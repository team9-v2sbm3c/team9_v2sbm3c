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

    document.querySelector('#gname').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('gemail').focus();
      }
    });
    
    document.querySelector('#gemail').addEventListener('keypress', (event) => {
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
        url: './checkID.do', // spring execute, http://localhost:9091/member/checkID.do?id=user1@gmail.com
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우, 통신 성공: {"cnt":1}
          if (rdata.cnt > 0) { // 아이디 중복
            id_msg.innerHTML= '이미 사용중인 ID입니다. 다른 ID을 지정해주세요.';
            id_msg.classList.add('span_warning');
            id.focus();
            
          } else { // 아이디 중복 안됨.
            id_msg.innerHTML= '사용 가능한 ID 입니다.';
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

  function send() { // 회원 수정 처리
	    let id = document.getElementById('id');
	    let id_msg = document.getElementById('id_msg');

	    if (id.value.trim().length == 0) {
	      id_msg.innerHTML= 'ID가 누락됬습니다. ID 입력은 필수 입니다. ID(이메일)는 3자이상 권장합니다.';
	      id_msg.classList.add('span_warning');    // class 적용
	      id.focus();

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
  <DIV class='title_line'>회원 정보 조회 및 수정(*: 필수)</DIV>

  <DIV class='content_body'>

  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 

  <div class='menu_line'></div>
  
  <div style="width: 60%; margin: 0px auto ">
  <FORM name='frm' id='frm' method='POST' action='./update.do' class="">
    <input type="hidden" name="guestno" value="${guestVO.guestno }">
    
    <div class="form-group"> <%-- 줄이 변경되지 않는 패턴 --%>
      <label>아이디*:
        <input type='text' class="form-control form-control-sm" name='id' id='id' value='${guestVO.id }' required="required" placeholder="아이디*" autofocus="autofocus">
      </label>
      <button type='button' id="btn_checkID" onclick="checkID()" class="btn btn-primary btn-sm">중복확인</button>
      <span id='id_msg'></span>
    </div>   
  
    <div class="form-group"> <%-- label의 크기에따라 input 태그의 크기가 지정되는 형태 --%>
      <label>성명*:
        <input type='text' class="form-control form-control-sm" name='gname' id='gname' value='${guestVO.gname }' required="required" placeholder="성명">
      </label>
      <span id='gname_msg'></span>
    </div>   

    <div class="form-group"> <%-- label의 크기에따라 input 태그의 크기가 지정되는 형태, 줄이 변경되지 않는 패턴 --%>
      <label>이메일:
        <input type='text' class="form-control form-control-sm" name='gemail' id='gemail' value='${guestVO.gemail }' required="required" placeholder="이메일">
      </label>
    </div>   

    <div>

    </div>
    
    <div class="form_input">
      <button type="button" id='btn_send' onclick="send()" class="btn btn-primary btn-sm">저장</button>
      <button type="button" onclick="history.back()" class="btn btn-primary btn-sm">취소</button>
    </div>   
  </FORM>
  </DIV>
  
  </DIV>
  
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>

