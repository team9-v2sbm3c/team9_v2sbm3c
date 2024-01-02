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
	<div class="container mt-5">
		<h2>댓글</h2>
		<c:choose>
			<c:when
				test="${sessionScope.id != null or sessionScope.owner_id != null}">
				<!-- 로그인한 경우에만 댓글 폼을 표시 -->
				<form id="commentForm">
					<div class="form-group">
						<!-- 댓글 입력 폼 -->
						<textarea class="form-control" id="content" name="content"
							rows="3" placeholder="댓글을 입력하세요"></textarea>
					</div>
					<!-- 수정: onclick 시 createComment 함수에 필요한 인자 전달 -->
					<button id="commentButton" type="button" class="btn btn-primary">댓글
						작성</button>
				</form>
			</c:when>
			<c:otherwise>
				<!-- 로그인하지 않은 경우에는 댓글 입력 폼을 표시하지 않음 -->
				<div class="form-group">
					<!-- 댓글 입력 폼 (readonly 속성 추가) -->
					<textarea class="form-control" id="content" name="content" rows="3"
						placeholder="로그인을 해야 댓글을 쓸 수 있습니다." readonly></textarea>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 댓글 목록 표시 영역 -->
		<div id="commentsList" class="list-group mt-3"></div>
	</div>

	<script>
        // 댓글 생성 함수
        function createComment(event) {
	    var content = $("#content").val();
	    var commentGuestno;
	
	    // 세션에 owner_id가 있다면 owner로 판단
	    if ("${sessionScope.owner_id}" == "owner") {
	        commentGuestno = 1;
	    } else {
	        // 세션에 guestno가 있다면 guest로 판단
	        commentGuestno = "${sessionScope.guestno}";
	    }	
	    
	
	    $.ajax({
	        type: "POST",
	        url: "/comments/create.do",
	        data: {
	            comments: content,
	            communityID: ${communityVO.communityID},
	            planID: ${communityVO.planID},
	            guestno: commentGuestno
	        },
	        success: function (response) {
	            var result = JSON.parse(response);
	            if (result.cnt === 1) {
	                // 댓글 생성 성공 시
	                loadCommentsByCommunityID(${communityVO.communityID});
	                alert("댓글이 등록되었습니다.");
	            } else {
	                // 댓글 생성 실패 시
	                console.error("댓글 생성 실패");
	            }
	        },
	        error: function () {
	            // 댓글 생성 실패 시
	            console.error("댓글 생성 실패 2");
	        }
	    });
	}


        // 댓글 목록 불러오기 함수
        function loadCommentsByCommunityID(communityID) {
            
            $.ajax({
                type: "GET",
                url: "/comments/list_by_communityID_join.do",
                data: {
                    communityID: ${communityVO.communityID}
                },
                success: function (response) {
                    var result = JSON.parse(response);
                    //console.log("댓글 불러오기 성공");
                    //console.log(result);
                    // 댓글 목록을 result.list로 받아서 처리
                    displayComments(result.list);
                },
                error: function () {
                    //console.error("댓글 목록 불러오기 실패");
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

				    // 댓글 내용, 작성자 번호, 작성 날짜를 list-group-item으로 추가
				    var commentDiv = document.createElement("div");
				    commentDiv.classList.add("list-group-item");
				
				    var contentParagraph = document.createElement("p");
				    contentParagraph.classList.add("mb-1");
				    contentParagraph.innerHTML = comment.comments;
				
				    var authorDiv = document.createElement("div"); // 작성자를 담을 div 요소
				    authorDiv.classList.add("author-info");
				
				    var authorParagraph = document.createElement("small");
				    authorParagraph.classList.add("text-muted");
				    authorParagraph.innerHTML = "작성자: " + comment.gname;
				    
				    authorDiv.appendChild(authorParagraph); // 작성자 정보를 div에 추가
				
				    var dateDiv = document.createElement("div"); // 작성 날짜를 담을 div 요소
				    dateDiv.classList.add("date-info");
				
				    var dateParagraph = document.createElement("small");
				    dateParagraph.classList.add("text-muted");
				    dateParagraph.innerHTML = "(" + comment.comments_date + ")";
				    
				    dateDiv.appendChild(dateParagraph); // 작성 날짜 정보를 div에 추가
				
				    // 각각의 작성자 정보와 작성 날짜 정보를 commentDiv에 추가
				    commentDiv.appendChild(contentParagraph);
				    commentDiv.appendChild(authorDiv);
				    commentDiv.appendChild(dateDiv);
				    
				 // 현재 세션의 로그인한 사용자 ID와 댓글 작성자 ID 비교
				    if ("${sessionScope.guestno}" == comment.guestno || "${sessionScope.owner_id}" == "owner") {
				        var deleteButton = document.createElement("button");
				        deleteButton.classList.add("btn", "btn-danger");
				        deleteButton.innerHTML = "댓글 삭제";

				        // 삭제 버튼 스타일 설정
				        deleteButton.style.marginLeft = "auto"; // auto 마진을 주어 오른쪽 정렬
				        deleteButton.style.display = "block"; // 버튼을 블록 요소로 변경
				        deleteButton.style.width = "fit-content"; // 내용에 맞게 너비 조절

				        // 삭제 버튼에 클릭 이벤트 추가
				        deleteButton.onclick = function () {
				            deleteComment(comment.commentsID);
				        };

				        commentDiv.appendChild(deleteButton);
				    }

				    commentsListDiv.appendChild(commentDiv);
                }
            }
        }

     	// 댓글 삭제 함수
        function deleteComment(commentsID) {
        	alert("삭제할 번호:" + commentsID);
            // AJAX 호출
            $.ajax({
                type: "POST",
                url: "/comments/delete.do",
                data: {
                    commentsID: commentsID
                },
                success: function (response) {
                    var result = JSON.parse(response);
                    if (result.cnt === 1) {
                        // 댓글 삭제 성공 시
                        loadCommentsByCommunityID(${communityVO.communityID});
                        console.log("댓글 삭제 성공 :" + commentsID )
                    } else {
                        // 댓글 삭제 실패 시
                        console.error("댓글 삭제 실패");
                    }
                },
                error: function () {
                    // 댓글 삭제 실패 시
                    console.error("댓글 삭제 실패");
                }
            });
        }

        // 초기 페이지 로드 시 댓글 목록 불러오기
        $(document).ready(function () {
            var communityID = ${communityVO.communityID};
            loadCommentsByCommunityID(communityID);
        });

        // 댓글 작성 버튼에 대한 클릭 이벤트 처리
        document.getElementById('commentButton').addEventListener('click', createComment);
    </script>
</body>

</html>