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
		if (num == "0") {
			document.getElementById("userType0").className = "btn btn-primary btn-sm";
			document.getElementById("userType1").className = "btn btn-secondary btn-sm";
			document.getElementById("birthdayDiv").style = "";
			document.getElementById("busiDiv").style = "display:none";
		} else {
			document.getElementById("userType0").className = "btn btn-secondary btn-sm";
			document.getElementById("userType1").className = "btn btn-primary btn-sm";
			document.getElementById("birthdayDiv").style = "display:none";
			document.getElementById("busiDiv").style = "";
			
		}
		document.f.userType.value = num;
	}
	
	// 프로필 업로드 팝업
	function uploadPopup() {
		let op = "width=300,height=300,left=50,top=150";
		open("tempUpload","",op);
	}
	
	// 아이디 중복확인 팝업
	function idDuplChk() {
		let op = "width=500,height=300,left=50,top=150";
		open("idDuplChk","",op);
	}
	
	// 생일 선택값 세팅
	function set_birthday(timepoint) {
		let year = document.getElementById("year");
		let month = document.getElementById("month");
		let date = document.getElementById("date");
		let birthdayStr = document.getElementById("birthdayStr");
		let birthday = document.getElementById("birthday");
		
		if (year.value && month.value && date.value) {
			if (year.value != "연" && month.value != "월" && date.value != "일" ) {
				birthdayStr.value = year.value + "/" + month.value + "/" + date.value;
				birthday.value = birthdayStr.value;
			}
		}
	}
	
	// 폼 유효성검사
	function onSubmit() {
		let userType = document.getElementById("userType");
		let id = document.getElementById("id");
		let pw = document.getElementById("pw");
		let pwCheck = document.getElementById("pwCheck");
		let name = document.getElementById("name");
		let nickname = document.getElementById("nickname");
		let birthday = document.getElementById("birthday");
		let emailId = document.getElementById("emailId");
		let emailDomain = document.getElementById("emailDomain");
		let phone = document.getElementById("phone");
		let tel = document.getElementById("tel");
		let postNum = document.getElementById("postNum");
		let address = document.getElementById("address");
		let busiNum = document.getElementById("busiNum");
		let termChk = document.getElementById("termChk");
		let privacyChk = document.getElementById("privacyChk");
		let shelterDesFile = document.getElementById("shelterDesFile");
		
		let pwRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
		let numOnlyRegex = /^[0-9]+$/; //숫자만 입력하는 정규식
		
		if (id.value == "") {
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		} else if (id.value.length < 5 || id.value.length > 15) {
			alert("아이디는 5~15자리를 사용해야 합니다.");
			id.value = "";
			id.focus();
			return false;
		}
		
		if (pw.value == "") {
			alert("비밀번호를 입력하세요.");
			pw.focus();
			return false;
		} else if (!pwRegex.test(pw.value)) {
			alert("비밀번호는 영문+숫자+특수문자 조합 8~25자리를 사용해야 합니다.");
			pw.value = "";
			pw.focus();
			return false;
		} else if (pw.value != pwCheck.value) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			pw.value = "";
			pwCheck.value = "";
			pw.focus();
			return false;
		}
		
		if (name.value == "") {
			alert("이름을 입력하세요.");
			name.focus();
			return false;
		}
		
		if (nickname.value == "") {
			alert("닉네임을 입력하세요.");
			nickname.focus();
			return false;
		}
		
		if (userType.value == "0") {
			if (birthday.value == "") {
				alert("생년월일을 선택하세요.");
				return false;
			}
		} else {
			birthday.value = new Date(null);
		}
		
		if (emailId.value == "") {
			alert("이메일 아이디를 입력하세요.");
			emailId.focus();
			return false;
		}
		
		if (emailDomain.value == "") {
			alert("이메일 도메인을 입력하세요.");
			emailDomain.focus();
			return false;
		}
		
		if (phone.value == "") {
			alert("휴대전화번호를 입력하세요.");
			phone.focus();
			return false;
		} else if (!numOnlyRegex.test(phone.value)) {
			alert("전화번호는 숫자만 입력해 주세요.");
			phone.value = "";
		    phone.focus();
		    return false;
		}
		
		if (tel.value == "") {
			alert("일반전화번호를 입력하세요.");
			tel.focus();
			return false;
		} else if (!numOnlyRegex.test(tel.value)) {
			alert("전화번호는 숫자만 입력해 주세요.");
			tel.value = "";
			tel.focus();
		    return false;
		}
		
		if (postNum.value == "") {
			alert("우편번호를 입력하세요.");
			postNum.focus();
			return false;
		} else if (!numOnlyRegex.test(postNum.value)) {
			alert("우편번호는 숫자만 입력해 주세요.");
			postNum.value = "";
			postNum.focus();
		    return false;
		}
		
		if (address.value == "") {
			alert("주소를 입력하세요.");
			address.focus();
			return false;
		}
		
		if (userType.value == "1") {
			if (busiNum.value == "") {
				alert("사업자 등록번호를 입력하세요.");
				busiNum.focus();
				return false;
			} else if (!numOnlyRegex.test(busiNum.value)) {
				alert("사업자 등록번호는 숫자만 입력해 주세요.");
				busiNum.value = "";
				busiNum.focus();
			    return false;
			}
			
			if (!shelterDesFile.value) {
				alert("사업자 등록증을 업로드 해주세요.");
			    return false;
			}
		}
		
		if (!termChk.checked) {
			alert("이용약관에 동의해 주세요.");
			termChk.focus();
			return false;
		} else if (!privacyChk.checked) {
			alert("개인정보 처리방침을 확인해 주세요.");
			privacyChk.focus();
			return false;
		}
		
		// 세팅안된 나머지 hidden값 set
 		let emailVal = $("#emailId").val() + "@" +$("#emailDomain").val();
 		$("#email").val(emailVal);
	}
