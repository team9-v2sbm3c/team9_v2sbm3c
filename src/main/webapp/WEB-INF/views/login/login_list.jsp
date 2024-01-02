<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
    <title>http://localhost:9093/login/login_list.do</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
    <link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
    <jsp:include page="../menu/top.jsp" flush='false' />

    <table class="table table-hover">
        <colgroup>
            <col style='width: 15%;'/>
            <col style='width: 70%;'/>
            <col style='width: 15%;'/>    
        </colgroup>
        <thead>
            <tr>
                <th class="th_bs">번호</th>
                <th class="th_bs">접속 IP</th>
                <th class="th_bs">접속 시간</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="LoginVO" items="${list}" varStatus="info">
                <c:set var="loginno" value="${LoginVO.loginno}"/>
                <tr>
                    <td class="td_bs">${list.size() - info.index}</td>
                    <td class="td_bs">${LoginVO.ip}</td>
                    <td class="td_bs">${LoginVO.logindate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
