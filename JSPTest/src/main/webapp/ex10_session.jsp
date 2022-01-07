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

	<!-- ex10_session.jsp -->

	<div class="container">
		<h1 class="page-header">세션<small></small></h1>
	
		<%
			// 페이지 방문 카운트
			if(session.getAttribute("count") == null){
				session.setAttribute("count", 1);
			}
			else 
				session.setAttribute("count", (int)session.getAttribute("count")+1);
			
		
			if(application.getAttribute("count") == null){
				application.setAttribute("count", 1);
			}
			else 
				application.setAttribute("count", (int)application.getAttribute("count")+1);
			
		%>
		
		<div>count : <%= session.getAttribute("count") %></div>
		<div>count(application) : <%= application.getAttribute("count") %></div>
	
	
	</div>
	
	
	<script>

	</script>

</body>
</html>