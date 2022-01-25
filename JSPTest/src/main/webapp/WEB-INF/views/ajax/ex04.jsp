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
	.table { width : 600px;}
	#id { width : 150px;}
	#result { 
		display : inline-block;
		width : 250px;
	}
	

</style>
</head>
<body>

	<!-- ex04.jsp -->
	<div class="container">
		<h1 class="page-header">아이디 중복검사 <small></small></h1>
		
		
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id" class="form-control">
				</td>
				<td>
					<input type="button" id="btn" class="btn btn-default" value="중복검사">
					<span id="result"></span>
				</td>
				
				
			</tr>
		
		
		
		</table>
		
	</div>
	
	<script>
	
		$('#btn').click(()=>{
			// 1. 아이디 전송
			// 2. 서버(중복 검사) > 1 or 0 반환
			// 3. 결과에 따라 조치(메시지 출력)
			
			// 데이터 주고(단일 데이터: 아이디) + 받고(단일 데이터: 숫자)
			
			$.ajax({
				type : 'GET',
				url : '/jsp/ajax/ex04data.do',
				data : 'id=' + $('#id').val(), // id=hong
				dataType : 'text',
				success : function(result){
					if(result == 1){
						$('#result').css('color', 'tomato');
						$('#result').text('이미 사용중인 아이디입니다.');
					}
					else {
						$('#result').css('color', 'cornflowerblue');
						$('#result').text('사용 가능한 아이디입니다.');
					}
				}
			});
			
			
			
		});
	
	
	</script>


</body>
</html>