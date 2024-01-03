<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dev.mvc.plan.PlanVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9093/</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script>src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"</script>

<link href="/css/style.css" rel="Stylesheet" type="text/css">


</head>
<body>
	<div class="button-container">
    <span class="btn-message">새로운 여행, 새로운 기억. 세상을 탐험하며 쌓아가는 순간들</span>
    <span class="btn-message">여행지를 추천받아보세요. 🌍</span>
    <button id="recommendButton" type="button" class="btn btn-primary recommend" data-bs-toggle="modal" data-bs-target="#myModal" data-bs-dismiss="modal">추천받기</button>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
			<!-- Modal Header -->
      		<div class="modal-header">
        		<h4 class="modal-title">로그인 알림</h4>
        		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      		</div>
            <!-- Modal body -->
            <div class="modal-body">
                <p>.</p>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
    	var isLoggedIn;
    	// 로그인 여부 상태 확인 
        if("${sessionScope.guestno}" == ""){
        	isLoggedIn = false;
        }else {
			isLoggedIn = true;
        }
        var recommendButton = document.getElementById('recommendButton');

        if (isLoggedIn) {
            // 로그인 상태인 경우 버튼 클릭 시 추천 사이트로 이동
            recommendButton.addEventListener('click', function () {
            	window.location.href = 'http://localhost:8000/recommend_system/recommend_form/?guestno=${guestno}'
            });
        } else {
            // 비로그인 상태인 경우 버튼 클릭 시 모달에 로그인 안내 출력
            recommendButton.addEventListener('click', function () {
                // 모달 내용 변경 및 close 버튼 기능 확보를 위한 변수들 
            	var myModal = new bootstrap.Modal(document.getElementById('myModal'));
                var modalBody = document.querySelector('#myModal .modal-body');

                // 모달 내용 변경
                modalBody.innerHTML = '<p>로그인이 필요합니다. 로그인 후 추천을 받아보세요.</p>';
                myModal.show();
            });
        }
    });
</script>


</body>
</html>