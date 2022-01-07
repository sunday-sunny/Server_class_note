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

	<!-- ex12_three.jsp -->
	<div class="container">
		<h1 class="page-header">세번째 페이지<small></small></h1>
		
		<%
			// 1. 지역 변수
			int num1 = 100;
		
			// 2. pageContext
			pageContext.setAttribute("num2", 200);
			
			// 3. request
			request.setAttribute("num3", 300);
			
			// 4. session
			session.setAttribute("num4", 400);
			
		
		%>
		
		
		<div style="border:1px solid black">
			<%@ include file="inc/ex12_sub.jsp" %>
		</div>
		
		
	</div>
	
	
	<script>

	</script>

</body>
</html>