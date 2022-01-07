<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 현재 상황
	// - 요청 ~ 응답까지 지속적으로 데이터 유지해야 하는 상황
	// - one -> two
	
	// 1. 지역 변수
	int a = 10;
	
	// 2. pageContext
	// - 페이지 생성 ~ 페이지 소멸
	pageContext.setAttribute("b", 20);
	
	// 3. request
	// - 요청 ~ 응답(이 사이에 페이지가 N장 : .forward시)
	request.setAttribute("c", 30);
	
	// 4. session
	// - 접속시 ~ 접속종료
	session.setAttribute("d", 40);
	
	// 5. application
	// - 사이트 시작 ~ 사이트 종료
	application.setAttribute("e", 50);
	
	//pageContext.forward("ex12_two.jsp");

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

	<!-- ex12_one.jsp -->
	<div class="container">
		<h1 class="page-header">첫번째 페이지<small></small></h1>
	
		<a href="ex12_two.jsp">두번째 페이지</a>
	
	</div>
	
	
	<script>

	</script>

</body>
</html>