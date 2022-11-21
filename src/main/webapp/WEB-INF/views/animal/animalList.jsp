<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양 동물 보기</title>
<script type="text/javascript">
	function filter_species(num) {
		location.href='animalList?species=' + num;
	}
</script>
<style type="text/css">
	a {text-decoration: none;}
</style>
</head>
<body>
	<div class="container mt-5">
		<h2>입양 동물 보기</h2>
		<hr>
		<%-- 동물 종 필터  --%>
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="btn-group col-lg-4 mt-5" role="group" style="text-align:center;">
				<button type="button" id="button0" class="btn btn-outline-primary" onclick="filter_species(0)">전체</button>
				<button type="button" id="button1" class="btn btn-outline-primary" onclick="filter_species(1)">강아지</button>
				<button type="button" id="button2" class="btn btn-outline-primary" onclick="filter_species(2)">고양이</button>
				<button type="button" id="button3" class="btn btn-outline-primary" onclick="filter_species(3)">기타</button>
			</div>
		</div>
		<%-- 글등록 버튼(보호소 유저만) --%>
		<c:if test="${loginUser.userType == '1' }">
			<div class="row">
				<div class="col-lg-11"></div>
				<div class="btn-group mt-5" role="group">
					<button type="button" class="btn btn-outline-success" onclick="location.href='animalRegister'">동물등록</button>
				</div>
			</div>
		</c:if>
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
						<tr style="cursor: pointer;" onclick="location.href='animalDetail?animalNum=${animal.animalNum}'">
							<td>
								<img src="/animalProfile/${animal.profileFilename }" width="200px" height="200px">
							</td>
							<td>
								${animal.name }
								<fmt:formatDate var="today" value="<%=new java.util.Date() %>" pattern="yyyyMMdd" />
								<fmt:parseNumber var="todayAsNum" value="${today }" pattern="########"/>
								<fmt:formatDate var="protectEndDate" value="${animal.protectEndDate }" pattern="yyyyMMdd" />
								<fmt:parseNumber var="protectEndDateAsNum" value="${protectEndDate }" pattern="########"/>
								<c:if test="${(protectEndDateAsNum - todayAsNum) <= 3}">
									<img src="../../resources/images/emergency.png" width="25px" height="25px" title="3일 이내 보호 기간이 종료됩니다. 부디 입양하여 작은 생명을 살려주세요.">
								</c:if>
							</td>
							<td>
								<fmt:formatDate value="${animal.protectEndDate}" pattern="yyyy-MM-dd" />
							</td>
							<td>
								<a href="shelterInfo?shelterNum=${animal.shelterNum }">
									${animal.shelterName}
								</a>
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
							<a class="page-link" href="animalList?species=${species }&pageNum=${pageNum - 1}">Previous</a>
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
							<li class="page-item"><a class="page-link" href="animalList?species=${species }&pageNum=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<%-- 뒤로 --%>
					<c:if test="${pageNum < maxPage}">
						<li class="page-item"><a class="page-link" href="animalList?species=${species }&pageNum=${pageNum + 1}">Next</a></li>
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