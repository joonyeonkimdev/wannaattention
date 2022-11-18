<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<title>Home</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="jumbotron bg-light">
		<h1 class="display-4"><strong>Adopt to Save!</strong></h1>
		<p class="lead">입양으로 수 많은 생명을 살릴 수 있습니다.</p>
		<hr class="my-4">
		<p>당신의 작은 관심이 필요합니다.</p>
		<a class="btn btn-success btn-lg" href="/animal/animalList" role="button">입양하기</a>
	</div>
	<div class="card-deck">
		<div class="card" style=" cursor: pointer;" onclick="location.href='/animal/animalList';">
			<img src="/resources/images/home_card_pic01.jpg" class="card-img-top">
			<div class="card-body">
				<h5 class="card-title"><strong>입양하기</strong></h5>
				<p class="card-text">
					보호소 동물들은 입양되지 못하면<br>
					목숨을 잃게 됩니다.<br>
					여러분만이 구할 수 있습니다.<br>
					입양하여 많은 생명을 구해주세요.
				</p>
			</div>
		</div>
		<div class="card" style="cursor: pointer;" onclick="location.href='/board/missingAnimalList';">
			<img src="/resources/images/home_card_pic02.jpg" class="card-img-top">
			<div class="card-body">
				<h5 class="card-title"><strong>실종동물 찾기</strong></h5>
				<p class="card-text">
					실종동물에 대한<br>
					게시판을 운영 중입니다.<br>
					이들이 가족의 품으로 돌아가도록<br>
					도와주세요.
				</p>
			</div>
		</div>
		<div class="card" style="cursor: pointer;" onclick="location.href='/touchOfAid/donate';">
			<img src="/resources/images/home_card_pic03.png" class="card-img-top">
			<div class="card-body">
				<h5 class="card-title"><strong>도움의 손길</strong></h5>
				<p class="card-text">
					후원과 봉사활동을 신청할 수 있습니다.<br>
					멀리서나마 도움의 손길을 보내주세요.<br>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