</script>
</head>
<body>
	<div class="container">
		<h2>회원가입</h2>
		<hr>
		<form:form modelAttribute="user" action="join" enctype="multipart/form-data" name="f" onsubmit="return onSubmit();">
			<div>
				<button type="button" class="btn btn-primary btn-sm" id="userType0" onclick="pickUserType(0)">일반 회원</button>
				<button type="button" class="btn btn-secondary btn-sm" id="userType1" onclick="pickUserType(1)">보호소 회원</button>
			</div>
			<form:hidden path="userType" value="0"/>
			
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
			
			<spring:hasBindErrors name="user">
				<font color="red">
	            	<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			
			<div class="form-group col-lg-4 mt-3">
				<button type="button" class="btn btn-light btn-sm" style="float: left;" onclick="idDuplChk()">중복확인</button>
				<input type="text" class="form-control" id="idChosen" placeholder="아이디" disabled="disabled">
				<form:hidden path="id"/>
				<small style="color: red;"><form:errors path="id" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:password path="pw" class="form-control" placeholder="비밀번호" />
	   			<input type="password" id="pwCheck" class="form-control" placeholder="비밀번호 확인">
	   			<small style="color: red;"><form:errors path="pw" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="name" class="form-control" placeholder="이름" />
	   			<small style="color: red;"><form:errors path="name" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="nickname" class="form-control" placeholder="닉네임" />
	   			<small style="color: red;"><form:errors path="nickname" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3" id="birthdayDiv">
				<fmt:formatDate var="year" value="<%=new java.util.Date() %>" pattern="yyyy" />
				<fmt:parseNumber var="endYear" value="${year }" pattern="####"/>
				<div>
					<form:hidden path="birthday" value="0000/00/00"/>
					<input type="text" class="form-control" id="birthdayStr" placeholder="생년월일" disabled="disabled">
					<select class="custom-select" id="year" onchange="set_birthday()">
						<option selected="selected">연</option>
						<c:forEach var="i" begin="1900" end="${endYear }">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<select class="custom-select" id="month" onchange="set_birthday()">
						<option selected="selected">월</option>
						<c:forEach var="i" begin="1" end="12">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<select class="custom-select" id="date" onchange="set_birthday()">
						<option selected="selected">일</option>
						<c:forEach var="i" begin="1" end="31">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
					<small style="color: red;"><form:errors path="birthday" /></small>
				</div>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:hidden path="email"/>
				<input type="text" class="form-control" id="emailId" placeholder="이메일">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">@</span>
					</div>
					<select class="custom-select" id="emailDomain">
						<option selected value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
					</select>
				</div>
				<small style="color: red;"><form:errors path="email" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="phone" class="form-control" placeholder="휴대전화(숫자만 입력)" />
	   			<small style="color: red;"><form:errors path="phone" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="tel" class="form-control" placeholder="일반전화(숫자만 입력)" />
	   			<small style="color: red;"><form:errors path="tel" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="postNum" class="form-control" placeholder="우편번호(숫자만 입력)" />
	   			<small style="color: red;"><form:errors path="postNum" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3">
				<form:input path="address" class="form-control" placeholder="주소" />
	   			<small style="color: red;"><form:errors path="address" /></small>
			</div>
			<div class="form-group col-lg-4 mt-3" id="busiDiv" style="display:none;">
				<form:input path="busiNum" class="form-control" placeholder="사업자 등록번호" />
	   			<small style="color: red;"><form:errors path="busiNum" /></small>
	   			<br>
	   			[사업자 등록증 업로드]
				<input type="file" id="shelterDesFile" name="shelterDesFile" class="mt-2">
			</div>
			<div class="form-group form-check mt-3">
				<input type="checkbox" class="form-check-input" id="termChk">
				<label class="termCheck" for="term">이용약관 동의</label><br>
				<input type="checkbox" class="form-check-input" id="privacyChk">
				<label class="form-check-label" for="privacyChk">개인정보 처리방침 확인</label>
			</div>
			<div>
				<button type="submit" class="btn btn-primary mt-3" id="submit">가입하기</button>
			</div>
		</form:form>
	</div>
</body>
</html>