<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
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
						<div class="input-group-prepend">
							<span class="input-group-text">글 번호</span>
						</div>
						<input type="text" class="form-control" id="boardNum" value="${board.boardNum}" disabled="disabled">
					</div>
					<div class="form-group mt-3">
						<div class="input-group-prepend">
							<span class="input-group-text">제목</span>
						</div>
						<input type="text" class="form-control" id="title" value="${board.title}" disabled="disabled">
					</div>
					<div class="form-group mt-3">
						<div class="input-group-prepend">
							<span class="input-group-text">조회수</span>
						</div>
						<input type="text" class="form-control" id="title" value="${board.readCnt}" disabled="disabled">
					</div>
					<div class="form-group mt-3">
						<div class="input-group-prepend">
							<span class="input-group-text">내용</span>
						</div>
						<textarea class="form-control" id="content" disabled="disabled" rows="10">${board.content}</textarea>
					</div>
					<div class="form-group mt-3">
						<div class="input-group-prepend">
							<span class="input-group-text">작성자</span>
						</div>
						<input type="text" class="form-control" id="writerNickname" value="${board.writerNickname}" disabled="disabled">
					</div>
					<div class="form-group mt-3">
						<fmt:formatDate var="regDate" value="${board.regDate }" pattern="yyyy-MM-dd HH:mm"/>
						<div class="input-group-prepend">
							<span class="input-group-text">등록일</span>
						</div>
						<input type="text" class="form-control" id="regDate" value="${regDate}" disabled="disabled">
					</div>
				</form>
			</div>
		</div>
		<div>
			<c:choose>
				<c:when test="${loginUser.id == 'admin' }">
					<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardReply'">답글</button>
					<c:if test="${loginUser.userNum == board.writerNum }">
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardUpdate'">수정</button>
					</c:if>
					<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardDelete'">삭제</button>
				</c:when>
				<c:otherwise>
					<c:if test="${board.writerNum != loginUser.userNum && (board.boardType == '4' || board.boardType == '5')}">
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardReply'">답글</button>
					</c:if>
					<c:if test="${board.writerNum == loginUser.userNum }">
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardUpdate'">수정</button>
						<button type="button" class="btn btn-outline-success mt-3" onclick="location.href='boardDelete'">삭제</button>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>