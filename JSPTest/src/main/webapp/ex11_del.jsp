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

	<!-- ex11_del.jsp -->
	<div class="container">
		<h1 class="page-header">세션 삭제하기<small></small></h1>
	
		<%
			session.removeAttribute("data");
		%>
		
		<a href="ex11_session.jsp">돌아가기</a>
	
	
	</div>
	
	
	<script>

	</script>

</body>
</html>