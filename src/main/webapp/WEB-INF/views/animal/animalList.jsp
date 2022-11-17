<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /wannaattention/src/main/webapp/WEB-INF/views/board/animalList.jsp -->
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
						<th scope="col">번호</th>
						<th scope="col">사진</th>
						<th scope="col">이름</th>
						<th scope="col">보호 종료 일자</th>
						<th scope="col">보호소</th>
					</tr>
				</thead>
				<tbody>
					<tr onclick="location.href='animalDetail';">
						<th scope="row">rownum</th>
						<td>
							<img src="/profileFile/${animal.profileFilename }" width="200px" height="200px">
						</td>
						<td>
							${animal.name }이름
						</td>
						<td>
							${animal.protectEndDate}보호 종료 일자
						</td>
						<td>
							${shelter.name}보호소 이름
						</td>
					</tr>
					<tr>
						<th scope="row">rownum</th>
						<td>
							<img src="/profileFile/${animal.profileFilename }" width="200px" height="200px">
						</td>
						<td>
							${animal.name }이름
						</td>
						<td>
							${animal.protectEndDate}보호 종료 일자
						</td>
						<td>
							${shelter.name}보호소 이름
						</td>
					</tr>
					<tr>
						<th scope="row">rownum</th>
						<td>
							<img src="/profileFile/${animal.profileFilename }" width="200px" height="200px">
						</td>
						<td>
							${animal.name }이름
						</td>
						<td>
							${animal.protectEndDate}보호 종료 일자
						</td>
						<td>
							${shelter.name}보호소 이름
						</td>
					</tr>
					<tr>
						<th scope="row">rownum</th>
						<td>
							<img src="/profileFile/${animal.profileFilename }" width="200px" height="200px">
						</td>
						<td>
							${animal.name }이름
						</td>
						<td>
							${animal.protectEndDate}보호 종료 일자
						</td>
						<td>
							${shelter.name}보호소 이름
						</td>
					</tr>
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
					<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>