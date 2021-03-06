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
		
		<div class="well">π μ’ν, λλκ·Έ, νλ/μΆμ</div>
		<div id="map" style="height:400px;"></div>
		
		<div class="btns">
			<input type="button" value="μμΈμ­μΌλ‘ μ΄λνκΈ°" id="btn1" class="btn btn-default">
			<input type="button" value="μ­μΌμ­μΌλ‘ μ΄λνκΈ°" id="btn2" class="btn btn-default">
		</div>
		
		
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=658a3cead2d6971dd89cf49b403eb59b"></script>
	<script src="/jsp/data/map.js"></script>
	
	<script>
		var container = document.getElementById('map'); //μ§λλ₯Ό λ΄μ μμ­μ DOM λ νΌλ°μ€
		var options = { //μ§λλ₯Ό μμ±ν  λ νμν κΈ°λ³Έ μ΅μ
			center: new kakao.maps.LatLng(37.499290, 127.033193), //μ§λμ μ€μ¬μ’ν.
			level: 3 //μ§λμ λ λ²¨(νλ, μΆμ μ λ)
		};
	
		var map = new kakao.maps.Map(container, options); //μ§λ μμ± λ° κ°μ²΄ λ¦¬ν΄
		
		
		// μ§λ λλκ·Έ μ μ΄
		map.setDraggable(false);
		
		// νλ/μΆμ μ μ΄
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