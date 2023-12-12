<%@ page contentType="text/html; charset=UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>http://localhost:9093/</title>
</head>
<body>
  <nav class="navbar navbar-expand-sm navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/">Logo</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mynavbar">
        <ul class="navbar-nav me-auto">
          <li class="nav-item dropdown">
            <a class="nav-link top_menu_link dropdown-bs-toggle" data-bs-toggle="dropdown" href="#">회원</a>
            <div class="dropdown-menu">
              <c:choose>
                <c:when test="${sessionScope.id == null }">
                  <a class="dropdown-item" href="/guest/create.do">회원 가입</a>
                  <a class="dropdown-item" href="javascript: alert('개발 예정')">아이디 찾기</a>
                  <a class="dropdown-item" href="javascript: alert('개발 예정')">비밀번호 찾기</a>
                </c:when>
                <c:otherwise>
                  <a class="dropdown-item" href="/guest/read.do">가입 정보</a>
                  <a class="dropdown-item" href="/guest/passwd_update.do">비밀번호 변경</a>
                  <a class="dropdown-item" href="/guest/read.do">회원 정보 수정</a>
                  <a class="dropdown-item" href="javascript: alert('개발 예정')">로그인 내역</a>
                  <a class="dropdown-item" href="#">회원 탈퇴</a>
                </c:otherwise>
              </c:choose>
            </div>
          </li>
          <li class="nav-item">
            <c:choose>
              <c:when test="${sessionScope.id == null}">
                <a class="nav-link top_menu_link" href="/guest/login.do">로그인</a>
              </c:when>
              <c:otherwise>
                <a class="nav-link top_menu_link" href='/guest/logout.do'>${sessionScope.id } 로그아웃</a>
              </c:otherwise>
            </c:choose>
          </li>
          <c:choose>
            <c:when test="${sessionScope.owner_id == null }">
              <li class="nav-item">
                <a class="nav-link top_menu_link" href="/owner/login.do">관리자 로그인</a>
              </li>
            </c:when>
            <c:otherwise>
              <li class="nav-item dropdown">
                <a class="nav-link top_menu_link dropdown-toggle" data-bs-toggle="dropdown" href="#">관리자</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href='/guest/list.do'>회원 목록</a>
                  <a class="dropdown-item" href='/owner/logout.do'>관리자 ${sessionScope.owner_id } 로그아웃</a>
                </div>
              </li>
            </c:otherwise>
          </c:choose>
          <li class="nav-item"><a class="nav-link" href="../community/list_all.do">게시판</a></li>
          <li class="nav-item"><a class="nav-link" href="../recommend/list_all.do">추천지 테스트</a></li>
        </ul>
        <form class="d-flex"> <!-- 추후 검색 기능으로 업그레이드 예정 -->
          <input class="form-control me-2" type="text" placeholder="여행지 검색">
          <button class="btn btn-dark" type="button">search</button>
        </form>
      </div>
    </div>
  </nav>
</body>
</html>
