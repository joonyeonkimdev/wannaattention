<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%--
/***********************************************************************************
 * @JSP FileName : donateConfirm.jsp
 * @Description : 후원 신청 후 상세조회 페이지 ----(2)
 *
 * @author 이하영
 * @since 2022. 11. 16.
 * @version 1.0
 * << 개발이력 >>
 *
 *  수정일                           수정자                  수정내용
 *  ------------    --------    ---------------------------
 *  2022.11.16		이하영		최초생성
 *  2022.11.21		이하영		값받아서오기
***********************************************************************************/
--%>
<!DOCTYPE html>
<html>
<head>
<title>후원하기</title>
<meta charset="UTF-8">
<style type="text/css">
	.form-group {
		float: none;
		margin: 0 auto;
	}
	
	input[name=donorType]:hover {
		background : #000;
	}
</style>
<script src="/resources/assets/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> <!--import하려고 이부분추가함(221121) -->
<script src="/resources/assets/jquery.form.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="container">
	<h2>후원상세정보</h2>
	<hr>
	<section id="registDonate">
		<form:form modelAttribute="dVO" id="detailForm" name="detailForm" method="post" role="form">
		    <input type="hidden" name="donaType" value="${dVO.donaType}"/> 
		    <input type="hidden" name="donorType" value="${dVO.donorType}"/> 
		    <input type="hidden" name="donaAmount" value="${dVO.donaAmount}"/> 
		    <input type="hidden" name="donorName" value="${dVO.donorName}"/>
		    <input type="hidden" name="donorTel" value="${dVO.donorTel}"/>
		    <input type="hidden" name="donorEmail" value="${dVO.donorEmail}"/>
		    <input type="hidden" name="payMethod" value="${dVO.payMethod}"/>
		    <input type="hidden" name="bankName" value="${dVO.bankName}"/>
		    <input type="hidden" name="accountNum" value="${dVO.accountNum}"/>
		    <input type="hidden" name="depositorName" value="${dVO.depositorName}"/>
		    <input type="hidden" name="birthday" value="${dVO.birthday}"/>
		    <input type="hidden" name="withDate" value="${dVO.withDate}"/>
		    <input type="hidden" name="deductType" value="${dVO.deductType}"/>
		    <input type="hidden" name="deductNum" value="${dVO.deductNum}"/>
		    
		 <div class="form-group row">
		   <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원구분</strong></label>
		    <div class="col-md-5">
		    <c:if test="${dVO.donaType eq '1'}">
				정기후원
			</c:if>
			<c:if test="${dVO.donaType eq '2'}">
				일시후원
			</c:if>
		<%-- 	<c:if test="${dVO.donaType eq '3'}">
				후원증
			</c:if> --%> <!--  후원증액은 서비스 준비 -->	
		  </div>	
		</div><br> 
		<div class="form-group row">
            <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원자 구분</strong></label>
            <div class="col-md-5">
            <c:if test="${dVO.donorType eq '1'}">
				개인
			</c:if>
			<c:if test="${dVO.donorType eq '2'}">
				기업(단체)
			</c:if>
			</div>
	    </div><br>
	    <div class="form-group row">
			<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원금액</strong></label>
			<div class="col-md-5">
		    <c:out value="${dVO.donaAmount eq '' ? '-' : dVO.donaAmount}"/>
		    </div>
		 </div><br> 
		 <div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>이름/기업(단체명)</strong></label> 
		    <div class="col-md-5">
		    <c:out value="${dVO.donorName eq '' ? '익명' : dVO.donorName}"/>
		    </div>
		 </div><br>
		 <div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>연락처</strong></label>
		     <div class="col-md-5">
		    <c:out value="${dVO.donorTel eq '' ? '-' : dVO.donorTel}"/>
		    </div>
		 </div><br>
		 <div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>이메일</strong></label>
		    <div class="col-md-5">
		    <c:out value="${dVO.donorEmail eq '' ? '-' : dVO.donorEmail}"/>
		    </div>
		 </div><br>
		 <div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>결제수단</strong></label>
		    <div class="col-md-5">
		    <c:if test="${dVO.payMethod eq '1'}">
				자동이체
			</c:if>
			<c:if test="${dVO.payMethod eq '2'}">
				카카오페이
			</c:if>
			</div>
	     </div><br>
	     <div class="form-group row">
			<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>은행명</strong></label>
			<div class="col-md-5">
			 <c:if test="${dVO.bankName eq '국민은행'}">
				국민은행
			</c:if>
			<c:if test="${dVO.bankName eq '신한은행'}">
				신한은행
			</c:if>
			<c:if test="${dVO.bankName eq '카카오뱅크'}">
				카카오뱅크
			</c:if>
			</div>
		</div><br>
		<div class="form-group row">
			<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>계좌번호</strong></label>
			<div class="col-md-5">
		    <c:out value="${dVO.accountNum eq '' ? '-' : dVO.accountNum}"/>
		    </div>
		</div><br>
		<div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>예금주명</strong></label>
		    <div class="col-md-5">
		    <c:out value="${dVO.depositorName eq '' ? '-' : dVO.depositorName}"/>
		    </div>
		</div><br>
		<div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>생년월일</strong></label>
		    <div class="col-md-5">
		    <c:out value="${dVO.birthday eq '' ? '-' : dVO.birthday}"/>
		    </div>
		</div><br>
		<div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>출금일</strong></label>
		    <div class="col-md-5">
		    <c:out value="${dVO.withDate eq '' ? '-' : dVO.withDate}"/>
		    </div>
		</div><br>
		<div class="form-group row">
		    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>소득공제구분</strong></label>
		    <div class="col-md-5">
		    <c:if test="${dVO.deductType eq '1'}">
				개인
			</c:if>
			<c:if test="${dVO.deductType eq '2'}">
				사업자
			</c:if>
			</div>
		</div><br>
		<div class="form-group row">
			<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>소득공제번호</strong></label>
			<div class="col-md-5">
		    <c:out value="${dVO.deductNum eq '' ? '미신청' : dVO.deductNum}"/>
		    </div>
		</div><br>
		    
			<!--${dVO.donorEmail}--> <!-- 이렇게 쓸수도있음 -->
			 
	<!-- 	<c:out value="${dVO.donaType eq '1' ? '정기후원' : '일시후원'}"/>   --> <!-- 이렇게도 쓸수있음 -->
			
	
			<div>
				<button type="submit" class="btn btn-outline-secondary mt-3" onclick="fncPrevDisplay();return false;">이전</button>
				<button type="submit" class="btn btn-primary mt-3" onclick="fncRegist();return false;">신청완료</button>
			</div>
		</form:form>
	</section>
</div>
<script type="text/javascript"> 
function fncRegist() {
	
	if(confirm("신청 하시겠습니까?")) {
		$("#detailForm").ajaxSubmit({
			url : "<c:url value='insertDonate'/>",
			success:function(response) {
				if(response == "success") {
					alert("<spring:message code='confirm.regist.next.success'/>");
					location.href = "/";
				} else if(resposne == "error") {
					alert("<spring:message code='confirm.regist.next.fail'/>");
					return;
				}
			}, error : function(jqXHR, textStatus, errorThrown) {
				alert("<spring:message code='confirm.regist.next.error'/>");
				return;
			}
		});
	}
}
/* 뒤로가기 값 그대로 유지 #######수정해야됨######## */
function fncPrevDisplay() {
	location.href = "<c:url value='registDonate'/>";	
}

</script>
</body>
</html>