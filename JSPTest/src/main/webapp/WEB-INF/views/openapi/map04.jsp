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
		
		<div class="well">π λ§μ»€ μ μ΄νκΈ°</div>
		<div id="map" style="height:400px;"></div>
		
		
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=658a3cead2d6971dd89cf49b403eb59b"></script>
	<script src="/jsp/data/map.js"></script>

	<script>
		var container = document.getElementById('map'); //μ§λλ₯Ό λ΄μ μμ­μ DOM λ νΌλ°μ€
		var options = { //μ§λλ₯Ό μμ±ν  λ νμν κΈ°λ³Έ μ΅μ
			center: new kakao.maps.LatLng(33.450701, 126.570667), //μ§λμ μ€μ¬μ’ν.
			level: 3 //μ§λμ λ λ²¨(νλ, μΆμ μ λ)
		};
	
		var map = new kakao.maps.Map(container, options); //μ§λ μμ± λ° κ°μ²΄ λ¦¬ν΄
		
		
		// μ§λ κ°μ²΄ + μ΄λ²€νΈ μΆκ°
		
		var marker;
		kakao.maps.event.addListener(map, 'click', function(evt) {
			
			$('.well').text('π λ§μ»€ μ μ΄νκΈ° > ν΄λ¦­ν μμΉ(μλ: ' + evt.latLng.getLat() + ', κ²½λ: ' + evt.latLng.getLng() + ')');

			if(marker != null) marker.setMap(null);
			
			marker = new kakao.maps.Marker({
			    map: map,
			    position: evt.latLag,
			    title : 'μ΄κ³³μ μ ννμ¨μ΅λλ€.'
			});
			
			
		});
		
		
	</script>

</body>
</html>