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

	<!-- map02.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kakao Map</small></h1>
		
		<div class="well">🌏 좌표, 드래그, 확대/축소</div>
		<div id="map" style="height:400px;"></div>
		
		<div class="btns">
			<input type="button" value="서울역으로 이동하기" id="btn1" class="btn btn-default">
			<input type="button" value="역삼역으로 이동하기" id="btn2" class="btn btn-default">
		</div>
		
		
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=658a3cead2d6971dd89cf49b403eb59b"></script>
	<script src="/jsp/data/map.js"></script>
	
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.499290, 127.033193), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		// 지도 드래그 제어
		map.setDraggable(false);
		
		// 확대/축소 제어
		map.setZoomable(false);
		
		// MapTypeControl
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		//ZoomControl
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		
		/*
 		${"#btn1"}.click(function(){
			var seoulStation = new daum.maps.LatLng(37.554644, 126.970793);
			map.setCenter(seoulStation);
		});
		
		
		${"#btn2"}.click(()=>{
			var yeoksamStation = new daum.maps.LatLng(plist[1].position.lat, plist[1].position.lng); 
			map.setCenter(yeoksamStation);
			map.panTo(yeoksamStation);
		}); */
		
	</script>

</body>
</html>