<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	/* 서버 프로그래밍의 자원 관리
		- 생명 주기
		- 하나의 JSP 페이지의 자원은 최대 생명 주기가 해당 JSP 페이지이다. 
		> JSP 페이지간의 데이터 공유는 불가능하다.
		
		첫번째 페이지 -> a -> 두번째 페이지
		1. <form> 태그 사용
		2. GET 방식 쿼리 문자열 사용
		3. request.setAttribute + pageContext.forward()
		
	*/

	
	int a = 10;
	
	// 데이터 전달 없이 이동할 때
	/* response.sendRedirect("ex07_pagecontext_two.jsp"); */
	
	// 데이터를 전달하며 이동할 때
	request.setAttribute("a", a);
	pageContext.forward("ex07_pagecontext_two.jsp");
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
	<!-- ex07_pagecontext_one.jsp -->

	<div class="container">
		<h1 class="page-header"> <small></small></h1>
		
		<div>a : <%= a %></div>
		<%-- <a href="ex07_pagecontext_two.jsp?a=<%= a =>">두번째 페이지</a>
		 --%>
	</div>
	
	
	<script>

	</script>

</body>
</html>