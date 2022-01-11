<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>

</style>
</head>
<body>

	<!-- login.jsp -->
	<div class="container">
		<h1 class="page-header">로그인 <small></small></h1>
		
		<form method="POST" action="loginok.jsp">
		<table class="table table-bordered" style="width: 250px;">
			<tr>
				<th style="width: 100px;">아이디</th>
				<td>
					<input type="text" name="id" class="form-control">
				</td>
			</tr>
			<tr>
				<th style="width: 100px;">암호</th>
				<td>
					<input type="password" name="pw" class="form-control">
				</td>
			</tr>
		
		</table>
		<input type="submit" value="로그인" class="btn btn-default">
		</form>
		
	
	</div>
	
	
	<script>

	</script>

</body>
</html>