<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script type="text/javascript">
	function onSubmit() {
		let id = document.getElementById("id");
		if (!id.value) {
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		} else if (id.value.length < 5 || id.value.length > 15) {
			alert("아이디는 5~15자리를 사용해야 합니다.");
			id.value = "";
			id.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form action="idDuplChkDone" method="post" name="f" onsubmit="return onSubmit()">
		<input type="text" id="id" name="id">
		<input type="submit" value="중복확인">
	</form>
</body>
</html>