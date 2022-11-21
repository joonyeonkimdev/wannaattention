<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호소 정보</title>
</head>
<body>
	<div class="container">
		<h2>보호소 정보</h2>
		<hr>
		<div class="row mb-5">
			<div class="col-lg-10"></div>
			<div class="btn-group " role="group">
				<button type="button" class="btn btn-outline-success" onclick="location.href='/message?senderNum=${shelter.userNum}'">DM 보내기</button>
			</div>
		</div>
		<div class="mt-5" style="text-align: center;">
			<img src="/userProfile/${shelter.profileFilename }" width="500" height="500">
		</div>
		<div class="row mt-5" style="text-align: center;">
			<table class="table table-striped">
				<tbody>
					<tr>
						<th scope="row">보호소 이름</th>
						<td>${shelter.name }</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>${shelter.email }</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td>${shelter.tel }</td>
					</tr>
					<tr>
						<th scope="row">우편번호</th>
						<td>${shelter.postNum }</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td>${shelter.address }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>