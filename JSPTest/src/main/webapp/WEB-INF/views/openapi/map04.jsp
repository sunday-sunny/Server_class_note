<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>

<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
</head>
<body>

	<!-- map04.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kakao Map</small></h1>
		
		<div class="well">📍 마커 제어하기</div>
		<div id="map" style="height:400px;"></div>
		
		
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=658a3cead2d6971dd89cf49b403eb59b"></script>
	<script src="/jsp/data/map.js"></script>

	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		// 지도 객체 + 이벤트 추가
		
		var marker;
		kakao.maps.event.addListener(map, 'click', function(evt) {
			
			$('.well').text('📍 마커 제어하기 > 클릭한 위치(위도: ' + evt.latLng.getLat() + ', 경도: ' + evt.latLng.getLng() + ')');

			if(marker != null) marker.setMap(null);
			
			marker = new kakao.maps.Marker({
			    map: map,
			    position: evt.latLag,
			    title : '이곳을 선택하셨습니다.'
			});
			
			
		});
		
		
	</script>

</body>
</html>