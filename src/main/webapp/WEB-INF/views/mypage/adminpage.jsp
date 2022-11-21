<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-3">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div class="panel panel-info">
    <div class="panel-heading">
    <br><br>
      <h5 class="panel-title">관리자 페이지</h5>
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group">
      <li><a href="update">회원 관리</a></li>
      <li><a href="reserve">예약 내역</a></li>
      <li><a href="process">입양 진행 상황</a></li>
      <li><a href="chat">게시판 수정</a></li>
      <li><a href="mywriting">DB 수정</a></li>
    </ul>
</div></div>


   
 <div>

  <img src="../resources/images/profile_default_pic.png" width="70" height="70" class="d-inline-block align-top" alt="">
<c:if test="${!empty loginUser}">
<h4>${loginUser.nickname} 님</h4> 
</c:if>
<br><br>
<button type="button" onclick="location.href='update'"
        class="w3-button w3-gray">회원 정보 수정</button>
 </div>
</body>
</html>