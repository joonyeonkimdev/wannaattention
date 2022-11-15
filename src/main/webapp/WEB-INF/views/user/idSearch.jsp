<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	function onSubmit() {
		let email = document.getElementById("email");
		let ques1 = document.getElementById("ques1");
		let ques2 = document.getElementById("ques2");
		let ques3 = document.getElementById("ques3");
		
		if (!email.value) {
			alert("이메일을 입력하세요.");
			email.focus();
			return false;
		}
		if (!ques1.value) {
			alert("보안질문의 답을 입력하세요.");
			ques1.focus();
			return false;
		}
		if (!ques2.value) {
			alert("보안질문의 답을 입력하세요.");
			ques2.focus();
			return false;
		}
		if (!ques3.value) {
			alert("보안질문의 답을 입력하세요.");
			ques3.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2>아이디 찾기</h2>
		<hr>
		<form:form modelAttribute="user" action="idSearch" name="f" method="post" onsubmit="return onSubmit();">
			<div class="form-group col-lg-4 mt-3">
				<form:input path="email" class="form-control" placeholder="회원 등록 이메일을 입력하세요." />
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="ques1" class="form-control" placeholder="보안질문1: 태어난 도시 이름은?" />
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="ques2" class="form-control" placeholder="보안질문2: 학창시절 별명은?" />
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="ques3" class="form-control" placeholder="보안질문3: 첫 애완동물 이름은?" />
			</div>
			<div>
				<button type="submit" class="btn btn-primary mt-3" id="submit">찾기</button>
			</div>
		</form:form>
	</div>
</body>
</html>