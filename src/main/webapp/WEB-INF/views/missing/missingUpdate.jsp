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
<title>실종 동물 수정</title>
<script type="text/javascript">
	function uploadPopup() {
		let op = "width=500,height=300,left=50,top=150";
		open("/tempUpload","",op);
	}
	
	function set_status() {
		let statusSelect  = document.getElementById("statusSelect");
		let status = document.getElementById("status");
		
		status.value = statusSelect.value;
	}
	
	function set_species() {
		let speciesSelect  = document.getElementById("speciesSelect");
		let species = document.getElementById("species");
		
		species.value = speciesSelect.value;
	}
	
	function set_gender() {
		let genderSelect  = document.getElementById("genderSelect");
		let gender = document.getElementById("gender");
		
		gender.value = genderSelect.value;
	}
	
	function onSubmit() {
		let writerNum = document.getElementById("writerNum");
		let writerNickname = document.getElementById("writerNickname");
		let status = document.getElementById("status");
		let species = document.getElementById("species");
		let breed = document.getElementById("breed");
		let gender = document.getElementById("gender");
		let location = document.getElementById("location");
		
		if (!status.value) {
			alert("실종 상태를 선택하세요.");
			return false;
		}
		if (!species.value) {
			alert("동물 종류를 선택하세요.");
			return false;
		}
		if (!gender.value) {
			alert("성별을 선택하세요. 모를 시 '모름'");
			gender.focus();
			return false;
		}
		if (!location.value) {
			alert("실종(목격, 보호) 지역을 입력하세요.");
			location.focus();
			return false;
		}
		
	}
</script>
<style type="text/css">
	.profileDefaultPic {
		width: 300px;
		height: 300px;
	}
</style>
</head>
<body>
	<fmt:formatDate var="year" value="<%=new java.util.Date() %>" pattern="yyyy" />
	<div class="container">
		<h2>실종 동물 수정</h2>
		<hr>
		<form:form modelAttribute="missingAnimal" action="missingUpdate" enctype="multipart/form-data" name="f" onsubmit="return onSubmit();">
			<form:hidden path="missingAnimalNum"/>
			<form:hidden path="regDate"/>
			<div class="form-group col-lg-4 mt-5">
				<c:choose>
					<c:when test="${missingAnimal.photoFilename != null && missingAnimal.photoFilename != ''}">
						<img src="/missingPhoto/${missingAnimal.photoFilename }" class="profileDefaultPic" name="profileDefaultPic">
					</c:when>
					<c:otherwise>
						<img src="../../../resources/images/animProfile_default_pic.png" class="profileDefaultPic" name="profileDefaultPic">
					</c:otherwise>
				</c:choose>
				<br>
				프로필
			</div>
			<div>
				<a onclick="uploadPopup()">
					<button type="button" class="btn btn-info btn-sm">사진 업로드</button>
				</a>
				<form:hidden path="photoFilename"/>
			</div>
			<spring:hasBindErrors name="missingAnimal">
				<font color="red">
	            	<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<form:hidden path="writerNum" value="${loginUser.userNum }"/>
			<form:hidden path="writerNickname" value="${loginUser.nickname }"/>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">실종 상태</span>
				</div>
				<form:hidden path="status"/>
				<select class="custom-select" id="statusSelect" onchange="set_status()">
					<option selected="selected"></option>
					<option value="1">실종</option>
					<option value="2">목격</option>
					<option value="3">보호 중</option>
				</select>
				<small style="color: red;"><form:errors path="status" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">동물 종</span>
				</div>
				<form:hidden path="species"/>
				<select class="custom-select" id="speciesSelect" onchange="set_species()">
					<option selected="selected"></option>
					<option value="1">강아지</option>
					<option value="2">고양이</option>
					<option value="3">기타 동물</option>
				</select>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">품종</span>
				</div>
				<form:input path="breed" class="form-control" />
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">성별</span>
				</div>
				<form:hidden path="gender"/>
				<select class="custom-select" id="genderSelect" onchange="set_gender()">
					<option selected="selected"></option>
					<option value="1">암컷</option>
					<option value="2">수컷</option>
					<option value="3">모름</option>
				</select>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">위치</span>
				</div>
				<form:input path="location" class="form-control" />
				<small style="color: red;"><form:errors path="location" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">설명</span>
				</div>
				<form:textarea path="description" class="form-control" cols="10"/>
				<small style="color: red;"><form:errors path="description" /></small>
			</div>
			<div>
				<button type="submit" class="btn btn-success mt-3" id="submit">등록하기</button>
			</div>
		</form:form>
	</div>
</body>
</html>