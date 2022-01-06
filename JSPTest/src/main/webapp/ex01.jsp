<%@page import="java.util.Random"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 자바 영역
	// 자바 인텔리센스가 안 먹을 때는, 해당 토큰 맨 끝에서 ctrl + space 해보기
	// 보통 가독성 측면 때문에 스크립틀릿은 상단으로 보낸다.
	Calendar now = Calendar.getInstance();
	
	Random rnd = new Random();
	int dan = rnd.nextInt(8) + 2;
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex01.jsp -->

	<h1>스크립틀릿</h1>
	현재 시간 : <%= String.format("%tT", now) %>

	<!-- 스파게티 코드 발생 -->
	<h1>구구단 <%= dan %>단 </h1>
	<% for(int i = 1; i <= 9; i++){ %>
	<div><%= dan %> x <%= i %> = <%= dan*i %></div>
	<% } %>	
	
	<hr>
	
	<%= dan %>
	<%= "<input>" %>
	
	<%@ include file="inc/copyright.jsp" %>

</body>
</html>