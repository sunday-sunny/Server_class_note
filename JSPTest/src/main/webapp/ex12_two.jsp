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

	<!-- ex12_two.jsp -->
	<div class="container">
		<h1 class="page-header">두번째 페이지<small></small></h1>
	
		<p>pageContext b : <%= pageContext.getAttribute("b") %></p>
		<p>request c : <%= request.getAttribute("c") %></p>
		<p>session d : <%= session.getAttribute("d") %></p>
		<p>application d : <%= application.getAttribute("e") %></p>
		
	
	</div>
	
	
	<script>

	</script>

</body>
</html>