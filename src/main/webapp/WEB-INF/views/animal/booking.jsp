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
<title>입양 방문 예약</title>
<script type="text/javascript">
	function set_bookingDate() {
		let bookingDateSelect = document.getElementById("bookingDateSelect");
		let bookingDate = document.getElementById("bookingDate");
		bookingDate.value = bookingDateSelect.value;
	}
	
	function onSubmit() {
		let bookingDateSelect = document.getElementById("bookingDateSelect");
		let bookingDate = document.getElementById("bookingDate");
		
		if (!bookingDate.value) {
			alert("방문일자를 선택하세요.");
			bookingDate.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2>입양 방문 예약</h2>
		<hr>
		<div>
			<form:form modelAttribute="booking" action="booking"  name="f" onsubmit="return onSubmit();">
				<spring:hasBindErrors name="user">
					<font color="red">
		            	<c:forEach items="${errors.globalErrors }" var="error">
							<spring:message code="${error.code}" />
						</c:forEach>
					</font>
				</spring:hasBindErrors>
				
				<form:hidden path="bookerNum" value="${loginUser.userNum }"/>
				<form:hidden path="shelterNum" value="${animal.shelterNum }"/>
				<form:hidden path="animalNum" value="${animal.animalNum }"/>
				
				<div class="col-4 mt-5"></div>
				<div class="form-group col-lg-4 mt-4">
					<h5>[ 방문일자 ]</h5>
					<form:hidden path="bookingDate"/>
					<input type="date" id="bookingDateSelect" onchange="set_bookingDate()">
		   			<small style="color: red;"><form:errors path="bookingDate" /></small>
				</div>
				<div>
					<button type="submit" class="btn btn-primary mt-3" id="submit">예약하기</button>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>