<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

</head> 
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>관리자 로그인</DIV>

  <DIV style='width: 40%; margin: 0px auto;'>
    <FORM name='frm' method='POST' action='./login.do'>
    
      <div class="form_input" style="margin-left: 15%;">
        <label>아이디:</label> 
        <input type='text' class="form-control" name='id' id='id' required="required" 
                  style='width: 80%;' placeholder="아이디" autofocus="autofocus" value="admin1">
      </div>   
   
      <div class="form_input" style="margin-left: 15%;">
        <label>패스워드:</label> 
        <input type='password' class="form-control" name='passwd' id='passwd' 
                  required="required" style='width: 80%;' placeholder="패스워드" value="1234">
      </div>   
   
      <div class="form_input_bottom">
        <button type="submit" class="btn btn-secondary">로그인</button>
        <button type="button" onclick="history.back();" class="btn btn-secondary">취소</button>
      </div>
      
    </FORM>
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

