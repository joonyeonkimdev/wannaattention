<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양 동물 상세</title>
<script type="text/javascript">
	function delete_confirm() {
		let flag = confirm("등록 동물을 삭제하시겠습니까?");
		if (flag) {
			location.href="animalDelete?animalNum=${animal.animalNum}";
		}
	}
</script>
</head>
<body>
	<div class="container mt-5">
		<h2>입양 동물 상세보기</h2> 
		<hr>
		<div class="card mb-4">
			<div class="card-body">
				<div class="mt-5" style="text-align: center;">
					<img src="/animalProfile/${animal.profileFilename }" width="500" height="500" class="img-fluid">
				</div>
				<div class="row mt-5" style="text-align: center;">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>${animal.name }</td>
							</tr>
							<tr>
								<th scope="row">추정 나이</th>
								<td>${animal.age }살</td>
							</tr>
							<tr>
								<th scope="row">종</th>
								<td>
									<c:choose>
										<c:when test="${animal.species == '1' }">
											강아지
										</c:when>
										<c:when test="${animal.species == '2' }">
											고양이
										</c:when>
										<c:when test="${animal.species == '3' }">
											기타 동물
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">품종	</th>
								<td>${animal.breed }</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<c:choose>
										<c:when test="${animal.gender == '1' }">
											수컷
										</c:when>
										<c:when test="${animal.gender == '2' }">
											암컷
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">중성화 여부</th>
								<td>
									<c:choose>
										<c:when test="${animal.neutralization == '0' }">
											중성화 X
										</c:when>
										<c:when test="${animal.neutralization == '1' }">
											중성화 O
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">접종 여부</th>
								<td>
									<c:choose>
										<c:when test="${animal.vaccination == '0' }">
											미접종
										</c:when>
										<c:when test="${animal.vaccination == '1' }">
											접종
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">보호소</th>
								<td><a href="shelterInfo?shelterNum=${animal.shelterNum }">${animal.shelterName }</a></td>
							</tr>
							<tr>
								<th scope="row">보호소 입소 날짜</th>
								<td><fmt:formatDate value="${animal.enterDate }" pattern="yyyy-MM-dd" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<th scope="row">보호 종료 날짜</th>
								<td>
									<fmt:formatDate value="${animal.protectEndDate }" pattern="yyyy-MM-dd" />
									<fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyyMMdd" />
									<fmt:parseNumber var="todayAsNum" value="${today }" pattern="########" />
									<fmt:formatDate var="protectEndDate" value="${animal.protectEndDate }" pattern="yyyyMMdd" />
									<fmt:parseNumber var="protectEndDateAsNum" value="${protectEndDate }" pattern="########" />
									<c:if test="${(protectEndDateAsNum - todayAsNum) <= 3}">
										<img src="../../resources/images/emergency.png" width="25px" height="25px" title="3일 이내 보호 기간이 종료됩니다. 부디 입양하여 작은 생명을 살려주세요.">
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<h3 class="mt-4">[ 입양으로 ${animal.name }를(을) 구해주세요. ]</h3>
		<c:if test="${loginUser == null || empty loginUser || loginUser.userType == '0'}">
			<div>
				<button type="button" class="btn btn-success mt-3" onclick="location.href='booking?animalNum=${animal.animalNum}'">입양하기</button>
			</div>
		</c:if>
		<c:if test="${loginUser.userNum == animal.shelterNum }">
			<div>
				<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='animalUpdate?animalNum=${animal.animalNum}'">수정</button>
				<button type="button" class="btn btn-outline-success mt-3" onclick="delete_confirm()">삭제</button>
			</div>
		</c:if>
		<c:if test="${loginUser.id == 'admin' }">
			<button type="button" class="btn btn-outline-success mt-3" onclick="delete_confirm()">삭제</button>
		</c:if>
	</div>
</body>
</html>