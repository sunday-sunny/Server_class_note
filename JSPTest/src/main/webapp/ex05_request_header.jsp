<%@page import="java.util.Enumeration"%>
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
	<!-- ex05_request_header.jsp -->
	
	<div class="container">
		<h1>HTTP 요청 메시지 <small>헤더 정보</small></h1>
	
		<table class="table table-bordered">
			<tr>
				<th>헤더명(key)</th>
				<th>헤더값(value)</th>
			</tr>
	
			<% 
				Enumeration<String> e = request.getHeaderNames();
				
				while(e.hasMoreElements()) {
					String name = e.nextElement();
			%>			
			<tr>
				<td><%= name %></td>
				<td><%= request.getHeader(name) %></td>
			</tr>
			
			<% } %>
		</table>
		<tr>
		
		<p> 서버 도메인: <%= request.getServerName() %></p>
		<p> 서버 포트번호: <%= request.getServerPort() %></p>
		<p> 요청url: <%= request.getRequestURI() %></p>
		<p> 요청 쿼리 문자열: <%= request.getQueryString() %></p>
		<p> 클라이언트 주소: <%= request.getRemoteHost() %></p>
		<p> 프로토콜: <%= request.getProtocol() %></p>
		<p> 요청 메소드: <%= request.getMethod() %></p>
		<p> 컨텍스트 경로: <%= request.getContextPath() %></p>
		
	
	
	</div>
	
	
	<script>

	</script>

</body>
</html>