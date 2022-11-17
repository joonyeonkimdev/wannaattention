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
<title>입양 동물 등록하기</title>
<script type="text/javascript">
	//프로필 업로드 팝업
	function uploadPopup() {
		let op = "width=500,height=300,left=50,top=150";
		open("/tempUpload","",op);
	}
	
	// 보호소 입소일자 선택값 세팅
	function set_enterDate() {
		let year = document.getElementById("year1");
		let month = document.getElementById("month1");
		let date = document.getElementById("date1");
		let enterDateStr = document.getElementById("enterDateStr");
		let enterDate = document.getElementById("enterDate");
		
		if (year.value && month.value && date.value) {
			if (year.value != "연" && month.value != "월" && date.value != "일" ) {
				enterDateStr.value = year.value + "-" + month.value + "-" + date.value;
				enterDate.value = enterDateStr.value;
			}
		}
	}
	
	// 보호소 입소일자 선택값 세팅
	function set_protectEndDate() {
		let year = document.getElementById("year2");
		let month = document.getElementById("month2");
		let date = document.getElementById("date2");
		let protectEndDateStr = document.getElementById("protectEndDateStr");
		let protectEndDate = document.getElementById("protectEndDate");
		
		if (year.value && month.value && date.value) {
			if (year.value != "연" && month.value != "월" && date.value != "일" ) {
				protectEndDateStr.value = year.value + "-" + month.value + "-" + date.value;
				protectEndDate.value = protectEndDateStr.value;
			}
		}
	}
	
	// 동물 종류 hidden값 세팅
	function set_species() {
		let speciesSelect  = document.getElementById("speciesSelect");
		let species = document.getElementById("species");
		
		species.value = speciesSelect.value;
	}
	// 성별 hidden값 세팅
	function set_gender() {
		let genderSelect  = document.getElementById("genderSelect");
		let gender = document.getElementById("gender");
		
		gender.value = genderSelect.value;
	}
	// 중성화 hidden값 세팅
	function set_neutralization() {
		let neutralizationSelect  = document.getElementById("neutralizationSelect");
		let neutralization = document.getElementById("neutralization");
		
		neutralization.value = neutralizationSelect.value;
	}
	// 접종 hidden값 세팅
	function set_vacccination() {
		let vacccinationSelect  = document.getElementById("vacccinationSelect");
		let vacccination = document.getElementById("vacccination");
		
		vacccination.value = vacccinationSelect.value;
	}
	
	// 폼 유효성검사
	function onSubmit() {
		let name = document.getElementById("name");
		let age = document.getElementById("age");
		let species = document.getElementById("species");
		let breed = document.getElementById("breed");
		let gender = document.getElementById("gender");
		let neutralization = document.getElementById("neutralization");
		let vacccination = document.getElementById("vacccination");
		let enterDate = document.getElementById("enterDate");
		let protectEndDate = document.getElementById("protectEndDate");
		
		let numOnlyRegex = /^[0-9]+$/;
		
		if (!name.value) {
			alert("이름을 입력하세요. 보호소 내 동물끼리 구분해 주세요.");
			name.focus();
			return false;
		}
		
		if (!age.value) {
			alert("나이를 입력하세요.");
			age.focus();
			return false;
		}
		
		if (!species.value) {
			alert("동물 종을 입력하세요.");
			species.focus();
			return false;
		}
		
		if (!gender.value) {
			alert("성별을 입력하세요.");
			gender.focus();
			return false;
		}
		
		if (!neutralization.value) {
			alert("중성화 여부를 입력하세요.");
			neutralization.focus();
			return false;
		}
		
		if (!vacccination.value) {
			alert("접종 여부를 입력하세요.");
			vacccination.focus();
			return false;
		}
		
		if (!enterDate.value) {
			alert("보호소 입소일자를 입력하세요.");
			return false;
		}
		
		if (!protectEndDate.value) {
			alert("보호기간 종료일자를 입력하세요.");
			return false;
		}
		
	}
