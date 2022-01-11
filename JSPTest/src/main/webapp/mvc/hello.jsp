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

	<!-- hello.jsp -->
	<div class="container">
		<h1 class="page-header">결과 <small></small></h1>
	
		<div>이름 : <%= request.getAttribute("name") %></div>
		<div>나이 : <%= request.getAttribute("age") %></div>
	
	</div>
	
	
	<script>

	</script>

</body>
</html>