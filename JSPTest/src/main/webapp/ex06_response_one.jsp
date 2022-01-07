<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* 페이지 이동하는 수단
		1. HTML
		- <a>
		- 사람이 직접 링크 클릭
	
		2. JavaScript
		- location.href
		- 프로그램 제어가 가능 
		
		3. Servlet/JSP
		- response.sendRedirect()
		- 프로그램 제어가 가능
	*/
	
	response.sendRedirect("ex06_response_two.jsp");
	
		
	/* 게시판 글쓰기
	 	- writer.jsp > 글쓰기
	 	- writerok.jsp > 전송 + DB 작업(insert) > 이 직후 글목록을 보려고 sendRedirect 
	 	- list.jsp > 글목록
	*/

	
	
%>
    
    
    
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
	
	<!-- ex06_response_one.jsp -->
	
	<div class="container">
		<h1 class="page-header">첫번째 페이지<small></small></h1>
	
	</div>
	
	
	
	<script>
		location.href = 'ex06_response_two.jsp';
	</script>

</body>
</html>