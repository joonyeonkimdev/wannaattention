<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="path" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<title><sitemesh:write property="title" /></title>
<sitemesh:write property="head" />
<%-- ckeditor 설정 --%>
<script type="text/javascript" src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<style type="text/css">
	.form-group {
		float: none;
		margin: 0 auto;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
    <%-- HEADER --%>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/">
			    <img src="../resources/images/service_logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
			    WannaAttention
    		</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">입양</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${path}/animal/animalList">입양하기</a>
							<a class="dropdown-item" href="${path}/animal/animalRegister">입양동물 등록</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">실종동물 찾기</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${path}/missing/missingList">실종 동물 보기</a>
							<a class="dropdown-item" href="${path}/missing/missingRegister">실종 동물 신고</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">도움의 손길</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${path}/touchOfAid/donate">후원하기</a>
							<a class="dropdown-item" href="${path}/touchOfAid/voluteer">자원봉사</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">정보 	게시판</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${path}/info/animalHospitalList">동물 병원</a>
							<a class="dropdown-item" href="${path}/info/animalHotelList">동물 호텔</a>
							<a class="dropdown-item" href="${path}/info/animalSalonList">동물 미용실</a>
							<a class="dropdown-item" href="${path}/info/animalFestList">동물 축제</a>
							<a class="dropdown-item" href="${path}/info/animalPlaygroundList">동물 놀이터</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">커뮤니티</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${path}/community/boardList?boardType=1">공지사항</a>
							<a class="dropdown-item" href="${path}/community/boardList?boardType=2">후원금 사용내역</a>
							<a class="dropdown-item" href="${path}/community/boardList?boardType=3">QNA</a>
							<a class="dropdown-item" href="${path}/community/boardList?boardType=4">자유게시판</a>
							<a class="dropdown-item" href="${path}/community/boardList?boardType=5">입양 후기</a>
						</div>
					</li>
				</ul>
				<span>
					<c:if test="${empty sessionScope.loginUser}">
						<a href="${path}/user/login">로그인</a><br>
						<a href="${path}/user/join">회원가입</a>
					</c:if> 
					<c:if test="${!empty sessionScope.loginUser}">
						<c:choose>
							<c:when test="${loginUser.profileFilename != null }">
								&nbsp;&nbsp;
								<img src="/userProfile/${loginUser.profileFilename }" class="d-inline-block align-top" style="width: 30px; height: 30px; border-radius: 50%;">
							</c:when>
							<c:otherwise>
								&nbsp;&nbsp;
								<img src="/resources/images/profile_default_pic.png" class="d-inline-block align-top" style="width: 30px; height: 30px; border-radius: 50%;">
							</c:otherwise>
						</c:choose>
						<br>
						<a href="${path}/user/logout">로그아웃</a>
					</c:if>
				</span>
			</div>
		</nav>
	</header>

	<%-- MAIN --%>
	<main role="main" class="container text-center py-5 mt-auto">
		<sitemesh:write property="body" />
	</main>
	    
	<%-- FOOTER --%>
	<footer class="text-center py-5 mt-auto">
		<hr>
		<p>
			&copy; 2022 Happyfeet Company, Inc. 
			<br>
			<a href="#">About us</a> &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
		</p>
	</footer>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>