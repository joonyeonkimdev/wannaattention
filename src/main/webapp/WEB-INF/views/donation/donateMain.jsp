<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%--
/***********************************************************************************
 * @JSP FileName : donateMain.jsp
 * @Description : 후원하기 신청페이지 (후원하기 메뉴 메인화면) ----(1)
 *
 * @author 이하영
 * @since 2022. 11. 14.
 * @version 1.0
 * << 개발이력 >>
 *
 *  수정일            수정자                  내용
 *  ------------    --------    ---------------------------
 *  2022.11.14		이하영		최초생성
 *  2022.11.15
 *  2022.11.16
 *  2022.11.17
 *  2022.11.18
 *  2022.11.19
 *  2022.11.20
 *  2022.11.21                 db에는 값은 들어감 결제관련 필요값만 받는걸로 해둠
                              (import로 자동이체 실시간이체 신용카드 부분 추후처리)
                               후원증액 부분은 준비중 경고창으로 처리(기능적부분 미완)
 *  2022.11.21      이주영      카카오페이                              
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
	
	/* 직접입력의 이메일이 아닌경우 readonly 하면 색상이 어두워져서 변경 (221120) */
	input[id="emailDomain"]:read-only {
		background-color : #fff;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- (import위해서 넣음) -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> <!-- (import위해서 넣음) -->
<script type="text/javascript">
//###################################### 카카오페이 #################################
//문서가 준비되면 제일 먼저 실행
$(document).ready(function(){

})


/* ######### 공통 validation 체크 #########*/
// 01. 숫자만 입력 가능
function fn_onlyNum(num){
	var regExp = /^[0-9]*$/;
	if(!regExp.test(num)){
	  alert("<spring:message code='error.only.input.number'/>");
	  return false;
	}
	return true;
}

// 02. 이메일 형식 체크
function email_check(email) {
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return reg.test(email);
}

// 03. 하이픈 제거하기 keyup function (221120)
function inputUnAutoHypen(obj) {
	obj.value = unAutoHypenPhone(obj.value);
}
/* ############################################ */

/* ######### 이메일 셀렉트 박스 제어 #########*/
function control(txt) {
	$("#emailDomain").val(txt.value);
}
/* ############################################ */

/* ######### 공통 천단위 자동 콤마 찍기 function #########*/
// 01. 천단위 콤마 찍기
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

// 01-1. 콤마 찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 01-2. 콤마 제거
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
/* ############################################ */

/* ######### 공통 연락처 자동 하이픈 찍기 function #########*/
// 01. 연락처 자릿수 만큼 하이픈 찍기
function inputTelFormat(obj) {
	obj.value = autoHypenPhone(obj.value);
}

// 01-1. 하이픈 찍기
function autoHypenPhone(str){
	
	str = str.toString().replace(/[^0-9]/g, '');
  
	var tmp = '';
  
	if(str.length < 4){
		// 4자리 미만일떄
		return str;
	} else if(str.length < 7){
		// 7자리 미만일때
		tmp += str.substr(0, 3);
		tmp += '-';
  		tmp += str.substr(3);
  		return tmp;
	} else if(str.length < 11){
		// 11자리 미만일때
  		tmp += str.substr(0, 3);
  		tmp += '-';
  		tmp += str.substr(3, 3);
  		tmp += '-';
  		tmp += str.substr(6);
  		return tmp;
	} else {
		// 외국번호 같은 경우
  		tmp += str.substr(0, 3);
  		tmp += '-';
  		tmp += str.substr(3, 4);
  		tmp += '-';
  		tmp += str.substr(7);
  		return tmp;
	}
	return str;
}

// 01-2. 하이픈 제거
function unAutoHypenPhone(str) {
	str = String(str);
	return str.replace(/-/g, '');
}

//후원증액 준비중으로 경고창띄우기
function btn1(){
    alert('서비스 준비중입니다');
}

//실시간 계좌이체 준비중으로 경고창띄우기
function btn2(){
    alert('서비스 준비중입니다');
}
// #############################################

// 신용카드 결제일 결제날짜 hidden input value _ 어떻게 결제일 처리해야될지 우선 주석처리 (221120)
// window.onload = function() {
//	var td = new Date();                //오늘 날짜
//	var yyyy = td.getFullYear();        //년도  
//	var mm = "" + (td.getMonth()+1);    //월
//	var dd = "" + td.getDate();         //일 
//	
//	if(mm.length < 2) mm = "0" + mm;
//	if(dd.length < 2) dd = "0" + dd;
//	
//	var Today = yyyy.toString() + mm + dd; 
//	
//	document.getElementById(cardPayDate).value = Today;
//}
</script>
</head>
<body>
<div class="container">
	<h2 style="font-weight: bold;">후원하기</h2>
	<hr>
	<section id="registDonate">
		<form:form modelAttribute="donationVO" id="donateForm" name="donateForm" method="post" role="form" enctype="multipart/form-data">

<!-- 후원구분 선택 (정기 / 일시 / 후원증액) 시작 { -->
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원구분</strong></label>
				<div class="col-md-10">
					<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						<label class="col-3 btn btn-light">
							<input type="radio" name="donaType" id="donaType1" value="1">정기후원
						</label>
						<label class="col-3 btn btn-light">
							<input type="radio" name="donaType" id="donaType2" value="2">일시후원
						</label>
						<label class="col-3 btn btn-light">
							<input type="radio" name="donaType" id="donaType3" value="3" onclick="javascript:btn1()">후원 증액
						</label>
					</div>
				</div>
			</div><br>
<!-- } 후원구분 선택 (정기 / 일시 / 후원증액) 종료 -->

<!-- 후원자구분 선택 (개인 / 기업(단체)) 시작 { -->
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원자 구분</strong></label>
				<div class="col-md-10">
					<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						<label class="col-5 btn btn-light">
							<input type="radio" name="donorType" id="donorType1" value="1">개인
						</label>
						<label class="col-5 btn btn-light">
							<input type="radio" name="donorType" id="donorType2" value="2">기업/단체
						</label>
					</div>
				</div>
			</div><br>
<!-- } 후원자구분 선택 (개인 / 기업(단체)) 종료 -->

<!-- 후원금액 선택 시작 { -->
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원금액</strong></label>
				<div class="col-md-10">
					<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						<label class="col-2 btn btn-light donaAmount">
							<input type="radio" name="donaAmount" id="donaAmount1" value="10000">10,000
						</label>
						<label class="col-2 btn btn-light donaAmount">
							<input type="radio" name="donaAmount" id="donaAmount2" value="30000">30,000
						</label>
						<label class="col-2 btn btn-light donaAmount">
							<input type="radio" name="donaAmount" id="donaAmount3" value="50000">50,000
						</label>
						<label class="col-3 btn" for="amountLabel">
							<input type="text" id="amountLabel" name="donaAmount" placeholder="직접입력" class="form-control" onkeyup="inputNumberFormat(this)"/>
						</label> 
					</div> 
				</div>
			</div>
			<hr class="col-md-10 text-center" style="background-color: #28a745;">
<!-- } 후원금액 선택 종료 -->
			
<!-- 후원자구분 선택시 보여지는 view 시작 { -->
			<!-- 01. 개인 정보 입력 -->
			<input type="hidden" name="donorName" value=""/>
			<div align="left" id="personalDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>이름</strong></label>
					<div class="col-sm-5">
						<input type="text" maxlength="150" id="psDonorName" placeholder="이름을 입력하세요" class="form-control"/>
					</div>
					<div class="col-sm-5">
						<div class="form-check">
						    <input type="checkbox" class="form-check-input" id="noNameChkBox1">
						    <label class="form-check-label" for="noNameChkBox1"><font color="red">익명기부가 가능합니다</font></label> 
					  	</div>
					</div>
				</div>
			</div>
			<!-- 02. 기업(단체) 정보 입력 -->
			<div align="left" id="allDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>기업(단체)명</strong></label>
					<div class="col-sm-5">
						<input type="text" maxlength="150" id="allDonorName"  placeholder="기업(단체)명을 입력하세요" class="form-control"/>
					</div>
					<div class="col-sm-5">
						<div class="form-check">
						 	<input type="checkbox" class="form-check-input" id="noNameChkBox2">
						    <label class="form-check-label" for="noNameChkBox2"><font color="red">익명기부가 가능합니다</font></label> 
						</div>
					</div>
				</div>
			</div><br>
			<!-- 03. 연락처 입력 (개인, 단체 공통사용) -->
			<input type="hidden" name="donorTel" value=""/>
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>연락처</strong></label>
				<div class="col-md-5">
					<input type="text"  id="donorTelNum" placeholder="연락처를 입력하세요" class="form-control" onkeyup="inputTelFormat(this)"/>
				</div>
			</div><br>
			<!-- 04. 이메일 입력 (개인, 단체 공통사용) -->
			<div class="form-group row">
				<input type="hidden" name="donorEmail" value=""/>
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>이메일</strong></label>
				<div class="col-md-8">
					<div class="input-group">
						<input type="text" maxlength="100" id="emailId" class="form-control"  value="">&nbsp; 
					 	<div class="input-group-prepend">
					 		@
					 	</div>&nbsp; 
					 	<input type="text" id="emailDomain" class="form-control" placeholder="naver.com" value="">&nbsp; 
					 	<select class="form-control" id="selectEmail" onchange="javascript:control(this)">
					 		<option value="" selected="selected">직접입력</option>
						    <option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="empas.com">empas.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="korea.com">korea.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmir.com">hanmir.com</option>
		 					<option value="paran.com">paran.com</option>
					 	</select>
					</div>
				</div>
			</div><br>
			<hr class="col-md-10 text-center" style="background-color: #28a745;">
<!-- } 후원자구분 선택시 보여지는 view 종료 -->
			
			<!--  
			<div align="left" id="addPayDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>은행명</strong></label>
					  <div class="col-10">
					    <div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						    <label class="col-2 btn btn-light bankName">
							  <input type="text" name="bankName" id="bankName1" value="우리은행">우리은행
						    </label>
						  
				        </div>
				      </div>
				 </div>
			 </div><br>
			 -->
	 
<!-- 후원구분 선택에 따른 결제수단 view 시작 { -->
			<!-- case1. 정기후원 및 후원증액 선택 정기이체부분 값만db에 받고 나중에 import로 정기이체하는 부분 할것 (현재로는 기능적인 부분은 미완료)-->
			<div align="left" id="regAndPlusDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>결제수단</strong></label>
					<div class="col-10">
						<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
							<label class="col-5 btn btn-light">
								<input type="radio" name="payMethod" id="payMethod1" value="1">자동이체 
							</label>
							<label class="col-5 btn btn-light">
								<input type="radio" name="payMethod" id="payMethod2" value="2">카카오페이 
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- case2. 일시후원 선택 -->
			<div align="left" id="tempDiv" class="tab-content">
				<div class="form-group row">
	             	<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>결제수단</strong></label>
	             	<div class="col-10">
	             		<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
	             			<label class="col-5 btn btn-light">
							   <input type="radio" name="payMethod" id="payMethod3" value="3" onclick="javascript:btn2()" >실시간 계좌이체  
							</label>
							<label class="col-5 btn btn-light">
							   <input type="radio" name="payMethod" id="payMethod4" value="2">카카오페이 
							</label>
	             		</div>
	             	</div>
				</div>
			</div><br>
			
			<input type="hidden" name="birthday" value=""/>	 <!-- 자동이체 생년월일, 신용카드 생년월일 구분하여 value 세팅 위함 (221120) -->
			<!-- case1-1. 결제방법 - 자동이체 시작 { -->
			<div align="left" id="autoPayDiv" class="tab-content">
				<!-- case1-1-1. 자동이체 - 은행선택 -->
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>은행명</strong></label>
					<div class="col-10">
				    	<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						    
						    <label class="col-3 btn btn-light donaAmount">
							  <input type="radio" name="bankName" id="bankName1" value="국민은행">국민은행
						    </label>
						    <label class="col-3 btn btn-light donaAmount">
							  <input type="radio" name="bankName" id="bankName2" value="신한은행">신한은행
						    </label>
						    <label class="col-3 btn btn-light donaAmount">
							  <input type="radio" name="bankName" id="bankName3" value="카카오뱅크">카카오뱅크
						    </label>
						   
			        	</div>
			      	</div>
				</div><br>
				<!-- case1-1-2. 자동이체 - 계좌번호 -->
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>계좌번호</strong></label>
					<div class="col-md-5">
						<input type="text" name="accountNum" id="accountNum" placeholder="-없이 숫자만 입력하세요" class="form-control" maxlength="16" onKeyup="inputUnAutoHypen(this)"/>
					</div>
				</div><br>
				<!-- case1-1-3. 자동이체 - 예금주명 -->
				<div class="form-group row">
				  	<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>예금주명</strong></label>
					<div class="col-sm-5">
					  <input type="text" maxlength="150" name="depositorName" id="depositorName" value="" placeholder="예금주명을 입력하세요" maxlength="50" class="form-control"/>
					</div>
				</div><br>
				<!-- case1-1-4. 자동이체 - 생년월일 -->
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>생년월일</strong></label>
					<div class="col-md-5">
						<input type="text" id="birthday" placeholder="-없이 주민등록앞 6자리를 입력하세요" class="form-control" maxlength="6" onKeyup="inputUnAutoHypen(this)"/>
					</div>
				</div><br>
				<!-- case1-1-5. 자동이체 - 출금일 선택 -->
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>출금일</strong></label>
					<div class="col-md-10">
						<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
							<label class="col-3 btn btn-light withDate">
								<input type="radio" name="withDate" id="withDate1" value="5">5일
							</label>
							<label class="col-3 btn btn-light withDate">
								<input type="radio" name="withDate" id="withDate2" value="15">15일
							</label>
							<label class="col-4 btn btn-light withDate">
								<input type="radio" name="withDate" id="withDate3" value="25">25일
							</label>
						</div> 
					</div>
				</div><br>
				<!-- case1-1-6. 자동이체 - 소득공제 구분 선택 -->
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>소득공제구분</strong></label>
					<div class="col-10">
					<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						<label class="col-5 btn btn-light">
							<input type="radio" name="deductType" id="deductType1" value="1">개인 
						</label>
						<label class="col-5 btn btn-light">
							<input type="radio" name="deductType" id="deductType2" value="2">사업자
						</label>
					</div>
					</div>
				</div><br>
				<!-- case1-1-7. 자동이체 - 소득공제번호 -->
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>소득공제번호</strong></label>
					<div class="col-md-5">
						<input type="text"  id="deductNum" name="deductNum" placeholder="-없이 숫자만 입력하세요" class="form-control" maxlength="16" onKeyup="inputUnAutoHypen(this)"/>
					</div>
					<div class="col-sm-5">
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="deductNumChekbox">
							<label class="form-check-label" for="deductNumChekbox"><font color ="red">미신청</font></label>
						</div>
					</div>
				</div><br>
			</div> <!-- } case1-1. 결제방법 - 자동이체 종료 -->
			
			<!-- case1-2. 결제방법 - 신용카드 시작 { -->
			<div align="left" id="creditDiv" class="tab-content">
				<!-- case1-2-1. 신용카드 - 카드명 선택 -->
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-left border-right"><strong>&nbsp;</strong></label>
					<div class="col-10">
				    	<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
					   <!-- <label class="col-10 btn btn-light kakaoPay">
							  <input type="radio" name="iamportPayment" id="iamportPayment" value="">결제
						    </label> --> <!-- radio여서 안되나 해서 변경하려고 주석처리함 221121 -->
						 <div>
                            <button id="iamportPayment" class="col-sm-10 type="button">결제</button>
                         </div>
						    
			        	</div>
			      	</div>
				</div>
			 </div><br>
			 
			<div>
				<button type="submit" class="btn btn-primary mt-3" id="goDonateBtn" onclick="fncRegist();return false;">다음</button>
			</div>
		</form:form>
	</section>
</div>
<script type="text/javascript">
	// 데이터 null 체크
	var isEmpty = function(data){
		if(typeof(data) === 'object'){
			if(JSON.stringify(data) === '{}' || JSON.stringify(data) === '[]'){
				return true;
			} else if(!data){
				return true;
			}
			return false;
		} else if (typeof(data) === 'string'){
			if(!data.trim()){
				return true;
			}
			return false;
		} else if (typeof(data) === 'undefined'){
			return true;
		} else{
			return false;
		}
	}
	
	// 특수문자 방지 체크
	function removeSpecialChar(event) {
		var reg = /^[가-힣a-zA-Z\s.,!()_0-9]+$/gi;
		
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else if(reg.test(event.target.value))
			//console.log("특수문자X");
			event.target.value = event.target.value.substring(0, event.target.value.length - 1);
	}
	
	// 바로실행
	$(document).ready(function() {
		$("#iamportPayment").click(function(){
			payment(); //버튼 클릭하면 호출		
		});
	
		
		/* ###################### 개인 / 단체 구분하기  ###################### */
		$("#personalDiv").show();
		$("#allDiv").hide();
		
		$('input[name="donorType"]').click(function () {
	          
	          var donorTypeVal = $('input[name="donorType"]:checked').val();
	          // console.log(donorTypeVal);
	          
	          if(!isEmpty(donorTypeVal)) {
	        	  if(donorTypeVal == '1') {
	        		  $("#personalDiv").show();
	        		  $("#allDiv").hide();
	        	  } else if(donorTypeVal == '2') {
	        		  $("#allDiv").show();
	        		  $("#personalDiv").hide();
	        	  } else {
	        		  $("#personalDiv").show();
	        	  }
	          }
		});
		/* ########################################################### */
		
		/* ###################### 직접입력에 focus가 간 경우에 기존 후원금액 선택한거 해제하기 (value 처리 포함) ###################### */
		var dAmountInput = $("#amountLabel");
		
		// 01. Input에 focus가 맞춰진 경우
		dAmountInput.focus(function(){
			$('label.donaAmount').removeClass('active');
			$('label.donaAmount').prop("disabled",true);
		});
		
		if($("label.donaAmount").hasClass("active") === true) {
			dAmountInput.blur();
			dAmountInput.val("");
		} 
		
		// 02. 직접입력을 하고 금액을 선택한경우 직접입력값 초기화
		if(!isEmpty(dAmountInput)) {
			$('input[name="donaAmount"]').click(function () {
				dAmountInput.val("");
			});
		}
		/* ######################################################################################################## */
		
		/* ###################### 익명기부 선택에 따른 이름 입력부분 focus ###################### */
		// 01. 개인 이름 작성할경우
		var noNameChkYn1 = $("#noNameChkBox1");	
		
	  	noNameChkYn1.on('change', function() {
	  		 if($(this).is(':checked')) { // 체크박스 선택
	  			$("#psDonorName").attr("readonly",true);
	  			$("#psDonorName").val("");
	  		 } else {	// 체크박스 선택해제
	  			 $("#psDonorName").attr("readonly",false);
	  		 }
	  	});
	  	
	  	// 02. 기업/단체명 작성할 경우
	  	var noNameChkYn2 = $("#noNameChkBox2");
	  	
	  	noNameChkYn2.on('change', function() {
	  		if($(this).is(':checked')) { // 체크박스 선택
	  			$("#allDonorName").attr("readonly",true);
	  			$("#allDonorName").val("");
	  		 } else {	// 체크박스 선택해제
	  			 $("#allDonorName").attr("readonly",false);
	  		 }
	  	});
		/* ######################################################################### */
		
	  	/* ###################### 후원타입 구분하기 (정기&증액, 일시)  ###################### */
	  	$("#regAndPlusDiv").show();
		$("#tempDiv").hide();
		
		// 후원증액 별도 추가 _ 우선 주석처리 (221120) -> 후액증액 경고창으로 처리
		// $("#addPayDiv").hide();
		
		$('input[name="donaType"]').click(function () {
			
			var donaTypeVal = $('input[name="donaType"]:checked').val();
			
			if(!isEmpty(donaTypeVal)) {
				// 후원증액 별도 추가로 조건 처리 변경 _ 221120
        	  	if(donaTypeVal == '1') {			// 정기후원
        		  	$("#regAndPlusDiv").show();
        		  	$("#tempDiv").hide();
        		 	// $("#addPayDiv").hide();		// => 우선 주석처리
        	  	} else if(donaTypeVal == '2') {		// 일시후원
       		 	 	$("#tempDiv").show();
        	  		// $("#addPayDiv").hide();		// => 우선 주석처리
        		  	$("#regAndPlusDiv").hide();
        	  	} else if(donaTypeVal == '3') {		// 후원증액
        	  		$("#regAndPlusDiv").show();
        	  		// $("#addPayDiv").show();		// => 우선 주석처리
        	  	} else {
        		  	$("#regAndPlusDiv").show(); // default
        	  	}
          	}
		});
		
	  	/* ######################################################################### */
	  	
		/* 정기-자동이체/신용카드 구분하기 */
		$("#autoPayDiv").show();
		$("#creditDiv").hide();
		
		$('input[name="payMethod"]').click(function () {
	          
	          var payMethodVal = $('input[name="payMethod"]:checked').val();
	          
	          if(!isEmpty(payMethodVal)) {
	        	  if(payMethodVal == '1') {
	        		  $("#autoPayDiv").show();
	        		  $("#creditDiv").hide();
	        	  } else if(payMethodVal == '2') {
	        		  $("#creditDiv").show();
	        		  $("#autoPayDiv").hide();
	        	  } else {
	        	  }
	          }
		});
		
		/* 이메일 직접입력이 아닌경우 수정 못하도록 조건 추가 (221120) */
		$('#selectEmail').on('change', function() {
			if($(this).find(":checked").val() != "") {
				$("#emailDomain").attr("readonly",true);
			} else {
				$("#emailDomain").attr("readonly",false);
			}
		});
		
		/* 소득공제 미신청 체크시 소득공제번호 비활성화 (221120) */
		var deductNumChkYn = $("#deductNumChekbox");	
		
		deductNumChkYn.on('change', function() {
	  		if($(this).is(':checked')) { // 체크박스 선택
	  			$("#deductNum").attr("readonly",true);
	  			$("#deductNum").val("");
	  			$('#deductType').removeClass('active');
	  			$('#deductType').prop("disabled",true);
	  		 } else {	// 체크박스 선택해제
	  			 $("#deductNum").attr("readonly",false);
	  		 }
	  	});
		if($("#deductType").hasClass("active") === true) {
				$("#deductType").blur();
				$("#deductType").val("");
			}
	});
	
	
	// 후원신청하기
	function fncRegist() {
		
		// 01. 후원구분 validation 체크
		var donaTypeChkYn = $('input[name=donaType]:checked').val();
		if(isEmpty(donaTypeChkYn)) {
			alert("<spring:message code='donate.error.donaType'/>");
			return;
		} // 01
		
		// 02. 후원자구분을 validation 체크
		var donorTypeChkYn = $('input[name=donorType]:checked').val();
		if(isEmpty(donorTypeChkYn)) {
			alert("<spring:message code='donate.error.donarType'/>")
			return;
		} // 02
		
		// 03. 후원금액 validation 체크  (직접입력 하는경우 -> 체크하지 않음, 직접입력 하지 않는 경우 -> 체크함)
		var donaAmountChkYn = $('input[name=donaAmount]:checked').val();
		var amountLabelYn = $("#amountLabel").val();
		if(isEmpty(amountLabelYn)) {
			if(isEmpty(donaAmountChkYn)) {
				alert("<spring:message code='donate.error.select.donaAmount'/>");
				return;
			}
		} 
		
		if(!isEmpty(amountLabelYn)) {
			fn_onlyNum(uncomma(amountLabelYn));
			
			if(parseInt(uncomma(amountLabelYn)) < parseInt("10000")) {
				alert("<spring:message code='donate.error.minimum.donaAmount'/>");
				return;
			}
		} // 03
		
		// 04. 이름 validation 체크
		var noNameChkYn1 = $("#noNameChkBox1");			// 개인 익명 체크	
		var noNameChkYn2 = $("#noNameChkBox2");			// 단체 익명 체크
		
		var psDonorName = $("#psDonorName").val();		// 개인 이름
	  	var allDonorName = $("#allDonorName").val();	// 단체명
	  	
	  	// 04-1. 개인정보 입력시
	  	if($("#personalDiv").is(":visible")) {
		  	if(noNameChkYn1.is(":checked") == false) {
		  		if(isEmpty(psDonorName)) {
	  				alert("<spring:message code='donate.error.personal.donorName'/>");
	  				return;
	  			 }
		  	}
	  	}
	  	
	  	// 04-2. 기업(단체)정보 입력시
	  	if($("#allDiv").is(":visible")) {
		  	if(noNameChkYn2.is(":checked") == false) {
		  		if(isEmpty(allDonorName)) {
	  				alert("<spring:message code='donate.error.all.donorName'/>");
	  				return;
	  			}
		  	}
	  	} // 04
	  	
		
		// 05. 연락처 validation 체크
		var donorTelNumYn = $("#donorTelNum").val();
		
		if(isEmpty(donorTelNumYn)) {
			alert("<spring:message code='donate.error.donorTelNum'/>");
			return;
		}
		
		if(!isEmpty(donorTelNumYn)) {
			fn_onlyNum(unAutoHypenPhone(donorTelNumYn));
		} // 05
		
		// 06. 이메일 validation 체크
		var emailId = $("#emailId").val();
		var emailDomain = $("#emailDomain").val();
		
		if(isEmpty(emailId) || isEmpty(emailDomain)) {
			alert("<spring:message code='donate.error.donorEmail'/>");
			return;
		} 
		
		if(!isEmpty(emailId) && !isEmpty(emailDomain)) {
			$('input[name=donorEmail]').val(emailId + "@" + emailDomain); 
		}
		
		var donorEmailYn = $('input[name=donorEmail]').val();
		if(!isEmpty(donorEmailYn)) {
			if(!email_check(donorEmailYn)) {
				alert("<spring:message code='donate.error.donorEmail.form'/>");
				return;
			}
		} // 06
		
		// 07. 결제수단 validation 체크
		var payMethodChkYn = $('input[name=payMethod]:checked').val();
		
		if(isEmpty(payMethodChkYn)) {
			alert("<spring:message code='donate.error.payMethod'/>")
			return;
		} // 07
		
// 자동이체가 선택된 경우에만 validation 체크할것 (221120)
		if($("#autoPayDiv").is(":visible")) {
			// 08. 은행명 validation 체크
			var bankNameChkYn = $('input[name=bankName]:checked').val();
			
			if(isEmpty(bankNameChkYn)) {
				alert("<spring:message code='donate.error.bankName'/>")
				return;
			} // 08
			
			// 09. 계좌번호 validation 체크
			var accountNumYn = $("#accountNum").val();
			
			if(isEmpty(accountNumYn)) {
				alert("<spring:message code='donate.error.accountNum'/>");
				return;
			} // 09
			
			// 10. 예금주명 validation 체크
			var depositorNameYn = $("#depositorName").val();
			
			if(isEmpty(depositorNameYn)) {
				alert("<spring:message code='donate.error.depositorName'/>");
				return;
			} //10
			
			// 11. 생년월일 validation 체크
			var birthdayYn = $("#birthday").val();
			
			if(isEmpty(birthdayYn)) {
				alert("<spring:message code='donate.error.birthday'/>");
				return;
			} // 11
			
			// 12. 출금일 validation 체크
			var withDateChkYn = $('input[name=withDate]:checked').val();
			
			if(isEmpty(withDateChkYn)) {
				alert("<spring:message code='donate.error.withDate'/>")
				return;
			}
			
			
			// 14. 소득공제 구분, 번호 validation 체크 (221120)
			var deductNumChkYn = $("#deductNumChekbox");	// 미신청 체크박스
			var deductNum = $("#deductNum").val();			// 소득공제번호	 
			var deductTypeChkYn = $('input[name=deductType]:checked').val();
			
			if(deductNumChkYn.is(":checked") == false) {
				if(isEmpty(deductNum)) {
					alert("<spring:message code='donate.error.deductNum'/>");
	  				return;
				}
				if(isEmpty(deductTypeChkYn)) {
					alert("<spring:message code='donate.error.deductType'/>")
					return;
				} 	
			} // 14
			
		}
		
		// 01. 후원금액 , 제거하고 세팅하여 데이터 전송
		$("#amountLabel").val(uncomma($("#amountLabel").val()));
		// 02. 이름은 개인 view, 단체 view에 따라 별도 데이터 전송
		if($("#personalDiv").is(":visible")) {
			if(noNameChkYn1.is(":checked") == false) {
				$('input[name=donorName]').val(psDonorName);		// 개인 view인 경우 이름
			} else {
				$('input[name=donorName]').val("");
			}
		}
		if($("#allDiv").is(":visible")) {
			if(noNameChkYn2.is(":checked") == false) {
				$('input[name=donorName]').val(allDonorName);		// 단체 view인 경우 단체명
			} else {
				$('input[name=donorName]').val("");
			}
		}
		// 03. 연락처 '-' 제거하고 세팅하여 데이터 전송
		$('input[name=donorTel]').val(unAutoHypenPhone(donorTelNumYn));
		// 04. 이메일은 validation 체크하는 부분에서 세팅하여서 생략
		// 05. 생년월일은 자동이체 view, 신용카드 view에 따라 별도 데이터 전송
		if($("#autoPayDiv").is(":visible")) {
			$('input[name=birthday]').val($("#birthday").val());		// 자동이체 생년월일
		}
		
		
// 신용카드가 선택된 경우에만 validation 체크할것 (221120)
		// 신용카드 validation 추가 (221120)
	//	if($("#creditDiv").is(":visible")) { //카카오페이 결제완료시 신청하기가 되게 유효성 어떻게 해야될지 모르겠..
			
		/* ######################################################################################### */
		
		// 폼에 담은 모든데이터
		//var data = $("#donateForm").serialize();
		
		if(confirm("<spring:message code='confirm.regist.next.step'/>")) {
			
			document.donateForm.action = "<c:url value='donateConfirm'/>";
			document.donateForm.submit();
		} 
	}
	// 카카오페이 ####################
	function payment(data) {
		
		/**  금액세팅하기 */
		var donaAmountChkVal =  $('input[name=donaAmount]:checked').val();	// 금액 선택되었는지 체크
		
		var donaAmount = "";	// 카카오페이로 전달할 금액변수
		
		// case1. 직접입력 금액일경우는 직접입력한 금액을 세팅
		if(isEmpty(donaAmountChkVal)) {
			if(!isEmpty($("#amountLabel").val())) {
				donaAmount = $("#amountLabel").val();
			}
		}
		
		// case2. 선택한 금액일경우는 직접입력한 금액을 세팅
		if(!isEmpty(donaAmountChkVal)) {
			donaAmount = donaAmountChkVal;
		}
		
		/* 지불방법 세팅 하기 */
		var payMethodVal = $('input[name=donaAmount]:checked').val();
		
		var payMethod = "";		// 카카페이로 전달할 지불방법 변수
		
		if(!isEmpty(payMethodVal)) {
			if(payMethodVal == '1') {
				payMethod = "자동이체";
			} else if(payMethodVal == '2') {
				payMethod = "신용카드";
			} else if(payMethodVal == '3') {
				payMethod = "실시간 계좌이체";
			} else {
				payMethod = "신용카드";
			}
		}
		
		/* 후원구분 (상품명) 세팅하기 */
		var donaTpChkVal = $('input[name=donaType]:checked').val();
		
		var donaType = "";		// 카카오페이로 전달할 후원구분 변수
		
		if(!isEmpty(donaTpChkVal)) {
			if(donaTpChkVal == '1') {
				donaType = "정기후원";
			} else if(donaTpChkVal == '2') {
				donaType = "일시후원";
			} else {
				donaType = "후원증액";
			}
		}
		
		/* 후원 이메일 세팅 하기 */
		var donorEmailValue = $("#donorEmail").val();
		
		var donorEmail = "";		// 카카오페이로 전달할 이메일 변수
		
		if(!isEmpty(donorEmailValue)) {
			donorEmail = donorEmailValue;
		}
		
		/* 이름 세팅 하기 */
		var donorNameValue = $("#donorName").val();
		
		var donorName = "";			// 카카오페이로 전달할 이름 변수
		
		if(!isEmpty(donorNameValue)) {
			donorName = donorNameValue;
		}
		
		/* 전화번호 세팅 하기 */
		var donorTelValue = $("#donorTel").val();
		
		var donorTel = "";			// 카카오페이로 전달할 전화번호 변수
		
		if(!isEmpty(donorTelValue)) {
			donorTel = donorTelValue;
		}
		
		IMP.init('imp65750861');				//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
		IMP.request_pay({//param
			pg: "kakaopay.TC0ONETIME", 			//pg사명 or pg사명.CID(잘못 입력할 경우,기본 PG사가 띄워짐)
			pay_method: payMethod, 				//지불 방법
			merchant_uid: "iamport_test_id", 	//가맹점 주문번호(아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
			name:donaType, 						//결제창에 노출될 상품명
			amount: donaAmount, 				//금액
			buyer_email : donorEmail,
			buyer_name : donorName,
			buyer_tel : donorTel
		}, function(rsp){ // callback
			if (rsp.success) {
				alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
			} else {
				alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg+ ")");
			}
		});
	} //######################### 이주영(카카오페이) ####################################	
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- (import위해서 넣음) -->
</body>
</html>