<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${user != null }">
				<table style="float: none; margin: 0 auto;">
					<tr>
						<td>아이디</td>
						<td>${user.id }</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="mt-1">
								<a href="login"><button class="btn btn-success mt-3">로그인</button></a>
								<a href="/"><button class="btn btn-success mt-3">홈으로</button></a>
							</div>
						</td>
					</tr>
				</table>
			</c:when>
			<c:when test="${user == null }">
				<font color="red">아이디가 존재하지 않습니다.</font>
				<div>
					<a href="login"><button class="btn btn-primary mt-3">로그인</button></a>
					<a href="/"><button class="btn btn-primary mt-3">홈으로</button></a>
				</div>
			</c:when>
		</c:choose>
	</div>
</body>
</html>