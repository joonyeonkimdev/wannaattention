<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실종 상세 보기</title>
<script type="text/javascript">
	function delete_confirm() {
		let flag = confirm("실종 등록 동물을 삭제하시겠습니까?");
		if (flag) {
			location.href="missingDelete?missingAnimalNum=${missingAnimal.missingAnimalNum}";
		}
	}
</script>
</head>
<body>
	<div class="container mt-5">
		<h2>실종 상세 보기</h2> 
		<hr>
		<div class="card mb-4">
			<div class="card-body">
				<div class="mt-5" style="text-align: center;">
					<img src="/missingPhoto/${missingAnimal.photoFilename }" width="500" height="500" class="img-fluid">
				</div>
				<div class="row mt-5" style="text-align: center;">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th scope="row">실종상태</th>
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
							</tr>
							<tr>
								<th scope="row">종</th>
								<td>
									<c:choose>
										<c:when test="${missingAnimal.species == '1' }">
											강아지
										</c:when>
										<c:when test="${missingAnimal.species == '2' }">
											고양이
										</c:when>
										<c:when test="${missingAnimal.species == '3' }">
											기타 동물
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">품종	</th>
								<td>${missingAnimal.breed }</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<c:choose>
										<c:when test="${missingAnimal.gender == '1' }">
											수컷
										</c:when>
										<c:when test="${missingAnimal.gender == '2' }">
											암컷
										</c:when>
										<c:when test="${missingAnimal.gender == '3' }">
											모름
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">위치</th>
								<td>${missingAnimal.location }</td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td>${missingAnimal.description }</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>
									${missingAnimal.writerNickname }
									<img src="../../../resources/images/message_pic.png" width="25" height="25" onclick="sendMessage()">
								</td>
							</tr>
							<tr>
								<th scope="row">작성일</th>
								<td>
									<fmt:formatDate value="${missingAnimal.regDate }" pattern="yyyy-MM-dd HH:mm" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div>
			<c:choose>
				<c:when test="${loginUser.id == 'admin' }">
					<button type="button" class="btn btn-outline-success mt-3" onclick="delete_confirm()">삭제</button>
					<c:if test="${loginUser.userNum == missingAnimal.writerNum }">
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='missingUpdate?missingAnimalNum=${missingAnimal.missingAnimalNum}'">수정</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${missingAnimal.writerNum == loginUser.userNum }">
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='missingUpdate?missingAnimalNum=${missingAnimal.missingAnimalNum}'">수정</button>
						<button type="button" class="btn btn-outline-success mt-3" onclick="delete_confirm()">삭제</button>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
</html>