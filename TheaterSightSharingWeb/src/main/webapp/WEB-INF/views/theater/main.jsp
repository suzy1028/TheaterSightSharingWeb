<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fa6464e0817ac48da2af7c8855eebd1">
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>위도</th>
		<th>경도</th>
		<th>주소</th>
		<th>좌석수</th>
	</tr>
	<c:forEach items="${theaters}" var="theater">
		<tr>
			<th>${theater.theaterId}</th>
			<th>${theater.theaterName}</th>
			<th>${theater.theaterLat}</th>
			<th>${theater.theaterLon}</th>
			<th>${theater.address}</th>
			<th>${theater.seats}</th>
		</tr>
	
	</c:forEach>
	</table>

	<h3>검색창</h3>
	<form>
		<input type="text">
		<button>검색</button>
	</form>
	<h3>지도</h3>
	<div id="map" style="width: 900px; height: 500px;"></div>

	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		//공연장 위치 마커로 표시하기
		var positions=new Array();
		<c:forEach items="${theaters}" var="theater">
			positions.push(
				{title:"${theater.theaterName}",
				latlng: new kakao.maps.LatLng("${theater.theaterLat}", "${theater.theaterLon}")}		
			);
		</c:forEach>
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		

		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				

				// 마커와 인포윈도우를 표시합니다
				map.setCenter(locPosition);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
	</script>
	<h1>${theater.theaterLat},${theater.theaterLog}</h1>
	<h3>공연장리스트</h3>

	<a href="${cp}/member/login.do">로그인</a>
</body>
</html>