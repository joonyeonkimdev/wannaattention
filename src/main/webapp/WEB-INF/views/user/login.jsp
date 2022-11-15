<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function onSubmit() {
		let id = document.getElementById("id");
		let pw = document.getElementById("pw");
		
		if (!id.value) {
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		
		if (!pw.value) {
			alert("비밀번호를 입력하세요.");
			id.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2>로그인</h2>
		<hr>
		<form:form modelAttribute="user" action="login" name="f" onsubmit="return onSubmit();">
			<spring:hasBindErrors name="user">
				<font color="red">
	            	<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="id" class="form-control" placeholder="아이디" />
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:password path="pw" class="form-control" placeholder="비밀번호" />
			</div>
			<div>
				<button type="submit" class="btn btn-primary mt-3" id="submit">로그인</button>
			</div>
		</form:form>
	</div>
</body>
</html>