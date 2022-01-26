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
	.container { width : 700px;}
	.table th {width : 100px;}
</style>
</head>
<body>

	<!-- ex07.jsp -->
	<div class="container">
		<h1 class="page-header">게시판 <small></small></h1>
		
		<div id="list">
		<c:forEach items="${list}" var="dto">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td>${dto.subject}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name}(${dto.id}) ${dto.regdate}</td>
			</tr>
		
		</table>
		</c:forEach>
		</div>
		
		<hr>
		
		<!-- <input type="button" value="게시물 더보기" id="btnMore"
			class="btn btn-default" style="width:100%">
		 -->
		 
		 <button type="button" id="btnMore" class="btn btn-default" style="width:100%">
		 	게시물 더보기
		 	<img src="/jsp/assert/images/loading.gif" style="height:30px; display:none;">
		 </button>
		
	</div>
	
	<script>
	
		let begin = 4; 
		let timer = 0;	
		
		
		// 왜 또 안 먹는데...ㅠ
		$('#btnMore').click(()=> {
			
			timer = setTimeout(()=>{
				$('#btnMore img').show();
			}, 500);
			
			// 데이터 요청
			$.ajax({
				type : 'GET',
				url : '/jsp/ajax/ex07data.do',
				data : 'begin=' + begin,
				dataTtype : 'json',
				success : function(result){
					
					if(result.lengt == 0) {
						$('#btnMore').prop('disabled', true);
						$('#btnMore').val('더 이상 게시물이 없습니다.');
					}
					
					result.forEach((item)=>{
						$('#list').append('<table class="table table-bordered"><tr><th>제목</th><td>' + item.subject + '</td></tr><tr><th>내용</th><td>' + item.content + '</td></tr><tr><th>이름</th><td>' + item.name + '(' + item.id + ') ' + item.regdate + '</td></tr></table>');					
				
					});
				}
			
			});
			begin +=3;
			$('#btnMore img').hide();
			clearTimeout(timer);
			
			// 마지막 테이블의 위치?
			let y = $('#list').children().last().position().top;
			
			$('html, body').animate({
                scrollTop: y
            }, 500);
			
		});
	
	
	
	</script>


</body>
</html>