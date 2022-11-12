<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script type="text/javascript">
	function use() {
		opener.document.getElementById("idChosen").value = "${id}";
		opener.document.f.id.value = "${id}";
		self.close();
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${id == null ||  id  == '' }">
			<script type="text/javascript">
				window.alert("아이디를 입력하세요.");
				window.history.go(-1);
			</script>
		</c:when>
		<c:when test="${user == null }">
			<font color="green">사용 가능한 아이디입니다.</font>
			<table>
				<tr>
					<td>아이디</td>
					<td>${id }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="사용하기" onclick="use()"></td>
				</tr>
			</table>
		</c:when>
		<c:when test="${user != null }">
			<font color="red">이미 사용 중인 아이디입니다.</font><br><br>
			<table>
				<tr>
					<td>아이디</td>
					<td>${id }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="확인" onclick="self.close()"></td>
				</tr>
			</table>
		</c:when>
	</c:choose>
</body>
</html>