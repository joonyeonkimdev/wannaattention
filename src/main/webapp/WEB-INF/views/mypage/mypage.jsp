<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    
    <title>마이페이지</title>
    <style>
.col-md-3{
    background: rgb(249, 249, 249);
   position: absolute; 
    top: 28px;
   left: 0;
    
    width: 260px;
    height: 100%; 
    margin-top: 30px;
}
ul{
   list-style:none;
   
   }
a{color: gray; text-decoration: none;}
    </style>
</head>

<body>
<div class="col-md-3">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div class="panel panel-info">
    <div class="panel-heading">
    <br><br>
      <h5 class="panel-title">마이 페이지</h5>
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group">
      <li><a href="update">회원 정보 수정</a></li>
      <li><a href="reserve">예약 내역</a></li>
      <li><a href="process">입양 진행 상황</a></li>
       <c:if test="${loginUser.userType=='0'}">
      <li><a href="attention">관심 목록</a></li>
      <li><a href="patron">후원 내역</a></li>
      </c:if>
      <li><a href="chat">나의 채팅</a></li>
      <li><a href="mywriting">내가 쓴 글</a></li>
      <c:if test="${loginUser.userType=='1'}">
      <li><a href="animalcare">동물 관리</a></li> 
      </c:if>                 
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
        <c:if test="${loginUser.userType=='0'}">&nbsp;&nbsp;&nbsp;&nbsp; 
        <button type="button" onclick=""
        class="w3-button w3-gray">관심 목록</button> <br>
      </c:if>
 </div>
  <script>

  </script>
</body>
</html>