</script>
</head>
<body>
	<fmt:formatDate var="year" value="<%=new java.util.Date() %>" pattern="yyyy" />
	<div class="container">
		<h2>입양 동물 등록</h2>
		<hr>
		<form:form modelAttribute="animal" action="animalRegister" enctype="multipart/form-data" name="f" onsubmit="return onSubmit();">
			<div class="form-group col-lg-4 mt-5">
				<img src="../../../resources/images/profile_default_pic.png" name="profileDefaultPic" width="150" height="150">
				<br>
				프로필
			</div>
			<div>
				<a onclick="uploadPopup()">
					<button type="button" class="btn btn-info btn-sm">프로필 업로드</button>
				</a>
				<form:hidden path="profileFilename"/>
			</div>
			<spring:hasBindErrors name="animal">
				<font color="red">
	            	<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<form:hidden path="shelterNum" value="${loginUser.userNum }"/>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">이름</span>
				</div>
				<form:input path="name" class="form-control" />
				<small style="color: red;"><form:errors path="name" /></small>
			</div>

			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">(추정)나이</span>
				</div>
				<form:input path="age" class="form-control" />
				<small style="color: red;"><form:errors path="age" /></small>
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
				<small style="color: red;"><form:errors path="species" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">품종</span>
				</div>
				<form:input path="breed" class="form-control" />
				<small style="color: red;"><form:errors path="breed" /></small>
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
				</select>
				<small style="color: red;"><form:errors path="gender" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">중성화 여부</span>
				</div>
				<form:hidden path="neutralization"/>
				<select class="custom-select" id="neutralizationSelect" onchange="set_neutralization()">
					<option selected="selected"></option>
					<option value="0">중성화 X</option>
					<option value="1">중성화 O</option>
				</select>
				<small style="color: red;"><form:errors path="neutralization" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">접종 여부</span>
				</div>
				<form:hidden path="vacccination"/>
				<select class="custom-select" id="vacccinationSelect" onchange="set_vacccination()">
					<option selected="selected"></option>
					<option value="1">접종</option>
					<option value="0">미접종</option>
				</select>
				<small style="color: red;"><form:errors path="vacccination" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">보호소 입소 날짜</span>
				</div>
				<div>
					<form:hidden path="enterDate"/>
					<input type="text" class="form-control" id="enterDateStr" placeholder="연/월/일" disabled="disabled">
					<select class="custom-select" id="year1" onchange="set_enterDate()">
						<option selected="selected">연</option>
						<c:forEach var="i" begin="${year - 4 }" end="${year }">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<select class="custom-select" id="month1" onchange="set_enterDate()">
						<option selected="selected">월</option>
						<c:forEach var="i" begin="1" end="12">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<select class="custom-select" id="date1" onchange="set_enterDate()">
						<option selected="selected">일</option>
						<c:forEach var="i" begin="1" end="31">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<small style="color: red;"><form:errors path="enterDate" /></small>
				</div>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">보호기간 종료 일자</span>
				</div>
				<div>
					<form:hidden path="protectEndDate"/>
					<input type="text" class="form-control" id="protectEndDateStr" placeholder="연/월/일" disabled="disabled">
					<select class="custom-select" id="year2" onchange="set_protectEndDate()">
						<option selected="selected">연</option>
						<option value="${year }">${year }</option>
					</select>
					<select class="custom-select" id="month2" onchange="set_protectEndDate()">
						<option selected="selected">월</option>
						<c:forEach var="i" begin="1" end="12">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<select class="custom-select" id="date2" onchange="set_protectEndDate()">
						<option selected="selected">일</option>
						<c:forEach var="i" begin="1" end="31">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<small style="color: red;"><form:errors path="protectEndDate" /></small>
				</div>
			</div>
			<div>
				<button type="submit" class="btn btn-success mt-3" id="submit">등록하기</button>
			</div>
		</form:form>
	</div>
</body>
</html>