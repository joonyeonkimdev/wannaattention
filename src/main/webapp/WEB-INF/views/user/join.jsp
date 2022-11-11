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
<title>회원가입</title>
<style type="text/css">
	.form-group {
		float: none;
		margin: 0 auto;
	}
</style>
<script type="text/javascript">
	function pickUserType(num) {
		if (num == '0') {
			document.getElementById("userType0").className = "btn btn-primary btn-sm";
			document.getElementById("userType1").className = "btn btn-secondary btn-sm";
			document.getElementById("busiDiv").style = "display:none";
			document.getElementById("busiDocDiv").style = "display:none";
		} else {
			document.getElementById("userType0").className = "btn btn-secondary btn-sm";
			document.getElementById("userType1").className = "btn btn-primary btn-sm";
			document.getElementById("busiDiv").style = "";
			ocument.getElementById("busiDocDiv").style = "";
		}
		document.f.userType.value = num;
	}
	
	
</script>
</head>
<body>
	<div class="container">
		<h2>회원가입</h2>
		<hr>
		<form:form modelAttribute="user" action="join" enctype="multipart/form-data" name="f">
			<spring:hasBindErrors name="user">
				<font color="red">
	            	<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<div>
				<button type="button" class="btn btn-primary btn-sm" id="userType0" onclick="pickUserType(0)">일반 회원</button>
				<button type="button" class="btn btn-secondary btn-sm" id="userType1" onclick="pickUserType(1)">보호소 회원</button>
			</div>
			<form:hidden path="userType" value="0"/>
			
			<div class="form-group col-lg-4 mt-5">
				<img alt="" src="../../../resources/images/profile_default_pic.png" width="150" height="150">
				<br>
				프로필
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="file" name="profileFile" class="mt-2">
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="id" class="form-control" placeholder="아이디" />
	   			<font color="red"><form:errors path="id" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:password path="pw" class="form-control" placeholder="비밀번호" />
	   			<font color="red"><form:errors path="pw" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="name" class="form-control" placeholder="이름" />
	   			<font color="red"><form:errors path="name" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="nickname" class="form-control" placeholder="닉네임" />
	   			<font color="red"><form:errors path="nickname" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<fmt:formatDate var="year" value="<%=new java.util.Date()%>" pattern="yyyy" />
				<fmt:parseNumber var="endYear" value="${year }" pattern="####"/>
				<div>
					<form:input path="birthday" class="form-control" placeholder="생년월일" readonly="readonly"/>
	   				<font color="red"><form:errors path="birthday" /></font>
					<select class="custom-select" id="year">
						<option selected="selected">연</option>
						<c:forEach var="i" begin="1900" end="${endYear }">
							<option>${i }</option>
						</c:forEach>
					</select>
					<select class="custom-select" id="month">
						<option selected="selected">월</option>
						<c:forEach var="i" begin="1" end="12">
							<option>${i }</option>
						</c:forEach>
					</select>
					<select class="custom-select" id="date">
						<option selected="selected">일</option>
						<c:forEach var="i" begin="1" end="31">
							<option>${i }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:hidden path="email" class="form-control" placeholder="이메일" />
				<input type="text" class="form-control" id="emailId" placeholder="이메일">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">@</span>
					</div>
					<select class="custom-select" id="emailDomain">
						<option selected>gmail.com</option>
						<option value="1">naver.com</option>
						<option value="2">daum.net</option>
						<option value="3">nate.com</option>
					</select>
				</div>
				<font color="red"><form:errors path="email" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="phone" class="form-control" placeholder="휴대전화(숫자만 입력)" />
	   			<font color="red"><form:errors path="phone" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="tel" class="form-control" placeholder="일반전화(숫자만 입력)" />
	   			<font color="red"><form:errors path="tel" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="postNum" class="form-control" placeholder="우편번호(숫자만 입력)" />
	   			<font color="red"><form:errors path="postNum" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="address" class="form-control" placeholder="주소" />
	   			<font color="red"><form:errors path="address" /></font>
			</div>
			<div class="form-group col-lg-4 mt-3" id="busiDiv" style="display:none;">
				<form:input path="busiNum" class="form-control" placeholder="사업자 등록번호" />
	   			<font color="red"><form:errors path="busiNum" /></font>
	   			<br>
	   			[사업자 등록증 업로드]
				<input type="file" name="shelterDesFile" class="mt-2">
			</div>
			<div class="form-group form-check mt-3">
				<input type="checkbox" class="form-check-input" id="termCheck" onclick="checkChk()">
				<label class="termCheck" for="termCheck">이용약관 동의</label>
			</div>
			<div>
				<button type="submit" class="btn btn-primary mt-3" id="submit">가입하기</button>
			</div>
		</form:form>
	</div>
</body>
</html>