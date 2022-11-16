<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양동물 등록하기</title>

</head>
<body>
	<!-- 카테고리 필터링 -->
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<button class="btn btn-outline-secondary dropdown-toggle"
				type="button" data-toggle="dropdown" aria-expanded="false">카테고리</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">ㅇㅇ보호소</a> <a class="dropdown-item"
					href="#">ㅁㅁ보호소</a> <a class="dropdown-item" href="#">△△보호소</a>
			</div>
		</div>
		<input type="text" class="form-control"
			aria-label="Text input with dropdown button">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">0.등록번호</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">1.품종</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">2.나이</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">3.성별</span>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox1"
				value="option1"> <label class="form-check-label"
				for="inlineCheckbox1">남자</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox2"
				value="option2"> <label class="form-check-label"
				for="inlineCheckbox2">여자</label>
		</div>
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">4.접종유무</span>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox1"
				value="option1"> <label class="form-check-label"
				for="inlineCheckbox1">유</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox2"
				value="option2"> <label class="form-check-label"
				for="inlineCheckbox2">무</label>
		</div>
	</div>

	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">5.중성화유무</span>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox1"
				value="option1"> <label class="form-check-label"
				for="inlineCheckbox1">유</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox2"
				value="option2"> <label class="form-check-label"
				for="inlineCheckbox2">무</label>
		</div>
	</div>

	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">6.보호소로 오게 된
				이유</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>

	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">7.맡겨지기 전 환경</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">8.특이사항</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">9.좋아하는 것</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">10.싫어하는 것</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">11.입소 날짜</span>
		</div>
		<input type="text" class="form-control" placeholder="Username"
			aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	<div class="input-group flex-nowrap">
		<div class="input-group-prepend">
			<span class="input-group-text" id="addon-wrapping">12.사진 등록</span>
		</div>
		<input type="file" class="form-control-file"
			id="exampleFormControlFile1">
	</div>

	<!-- 하단 등록하기 버튼 -->
	<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">등록하기</button>
</body>
</html>