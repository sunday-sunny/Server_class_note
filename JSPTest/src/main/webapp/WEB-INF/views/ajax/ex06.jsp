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

</style>
</head>
<body>

	<!-- ex06.jsp -->
	<div class="container">
		<h1 class="page-header">회원목록 <small></small></h1>
		
		<form id="form1">
		<table class="table table-bordered">
			<thead>
			<tr>
				<th>아이디</th>
				<th>암호</th>
				<th>이름</th>
				<th>등급</th>
			</tr>
			<thead>
			

			<tbody>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td onclick="del('${dto.id}');">${dto.id}</td>
				<td>${dto.pw}</td>
				<td>${dto.name}</td>
				<td>${dto.lv}</td>
			</tr>
			</c:forEach>
			</tbody>
			
			<tfoot>
			<tr>
				<td><input type="text" class="form-control" required id="id" name="id" placeholder="아이디"></td>
				<td><input type="password" class="form-control" required id="pw" name="pw" placeholder="암호"></td>
				<td><input type="text" class="form-control" required id="name" name="name" placeholder="이름"></td>
				<td><input type="text" class="form-control" required id="lv" name="lv" placeholder="등급"></td>
			</tr>
			</tfoot>
		
		</table>
		</form>
		
		
	</div>
	
	<script src="/jsp/asset/js/jquery-ui.js"></script>
	<script>
		$('#lv').keyup(()=>{
			if(event.keyCode == 13){
				
				// 회원가입 > Ajax
				$.ajax({
					type : 'POST',
					url : '/jsp/ajax/ex06data.do',
					data : $('#form1').serialize(), // 태그에 네임 꼭!
					success : function(result){
						if(result == '1'){
							// 1. 테이블에 새로운 행 추가
							// 2. 입력폼 초기화
							$('table tbody').append('<tr><td onclick="del(\'' + $('#id').val() + '\')">' + $('#id').val() + '</td><td>' + $('#pw').val() + '</td><td>' + $('#name').val() + '</td><td>' + $('#lv').val() + '</td></tr>');							
							$('#id').val('');
							$('#pw').val('');
							$('#name').val('');
							$('#lv').val('');
							$('#id').focust();
						}
						else {
							alert('failed');
						}
					}
					
				});
				
			}
		});
		
		// 안 먹음ㅠ.. 
		function del(id) {
			if(confirm('삭제하겠습니까?')){
				let temp = event.srcElement; // ajax 처리전 임시로 <td> 넣어놓기
				
				$.ajax({
					type: 'GET',
					url : 'jsp/ajax/ex06del.do',
					data : 'id=' + id,
					success : function(result){
						if(result == '1'){
							alert('왜 또 안 먹어ㅠ ');
							$(temp).parent().remove();
						}
						else {
							alert('failed');
						}
					}
				});
			}
			
		}
	
	</script>


</body>
</html>