<%@page import="dev.mvc.plan.PlanVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9093</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="/css/style.css" rel="Stylesheet" type="text/css">

</head>
<body>
	<c:import url="./menu/top.jsp" />
	<c:import url="./menu/first_scene.jsp"/>
	<c:import url="./menu/second_scene.jsp"/>
	<c:import url="./menu/third_scene.jsp"/> 
	<c:import url="./menu/bottom.jsp" />
</body>
</html>