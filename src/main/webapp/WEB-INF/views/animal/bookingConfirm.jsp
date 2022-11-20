<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문예약 확인</title>
<script type="text/javascript">
	window.alert("방문 예약이 완료되었습니다.");
</script>
</head>
<body>
	<div class="mt-5">
		<h1>
			${loginUser.name }님,<br>
			입양 방문 예약이 완료되었습니다.
		 </h1>
		 <br>
		 <p>당신의 작은 관심이 수 많은 생명을 살릴 수 있습니다. 감사합니다.</p>
	</div>
	<br><br><br>
	<div class="mt-5">
		<a href="/"><button type="button" class="btn btn-success">홈으로</button></a>
	</div>
</body>
</html>