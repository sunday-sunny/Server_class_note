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
	<!-- ex09_session.jsp -->

	<div class="container">
		<h1 class="page-header">세션<small></small></h1>
		
		<% 
		
			int a = 10;
			// session > 저장소 역할
			session.setAttribute("num", 100);
			
		%>
		
		<div><%= a  %></div>
		<div><%= session.getAttribute("num") %></div>	
		<div><a href="ex08_out.jsp">8번 예제</a></div>
	</div>
	
	
	<script>

	</script>

</body>
</html>