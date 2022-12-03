<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>반려동물 축제 정보</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<h2>반려동물 축제 정보</h2> 
	<hr>
	<div id="map" style="width:90%;height:700px; margin:0 auto;"></div>

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=04aa2f9e9971f0f174266bf2f16f74ec&libraries=clusterer"></script>
	<script>
		var mapContainer = document.getElementById('map'),  
		    mapOption = {
		        center: new kakao.maps.LatLng(36.692885,128.124844),
		        level: 12, 
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP 
		    }; 

		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var mapTypeControl = new kakao.maps.MapTypeControl();

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

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
			[37.6755454,126.7647929,'<div style="padding:5px">2022 펫츠런</div>'],
			[35.182929,128.1357983,'<div style="padding:5px">2022 진주시 반려동물 문화행사</div>'],
			[37.240608,127.1772935,'<div style="padding:5px">용인시와 행복하개</div>'],
			[35.3205744,129.1807934,'<div style="padding:5px">댕댕이와 첫나들이</div>']
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

	<table class="table table-hover">
  <thead>
    <tr bgcolor = "#C9DA82">
      <th scope="col">#</th>
      <th scope="col">축제명</th>
      <th scope="col">주소</th>
      <th scope="col">축제 일자</th>
      <th scope="col">축제 시간</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>2022 펫츠런</td>
      <td>경기 고양시 일산서구 주엽동 77, 일산 문화공원</td>
      <td>2022.12.02 ~ 2022.12.03</td>
      <td>11:00~17:00</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>2022 진주시 반려동물 문화행사</td>
      <td>경남 진주시 동진로 415 진주종합경기장</td>
      <td>2022.11.19</td>
      <td>11:00~16:00</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>용인시와 행복하개</td>
      <td>경기 용인시 처인구 중부대로 1199</td>
      <td>2022.08.27</td>
      <td>11:00~18:00</td>
    </tr>
    <tr>
      <th scope="row">4</th>
      <td>댕댕이와 첫나들이</td>
      <td>부산 기장군 정관읍 구연3로 27</td>
      <td>2022.11.19</td>
      <td>10:00~18:00</td>
    </tr> 
  </tbody>
</table>


</body>
</html>