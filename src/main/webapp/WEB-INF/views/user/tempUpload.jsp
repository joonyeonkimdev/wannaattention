<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드</title>
</head>
<body>
	<form action="tempUpload" method="post" enctype="multipart/form-data" name="f">
		<input type="file" id="tempFile" name="tempFile">
		<input type="submit" value="사진등록">
	</form>
</body>
</html>