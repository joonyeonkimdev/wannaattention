<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 초기화</title>
<script type="text/javascript">
	function onSubmit() {
		let pw = document.getElementById("pw");
		let pwCheck = document.getElementById("pwCheck");
		let pwRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		
		if (!pw.value) {
			alert("비밀번호를 입력하세요.");
			pw.focus();
			return false;
		} else if (!pwRegex.test(pw.value)) {
			alert("비밀번호는 영문+숫자+특수문자 조합 8~25자리를 사용해야 합니다.");
			pw.value = "";
			pw.focus();
			return false;
		} else if (pw.value != pwCheck.value) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			pw.value = "";
			pwCheck.value = "";
			pw.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${user != null }">
			<form:form modelAttribute="user" action="initiPw" name="f" method="post" onsubmit="return onSubmit();">
				<spring:hasBindErrors name="user">
					<font color="red">
		            	<c:forEach items="${errors.globalErrors }" var="error">
							<spring:message code="${error.code}" />
						</c:forEach>
					</font>
				</spring:hasBindErrors>
				<div class="form-group col-lg-4 mt-3">
					<form:password path="pw" class="form-control" placeholder="새로운 비밀번호" />
		   			<input type="password" id="pwCheck" class="form-control" placeholder="비밀번호 확인">
				</div>
				<div>
					<button type="submit" class="btn btn-success mt-3" id="submit">비밀번호 초기화</button>
				</div>
			</form:form>
			</c:when>
			<c:when test="${user == null }">
				<font color="red">존재하지 않는 아이디입니다.</font>
				<div>
					<a href="login"><button class="btn btn-primary mt-3">로그인</button></a>
					<a href="/"><button class="btn btn-primary mt-3">홈으로</button></a>
				</div>
			</c:when>
		</c:choose>
	</div>

</body>
</html>