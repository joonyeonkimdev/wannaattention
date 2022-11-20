<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	opener.document.f.profileDefaultPic.src = "/tempUploadFile/${filename}";
	if(document.getElementById('profileFilename')){
		opener.document.f.profileFilename.value = "${filename}";
	} else if (document.getElementById('photoFilename')) {
		opener.document.f.photoFilename.value = "${filename}";
	}
	self.close();
</script>