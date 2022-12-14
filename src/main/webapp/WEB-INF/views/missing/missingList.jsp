<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실종 목록 보기</title>
<script type="text/javascript">
	function filter_species(num) {
		location.href='missingList?species=' + num;
	}
</script>
<style type="text/css">
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<div class="container mt-5">
		<h2>실종 목록 보기</h2>
		<hr>
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="btn-group col-lg-4 mt-5" role="group" style="text-align:center;">
				<button type="button" id="button0" class="btn btn-outline-primary" onclick="filter_species(0)">전체</button>
				<button type="button" id="button1" class="btn btn-outline-primary" onclick="filter_species(1)">강아지</button>
				<button type="button" id="button2" class="btn btn-outline-primary" onclick="filter_species(2)">고양이</button>
				<button type="button" id="button3" class="btn btn-outline-primary" onclick="filter_species(3)">기타</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10"></div>
			<div class="btn-group mt-5" role="group">
				<button type="button" class="btn btn-outline-success" onclick="location.href='missingRegister'">실종 등록</button>
			</div>
		</div>
		<div class="row mt-5">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">사진</th>
						<th scope="col">실종 상태</th>
						<th scope="col">위치</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="missingAnimal" items="${missingList }">
						<tr style="cursor: pointer;" onclick="location.href='missingDetail?missingAnimalNum=${missingAnimal.missingAnimalNum}'">
							<td>
								<img src="/missingPhoto/${missingAnimal.photoFilename }" width="200px" height="200px">
							</td>
							<td>
								<c:choose>
									<c:when test="${missingAnimal.status == '1' }">
										실종
									</c:when>
									<c:when test="${missingAnimal.status == '2' }">
										목격
									</c:when>
									<c:when test="${missingAnimal.status == '3' }">
										보호 중
									</c:when>
								</c:choose>
							</td>
							<td>
								${missingAnimal.location }
							</td>
							<td>
								<fmt:formatDate value="${missingAnimal.regDate}" pattern="yyyy-MM-dd" />
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
							<a class="page-link" href="missingList?pageNum=${pageNum - 1}">Previous</a>
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
							<li class="page-item"><a class="page-link" href="missingList?pageNum=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<%-- 뒤로 --%>
					<c:if test="${pageNum < maxPage}">
						<li class="page-item"><a class="page-link" href="missingList?pageNum=${pageNum + 1}">Next</a></li>
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