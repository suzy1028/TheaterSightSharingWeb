<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fa6464e0817ac48da2af7c8855eebd1">
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	//중심좌표
	var centerLocation=[33.450701,126.570667];
	
	$(document).ready(function(){
		
		//지도 세팅********
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		
		
		//공연장 위치 마커로 표시하기
		var positions=new Array();
		<c:forEach items="${theaters}" var="theater">
			positions.push(
				{title:"${theater.theaterId}",
				content:"<div>${theater.theaterName}</div>",
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
		    
		 // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		    
		 // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    //클릭시
			
		    kakao.maps.event.addListener(marker,'click',getMarkerInfo(marker));
		}
		
		setCenter();
		

		//현재위치를 중심좌표로 지정
		function setCenter(){
			if (navigator.geolocation) {
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {

					centerLocation[0]=position.coords.latitude;
					centerLocation[1]=position.coords.longitude;
					
					var locPosition = new kakao.maps.LatLng(centerLocation[0], centerLocation[1]); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					
					map.setCenter(locPosition);
					
					
					console.log(centerLocation);
					setTheaterList();

				});
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				var locPosition = new kakao.maps.LatLng(centerLocation[0], centerLocation[1]), message = 'geolocation을 사용할수 없어요..'
				displayMarker(locPosition, message);
			
				
				setTheaterList();
			}
			
		}
		
		
		//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		//마커 타이틀 가져오기
		function getMarkerInfo(marker){
			return function(){
						
				//중심좌표 설정
				map.setCenter(marker.getPosition()); 
				map.setLevel(4);
				centerLocation[0]=marker.getPosition().getLat();
				centerLocation[1]=marker.getPosition().getLng();
				
				setTheaterList();
			}
		}
		
		
		
		function calDistance(centerLocation,theaterLocation){
			var distance;
			distance=Math.pow(centerLocation[1]-theaterLocation[1],2)+Math.pow(centerLocation[0]-theaterLocation[0],2);
			distasnce=Math.sqrt(distance);
			
			return distance;
		}
		
		function setTheaterList(){
			var TheaterList=new Array();
			
			console.log("3");
			console.log(centerLocation);
			
			<c:forEach items="${theaters}" var="theater">
				var theaterLocation=[${theater.theaterLat},${theater.theaterLon}];
				var distance = calDistance(centerLocation,theaterLocation);
				TheaterList.push(
							{
								id:"${theater.theaterId}",
								distance:distance
							}
						);
			</c:forEach>
			TheaterList=TheaterList.sort(function(a,b){
				return a.distance-b.distance;
			});
			
			
			console.log(TheaterList);
			
			$("#theaterList").empty();
			var divHtml=""
			for(var i=0;i<10;i++){
				var tId = TheaterList[i].id
			
				<c:forEach items="${theaters}" var="theater">
					if(tId=="${theater.theaterId}"){
						divHtml+='<div class="theaterBtnList" id="${theater.theaterId}">';
						divHtml+='${theater.theaterId} ${theater.theaterName} ';
						if(${theater.seatingCapacity}==null || ${theater.seatingCapacity}==""){
							divHtml+='${theater.seats}';
						}else{
							divHtml+='${theater.seatingCapacity} (${theater.seats})';
						}
						divHtml+='<br>${theater.address}'
						divHtml+='</div>';
						
					}
					
				</c:forEach>
			}
			$("#theaterList").append(divHtml);
			
			$(".theaterBtnList").width("400px");
			$(".theaterBtnList").css({
				border: "thin solid gray",
				borderRadius:"5px",
				margin:"10px",
				padding:"5px"
			});
			
			$(".theaterBtnList").mouseenter(function(){
				/* $(this).css('background-color','yellow'); */
				$(this).css('box-shadow',"3px 3px 3px gray")
			});
			$(".theaterBtnList").mouseleave(function(){
				/* $(this).css('background-color','white'); */
				$(this).css('box-shadow',"none")
			});
			
			$(".theaterBtnList").on("click",function(){
				location.href="${cp}/theater/theaterView?id="+$(this).attr("id");
				/* alert($(this).attr("id")); */
				
			});
			
			$("#searchBtn").on("click",function(){
				param={
					qy:"Theater_sql.selectSearch",
					searchText:$("#searchInput").val()
				};
				
				$.ajax({
					url:"${cp}/selectSearch.json",
					type:"POST",
					data:$.param(param,true),
					succcess:function(data){
						
					}
				}); 
			});
			
		}
		
		
	});
	
	
	
	
</script>
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
		<input type="text" id="searchInput">
		<button id="searchBtn">검색</button>
	</form>
	<h3>지도</h3>
	<div id="map" style="width: 900px; height: 500px;"></div>

	<script>
		
	
		
		
	</script>

	<h3>공연장리스트</h3>
	<div id="theaterList">
		
	</div>
	

	<a href="${cp}/member/login.do">로그인</a>
</body>
</html>