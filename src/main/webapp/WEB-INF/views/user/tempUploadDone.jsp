<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	opener.document.f.profileDefaultPic.src = "../../tempUploadFile/" + "${filename}";
	opener.document.f.profileFilename.value = "${filename}";
	self.close();
</script>