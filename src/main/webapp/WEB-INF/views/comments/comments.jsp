<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9091/</title>
<link rel="shortcut icon" href="/images/star.png" />
<%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<!-- /static 기준 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	
	<!-- 댓글 입력 폼 -->
<div class="container mt-5">
    <h2>댓글</h2>
    <form id="commentForm">
        <div class="form-group">
    <label for="content">댓글 내용:</label>
    <textarea class="form-control" id="content" name="content" rows="3" placeholder="댓글을 입력하세요"></textarea>
</div>
        <!-- 수정: onclick 시 createComment 함수에 필요한 인자 전달 -->
        <button id="commentButton" type="button" class="btn btn-primary">댓글 작성</button>
    </form>

    <!-- 댓글 목록 표시 영역 -->
    <div id="commentsList" class="list-group mt-3"></div>
</div>

	<script>
	// 댓글 생성 함수
	document.getElementById("commentButton").addEventListener("click", createComment);

    function createComment(event) {
        //console.log("createComment 함수가 호출되었습니다.");
        var content = $("#content").val();
        
        console.log(content);
        //console.log(${communityVO.communityID});
        //console.log(${communityVO.planID});

        // 수정: AJAX 호출 시 필요한 데이터 전달
        $.ajax({
            type: "POST",
            url: "/comments/create.do",
            data: {
            	comments: content,
                communityID:${communityVO.communityID},
                planID: ${communityVO.planID},
                guestno: 1
            },
            success: function (response) {
                var result = JSON.parse(response);
                if (result.cnt === 1) {
                	//console.log("댓글 생성 성공");
                	loadCommentsByCommunityID(${communityVO.communityID}); 
                } else {
                	//console.error("댓글 생성 실패");
                }
            },
            error: function () {
                console.error("댓글 생성 실패");
            }
        });
    }
	

	// 댓글 목록 불러오기 함수
	function loadCommentsByCommunityID(communityID) {
	    // AJAX 호출
	    $.ajax({
	        type: "GET",
	        url: "/comments/list_by_communityID.do",
	        data: {
	            communityID: ${communityVO.communityID}
	        },
	        success: function (response) {
	            var result = JSON.parse(response);
	            console.log("댓글 불러오기 성공");
	            console.log(result);
	            // 댓글 목록을 result.list로 받아서 처리
	            // 예: 화면에 댓글 목록 표시
	            displayComments(result.list);
	        },
	        error: function () {
	            console.error("댓글 목록 불러오기 실패");
	        }
	    });
	}

	// 댓글 목록을 화면에 표시하는 함수
	function displayComments(commentsList) {
    var commentsListDiv = document.getElementById("commentsList");
    commentsListDiv.innerHTML = ""; // 기존 내용 초기화

    if (commentsList.length === 0) {
        // 댓글이 없는 경우 메시지 추가
    	commentsListDiv.innerHTML = '<p class="list-group-item">댓글이 없습니다.</p>';
    } else {
    	// 댓글이 있는 경우 각각의 댓글을 화면에 추가
        for (var i = 0; i < commentsList.length; i++) {
            var comment = commentsList[i];

            // 댓글 내용과 작성자 번호를 list-group-item으로 추가
            var commentDiv = document.createElement("div");
            commentDiv.classList.add("list-group-item");

            var contentParagraph = document.createElement("p");
            contentParagraph.classList.add("mb-1");
            contentParagraph.innerHTML = comment.comments;

            var authorParagraph = document.createElement("small");
            authorParagraph.classList.add("text-muted");
            authorParagraph.innerHTML = "작성자 번호: " + comment.guestno;

            commentDiv.appendChild(contentParagraph);
            commentDiv.appendChild(authorParagraph);

            commentsListDiv.appendChild(commentDiv);
        }
    }
}



	// 초기 페이지 로드 시 댓글 목록 불러오기
	$(document).ready(function () {
	    var communityID = ${communityVO.communityID}; 
	    loadCommentsByCommunityID(communityID);
	});

	</script>
</body>
</html>