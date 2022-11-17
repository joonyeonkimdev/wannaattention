<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양 동물 보기</title>
</head>
<body>
	<div class="container mt-5">
		<h2>입양 동물 보기</h2>
		<hr>
		<%-- 동물 종 필터  --%>
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="btn-group col-lg-4 mt-5" role="group" style="text-align:center;">
				<button type="button" class="btn btn-outline-primary" value="">전체</button>
				<button type="button" class="btn btn-outline-secondary" value="">강아지</button>
				<button type="button" class="btn btn-outline-secondary" value="">고양이</button>
				<button type="button" class="btn btn-outline-secondary" value="">기타</button>
			</div>
		</div>
		<%-- 정렬 필터 --%>
		<div class="row">
			<div class="col-11 mt-5"></div>
			<div class="btn-group col-1">
				<button type="button" class="btn btn-info dropdown-toggle " data-toggle="dropdown">정렬</button>
				<div class="dropdown-menu">
					<a class="dropdown-item active" href="#">보호종료일 순</a>
					<a class="dropdown-item" href="#">최신순</a>
					<a class="dropdown-item" href="#">오래된순</a>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">사진</th>
						<th scope="col">이름</th>
						<th scope="col">보호 종료 일자</th>
						<th scope="col">보호소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="animal" items="${animalList }">
						<tr style="cursor: pointer;" onclick="location.href='animalDetail?num'+${animal.animalNum};">
							<td>
								<img src="/profileFile/${animal.profileFilename }" width="200px" height="200px">
							</td>
							<td>
								${animal.name }
							</td>
							<td>
								<fmt:formatDate value="${animal.protectEndDate}" pattern="yyyy-MM-dd" />
							</td>
							<td>
								${animal.shelterName}
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
			</table>
		</div>
		<%-- 페이징  --%>
		<div class="row justify-content-center mt-5">
			<nav>
				<ul class="pagination">
					<%-- 앞으로 --%>
					<c:if test="${pageNum > 1}">
						<li class="page-item">
							<a class="page-link" href="animalList?pageNum=${pageNum - 1}">Previous</a>
						</li>
					</c:if>
					<c:if test="${pageNum <= 1}">
						<li class="page-item disabled"><a class="page-link">Previous</a></li>
					</c:if>
					
					<%-- 페이징 --%>
					<c:forEach var="a" begin="${startPage }" end="${endPage}">
						<c:if test="${a == pageNum}">
							<li class="page-item disabled"><a class="page-link">${a}</a></li>
						</c:if>
						<c:if test="${a != pageNum}">
							<li class="page-item"><a class="page-link" href="animalList?pageNum=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<%-- 뒤로 --%>
					<c:if test="${pageNum < maxPage}">
						<li class="page-item"><a class="page-link" href="animalList?pageNum=${pageNum + 1}">Next</a></li>
					</c:if>
					<c:if test="${pageNum >= maxPage}">
						<li class="page-item disabled"><a class="page-link">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>