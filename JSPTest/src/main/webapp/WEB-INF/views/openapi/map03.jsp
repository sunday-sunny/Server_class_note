<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	

	#map, #tbl {
		float : left;
	}
	
	#map { width : 80%; }
	#tbl { width : 20%; }
	
	
</style>

<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
</head>
<body>

	<!-- map03.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kakao Map</small></h1>
		
		<div class="well">π λ§μ»€ μ μ΄νκΈ°</div>
		<div id="map" style="height:400px;"></div>
		
		<table id="tbl" class="table">
			<thead>
				<tr>
					<th>μ₯μ</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
			
		</table>
		
		
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
		
		
		// νΉμ  μμΉμ λ§μ»€ νμνκΈ°(μ μ )
		var marker = new kakao.maps.Marker({
		    map: map,
		    position: new kakao.maps.LatLng(37.499290, 127.033193)
		});
		
		
/* 		plist.forEach((item)=>{
			var marker = new kakao.maps.Marker({
			    map: map,
			    position: new kakao.maps.LatLng(item.position.lat, item.position.lng)
			});
			
		}); */
		
		
		plist.forEach((item, index)=>{
			$("#tbl").append("<tr><td onclick='showMarker(" + index + ");'>" + item.name + "</td></tr>");
			
		});
		
		var marker;
		function showMarker(index) {
			
			// μ§λμμ λ§μ»€λ₯Ό μ μΌνκ².. νκ³ ν..
			if(marker != null) marker.setMap(null);
			
			marker = new kakao.maps.Marker({
			    map: map,
			    position: new kakao.maps.LatLng(plist[index].position.lat, plist[index].position.lng)
			});
			
			// pan μ΄λ μ€μ 
			map.panTo(new kakao.maps.LatLng(plist[index].position.lat, plist[index].position.lng));
			
			$('#tbl tbody tr').css('background-color', 'transparent');
	        $('#tbl tbody tr').eq(index).css('background-color', 'cornflowerblue');

			
		}
		
		
	</script>

</body>
</html>