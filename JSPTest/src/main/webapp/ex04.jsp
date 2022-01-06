<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	table { width : 600px; }
	th { width : 120px;}
	
	#userlist img {
		opacity: .5;
	}
	
	#userlist img.ui-selected {
		opacity : 1;
	}

</style>


</head>
<body>
	<!-- ex04.jsp -->
	<div class="container">
		<h1 class="page-header">폼 태그 전송하기</h1>
		
		
		<form method ="POST" action="/jsp/ex04ok.jsp">
			<table class="table table-bordered">
				<tr>
					<th>텍스트 박스</th>
					<td><input type="text" name="txt1" class="form-control"></td>
				</tr>
				<tr>
					<th>암호 박스</th>
					<td><input type="password" name="pw1" class="form-control"></td>
				</tr>
				<tr>
					<th>다중 텍스트 박스</th>
					<td><textarea name="txt2" style="height: 100px;" class="form-control"></textarea></td>
				</tr>
				<tr>
					<th>체크박스</th>
					<td><input type="checkbox" name="cb1" value="yes"></td>
				</tr>
				<tr>
					<th>체크박스</th>
					<td><input type="checkbox" name="cb2"></td>
				</tr>
				<tr>
					<th>체크박스들</th>
					<td>
						<h4>당신의 취미는?</h4>
						<input type="checkbox" name="cb3" value="독서"> 독서
						<input type="checkbox" name="cb4" value="음악"> 운동
						<input type="checkbox" name="cb5" value="코딩"> 코딩
					
					</td>
				</tr>
				<tr>
					<th>체크박스들</th>
					<td>
						<h4>당신의 취미는?</h4>
						<input type="checkbox" name="cb" value="독서"> 독서
						<input type="checkbox" name="cb" value="음악"> 운동
						<input type="checkbox" name="cb" value="코딩"> 코딩
					
					</td>
				</tr>
				<tr>
					<th>라디오</th>
					<td>
						<input type="radio" name="rb" value="m"> 남자
						<input type="radio" name="rb" value="f"> 여자
					</td>
				</tr>
				<tr>
					<th>히든태그</th>
					<td><input type="hidden" name="id" value="hong"></td>
				</tr>
				<tr>
					<th>셀렉트 박스</th>
					<td>
						<select name="sel1">
							<option value="f1">사과</option>
							<option value="f2">바나나</option>
							<option value="f3">귤</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>셀렉트 박스2</th>
					<td>
						<select name="sel2" multiple="multiple">
							<option value="f1">사과</option>
							<option value="f2">바나나</option>
							<option value="f3">귤</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>HTML5</th>
					<td><input type="color" name="c1"></td>
				</tr>
				
				<tr>
					<th>User Control</th>
					<td>
						<div id="userlist">
							<img src="/jsp/asset/images/man_01.png" data-name="hong">						
							<img src="/jsp/asset/images/man_02.png" data-name="lee">						
							<img src="/jsp/asset/images/man_03.png" data-name="park">						
						</div>
						<input type="hidden" name="name" id="name" value="">
					</td>
				</tr>
				
				
			
			</table>
			<input type="submit" value="전달하기" class="btn btn-default">
		</form>
	
	</div>
	
	<script src="/jsp/asset/js/jquery-ui.js"></script>
	<script>
		$('#userlist').selectable({
			selected : function(event, ui){
				//alert(ui.selected.dataset['name']);
				document.getElementById('name').value = ui.selected.dataset['name'];
			}
		});
	
	</script>

</body>
</html>