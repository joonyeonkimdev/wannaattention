<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script type="text/javascript">
	function set_boardType() {
		let boardType = document.getElementById("boardType");
		let boardTypeSelect = document.getElementById("boardTypeSelect");
		boardType.value = boardTypeSelect.value;
	}

	function onSubmit() {
		let boardTypeSelect = document.getElementById("boardTypeSelect");
		let boardType = document.getElementById("boardType");
		let title = document.getElementById("title");
		
		if (!boardTypeSelect.value || !boardType.value) {
			alert("게시판 종류를 선택하세요.");
			return false;
		}
		if (!title.value) {
			alert("제목을 입력하세요.");
			title.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h5>[ ${boardName } ]</h5>
		<h2>게시글 등록</h2>
		<hr>
		<form:form modelAttribute="board" action="boardWrite" enctype="multipart/form-data" name="f" onsubmit="return onSubmit();">
			<spring:hasBindErrors name="board">
				<font color="red">
	            	<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<form:hidden path="writerNum" value="${loginUser.userNum }" />
			<form:hidden path="writerId" value="${loginUser.id }" />
			<div class="form-group mt-5">
				<div class="input-group-prepend">
					<span class="input-group-text">게시판 종류</span>
				</div>
				<form:hidden path="boardType"/>
				<c:choose>
					<c:when test="${boardType != null && !empty boardType  }">
						<select class="custom-select" id="boardTypeSelect" onchange="set_boardType()">
							<option></option>
							<option value="${boardType }">${boardName }</option>
						</select>
					</c:when>
					<c:otherwise>
						<select class="custom-select" id="boardTypeSelect" onchange="set_boardType()">
							<option></option>
							<c:if test="${loginUser.id == 'admin' }">
								<option value="1">공지사항</option>
								<option value="2">후원금 사용내역</option>
							</c:if>
							<option value="3">QnA</option>
							<option value="4">자유게시판</option>
							<option value="5">입양 후기</option>
						</select>
					</c:otherwise>
				</c:choose>
				<small style="color: red;"><form:errors path="boardType" /></small>
			</div>
			<div class="form-group mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<form:input path="title" class="form-control" placeholder="제목은 50자 이내로 작정해 주세요" />
				<small style="color: red;"><form:errors path="title" /></small>
			</div>
			<div class="form-group mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<form:textarea path="content" class="form-control" rows="10"/>
				<script type="text/javascript">
					CKEDITOR.replace("content", {
						filebrowserImageUploadUrl : "imgupload"
						});
				</script>
				<small style="color: red;"><form:errors path="content" /></small>
			</div>
			<div class="form-group mt-3" id="photoFilenameDiv" >
				<div class="input-group-prepend">
					<span class="input-group-text">사진 업로드</span>
				</div>
				<input type="file" id="photoFile" name="photoFile" class="form-control">
			</div>
			<div>
				<button type="submit" class="btn btn-success mt-3" id="submit">게시글 등록</button>
			</div>
		</form:form>
	</div>

</body>
</html>