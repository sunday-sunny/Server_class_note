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
		
		<div class="well">📍 마커 제어하기</div>
		<div id="map" style="height:400px;"></div>
		
		<table id="tbl" class="table">
			<thead>
				<tr>
					<th>장소</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
			
		</table>
		
		
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
		
		
		// 특정 위치에 마커 표시하기(정적)
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
			
			// 지도상에 마커를 유일하게.. 하고픔..
			if(marker != null) marker.setMap(null);
			
			marker = new kakao.maps.Marker({
			    map: map,
			    position: new kakao.maps.LatLng(plist[index].position.lat, plist[index].position.lng)
			});
			
			// pan 이동 설정
			map.panTo(new kakao.maps.LatLng(plist[index].position.lat, plist[index].position.lng));
			
			$('#tbl tbody tr').css('background-color', 'transparent');
	        $('#tbl tbody tr').eq(index).css('background-color', 'cornflowerblue');

			
		}
		
		
	</script>

</body>
</html>