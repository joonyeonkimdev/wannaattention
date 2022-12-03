<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>동물 놀이터 정보</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<h2>동물 놀이터 정보</h2> 
	<hr>
	<div id="map" style="width:90%;height:700px; margin:0 auto;"></div>

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=04aa2f9e9971f0f174266bf2f16f74ec&libraries=clusterer"></script>
	<script>
		var mapContainer = document.getElementById('map'), 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56682, 126.97865), 
		        level: 8, 
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤
		var mapTypeControl = new kakao.maps.MapTypeControl();

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 줌 컨트롤
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, 
	        averageCenter: true,
	        minLevel: 10  
	    });
		
	    if (navigator.geolocation) {
	        
	        navigator.geolocation.getCurrentPosition(function(position) {
	            
	            var lat = position.coords.latitude, // 위도
	                lon = position.coords.longitude; // 경도
	            
	            var locPosition = new kakao.maps.LatLng(lat, lon), 
	                message = '<div style="padding:5px;">현재위치</div>'; 
	            
	            displayMarker(locPosition, message);
	                
	          });
	        
	        function displayMarker(locPosition, message) {

	            var marker_present = new kakao.maps.Marker({  
	                map: map, 
	                position: locPosition
	            }); 
	            
	            var iwContent = message, 
	                iwRemoveable = true;

	            var infowindow = new kakao.maps.InfoWindow({
	                content : iwContent,
	                removable : iwRemoveable
	            });
	            
	            infowindow.open(map, marker_present);
	            
	            map.setCenter(locPosition);      
	        }    
	        
	    }
	    var markers = [];
		var data = [
			[37.549363,127.0818126,'<div style="padding:5px">어린이대공원</div>'],
			[37.5642169,126.8924791,'<div style="padding:5px">월드컵공원</div>'],
			[37.5035749,126.9192153,'<div style="padding:5px">보라매공원</div>'],
			[37.6474261,127.0414291,'<div style="padding:5px">초안산근린공원</div>'],
			[37.4964245,127.1003181,'<div style="padding:5px">송파구반려견놀이터</div>'],
			[37.5405569,126.9415027,'<div style="padding:5px">마포구반려견놀이터</div>'],
			[37.2490526,127.0249436,'<div style="padding:5px">마중공원 반려견 놀이터</div>'],
			[37.2842425,127.0693424,'<div style="padding:5px">광교호수공원 반려견 놀이터</div>'],
			[37.3032495,127.0796515,'<div style="padding:5px">상현레스피아 반려견 놀이터</div>'],
			[37.1090664,127.6219232,'<div style="padding:5px">반려동물 놀이터(진암공원)</div>'],
			[37.1525762,126.9784148,'<div style="padding:5px">정남 FUN랜드</div>'],
			[37.8376421,127.0680086,'<div style="padding:5px">양주시 반려견 놀이터</div>'],
			[37.2668962,127.1316812,'<div style="padding:5px">구갈레스피아 반려견 놀이터</div>'],
			[37.3099302,126.9454532,'<div style="padding:5px">왕송호수 반려견 놀이터</div>'],
			[37.3231915,126.7366496,'<div style="padding:5px">성곡 반려견 놀이터</div>'],
			[37.7247178,126.6297854,'<div style="padding:5px">태산패밀리파크 반려견 놀이터</div>'],
			[35.184895,129.09622,'<div style="padding:5px">연제구 반려동물놀이터</div>'],
			[35.200036,129.079022,'<div style="padding:5px">반려동물 산책놀이공원</div>']
          ]
        function makeOverListener(map, marker, infowindow) {
            return function() {
                infowindow.open(map, marker);
            };
        }
        function makeOutListener(infowindow) {
            return function() {
                infowindow.close();
            };
        }
		
		for(var i=0;i<data.length;i++){
			var markerPosition  = new kakao.maps.LatLng(data[i][0],data[i][1]); 

			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			marker.setMap(map);
			var iwContent = data[i][2];
		    iwPosition = markerPosition 

		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		markers.push(marker);
		
		kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			
		}
        clusterer.addMarkers(markers);
	</script>
	<br><br>
	<div class="dropdown" style="float:right;padding:10px;">
  <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
    지역
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="animalPlaygroundList?region=0">전체</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=1">서울</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=2">경기</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=3">인천</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=4">세종</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=5">대전</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=6">대구</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=7">울산</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=8">부산</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=9">광주</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=10">제주</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=11">강원</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=12">충북</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=13">충남</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=14">경북</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=15">경남</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=16">전북</a>
    <a class="dropdown-item" href="animalPlaygroundList?region=17">전남</a>
  </div>
</div>
	<table class="table table-hover">
  <thead>
    <tr bgcolor = "#C9DA82">
      <th scope="col">놀이터명</th>
      <th scope="col">규모(m<sup>2</sup>)</th>
      <th scope="col">주소</th>
      <th scope="col">운영시간</th>
      <th scope="col">전화번호</th>
      <th scope="col">대형견</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="facility" items="${facList }">
	  	<tr>
	      <td>${facility.name}</td>
	      <td>${facility.pgScale}</td>
	      <td>${facility.address}</td>
	      <td>${facility.officeHours}</td>
	      <td>${facility.tel}</td>
	      <td>${facility.pgBigPossible}</td>
	    </tr>
  	</c:forEach>
    
  </tbody>
</table>


</body>
</html>