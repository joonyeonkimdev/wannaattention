<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<div class="container mt-5">
		<nav>
			<ol class="breadcrumb bg-light d-flex justify-content-center">
				<li class="breadcrumb-item"><a href="#">공지사항</a></li>
				<li class="breadcrumb-item"><a href="#">후원금 사용내역</a></li>
				<li class="breadcrumb-item"><a href="#">QnA</a></li>
				<li class="breadcrumb-item"><a href="#">자유게시판</a></li>
				<li class="breadcrumb-item active"><a href="#">입양 후기</a></li>
			</ol>
		</nav>
		<br>
		<h2>${boardName }</h2>
		<hr>
		<c:choose>
			<c:when test="${loginUser != null && !empty loginUser }">
				<div class="row">
					<div class="col-lg-11"></div>
					<div class="btn-group mt-5" role="group">
						<button type="button" class="btn btn-outline-success" onclick="location.href='boardWrite'">글 등록</button>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${boardType == '4' || boardType == '5'}">
					<div class="row">
					<div class="col-lg-11"></div>
					<div class="btn-group mt-5" role="group">
						<button type="button" class="btn btn-outline-success" onclick="location.href='boardWrite'">글 등록</button>
					</div>
				</div>
				</c:if>
			</c:otherwise>
		</c:choose>
		<div class="row mt-5">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">글 번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList }">
						<tr style="cursor: pointer;" onclick="location.href='boardDetail?boardNum=${board.boardNum}'">
							<td>${boardNo }</td>
							<c:set var="boardNo" value="${boardNo - 1}" />
							<td>${board.title }</td>
							<td>${board.writerNickname }</td>
							<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
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
							<a class="page-link" href="boardList?pageNum=${pageNum - 1}">Previous</a>
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
							<li class="page-item"><a class="page-link" href="boardList?pageNum=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<%-- 뒤로 --%>
					<c:if test="${pageNum < maxPage}">
						<li class="page-item"><a class="page-link" href="boardList?pageNum=${pageNum + 1}">Next</a></li>
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