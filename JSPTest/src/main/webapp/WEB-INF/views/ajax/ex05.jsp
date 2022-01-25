<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp"%>
<style>
	.icon {
		width : 100px;
	}
</style>
</head>
<body>

	<!-- ex05.jsp -->
	<div class="container">
		<h1 class="page-header">Draggable + Ajax <small>위치값 상태유지</small></h1>
		
		<img src="/jsp/asset/images/circle_icon01.png" id="icon01" class="icon">
		<img src="/jsp/asset/images/circle_icon02.png" id="icon02" class="icon">
		<img src="/jsp/asset/images/circle_icon03.png" id="icon03" class="icon">
		<img src="/jsp/asset/images/circle_icon04.png" id="icon04" class="icon">
		<img src="/jsp/asset/images/circle_icon05.png" id="icon05" class="icon">
		
		
	</div>
	
	<script src="/jsp/asset/js/jquery-ui.js"></script>
	<script>
		$('.icon').draggable({
			stop : function(event, ui){
				
				//x=100&y=200&id=icon1
			
				$.ajax({
					type : 'GET',
					url : '/jsp/ajax/ex05data.do',
					data : 'x=' + ui.position.left + '&y=' + ui.position.top +'&id=' + this.id
					// 돌려받을 이벤트가 없다면 굳이 success를 안 써도 됨
					
				});
			}
		});
		
		

		// 안 먹으니 다시 해볼것.....
 		<c:forEach items="${list}" var="dto">
			$('#${dto.id}').css({
				left : "${dto.x}",
				top : "${dto.y}"
			});
		</c:forEach>


	
	</script>


</body>
</html>