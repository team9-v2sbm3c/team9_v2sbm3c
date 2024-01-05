<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9093/</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">


</head>
<body>
    <div class="container mt-3">
        <div class="row">
            <c:forEach var="planVO" items="${third_sc}" varStatus="loop">
                <c:set var="planID" value="${planVO.planID}" />
                <c:set var="name" value="${planVO.pname}" />

                <div class="col-sm-4 mb-3">
                    <a href="/community/list_by_planID.do?planID=${planVO.planID}">
                        <div class="card img-fluid rounded-4">
                            <img class="card-img-top rounded-4" src="main/images/image${Math.floor(Math.random() * 8) + 1}.jpg" alt="Card image" style="width: 100%; filter: brightness(70%);">
                                                        
                            <div class="card-img-overlay">
                                <h4 class="text-white">${name}</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- 매 3번째 반복마다 새로운 row 시작 -->
                <c:if test="${loop.index % 3 == 2}">
                    </div>
                    <div class="row">
                </c:if>
            </c:forEach>
        </div>
    </div>
    <c:import url="./menu/bottom.jsp" />
</body>


</html>