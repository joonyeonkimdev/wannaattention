<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<script type="text/javascript">
	function delete_confirm() {
		let flag = confirm("게시글을 삭제하시겠습니까?");
		if (flag) {
			location.href="boardDelete?baordNum=${board.boardNum}";
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h5>[ ${boardName } ]</h5>
		<h2>게시글 상세</h2>
		<hr>
		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="form-group mt-5">
						<div class="input-group-prepend d-flex justify-content-center">
							<h3>${board.title}</h3>
						</div>
						<br>
						${board.writerNickname}
						<fmt:formatDate var="regDate" value="${board.regDate }" pattern="yyyy-MM-dd HH:mm"/>
						${regDate}
						<br>
						조회 ${board.readCnt}
					</div>
					<hr>
					<div class="form-group mt-3">
						${board.content}
					</div>
	
					<div class="form-group mt-3">
						
					</div>
				</form>
			</div>
		</div>
		<div>
			<c:choose>
				<c:when test="${loginUser.id == 'admin' }">
					<c:if test="${loginUser.userNum == board.writerNum }">
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardUpdate'">수정</button>
					</c:if>
					<button type="button" class="btn btn-outline-success mt-3" onclick="delete_confirm()">삭제</button>
				</c:when>
				<c:otherwise>
					<c:if test="${board.writerNum == loginUser.userNum }">
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardUpdate'">수정</button>
						<button type="button" class="btn btn-outline-success mt-3" onclick="delete_confirm()">삭제</button>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>