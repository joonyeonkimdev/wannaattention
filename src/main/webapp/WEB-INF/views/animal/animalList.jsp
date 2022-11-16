<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /wannaattention/src/main/webapp/WEB-INF/views/board/animalList.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양동물 목록보기</title>

</head>

<body>
<!-- 동물 종류 버튼  -->
<div align="center">
<button type="button" class="btn btn-outline-primary">전체</button>
<button type="button" class="btn btn-outline-secondary">강아지</button>
<button type="button" class="btn btn-outline-secondary">고양이</button>
<button type="button" class="btn btn-outline-secondary">기타</button>
</div>
<!-- 필터 -->
<div align="right">
  <button type="button" class="btn btn-primary">정렬순</button>
  <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" 
  		  data-toggle="dropdown" 
  		  aria-expanded="false">
    <span class="sr-only">Toggle Dropdown</span>
</button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">최신순</a>
    <a class="dropdown-item" href="#">오래된순</a>
    <a class="dropdown-item" href="#">거리순</a>
</div>
</div>
<!--목록-->
<ul class="list-unstyled">
  <li class="media">
    <img src="..." class="mr-3" alt="...">
    <divclass="media-body">
      <h5 class="mt-0 mb-1">강아지 예시</h5>
      <p>등록번호:
      <br>이름:<br>나이:<br>성별:</p>
   <a href="#" class="card-link">자세히보기</a>
    </div>
  </li>
  <li class="media my-4">
    <img src="..." class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">고양이 예시</h5>
      <p>등록번호:
      <br>이름:<br>나이:<br>성별:</p>
     <a href="#" class="card-link">자세히보기</a>
    </div>
  </li>
  <li class="media">
    <img src="..." class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">고슴도치 예시</h5>
      <p>등록번호:
      <br>이름:<br>나이:<br>성별:</p>
    <a href="#" class="card-link">자세히보기</a>
    </div>
  </li>
</ul>
  </div>
</div>
<!--하단 페이지 넘기기 창  -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</div>
</div>
</table>

</body>
</html>