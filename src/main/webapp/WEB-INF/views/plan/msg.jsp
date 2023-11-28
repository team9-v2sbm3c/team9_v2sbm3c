<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/plan/msg</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
<c:import url="/menu/top.do" />
<%
	String code = (String)request.getAttribute("code");
%>

<div class='title_line'></div>
<div class='message'>
	<fieldset class='fieldset_basic'>
		<ul>
			<%
				if(code.equals("create_success")){
			%>
				<li class='li_none'>
					<span class='span_success'>여행지 등록 성공</span><br>
				</li> 
			<%
				}else if(code.equals("create_fail")){
			%>
				<li class='li_none'>
					<span class='span_fail'>여행지 등록 실패</span><br>
				</li>
			<%
				}
			%>
		</ul>
	</fieldset>
</div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>