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

	<!-- index.jsp -->
	<div class="container">
		<h1 class="page-header">시작페이지 <small></small></h1>
	
	
		<!-- 로그인/로그아웃 -->
		<% if (session.getAttribute("id") == null) { %>
		<a href="login.jsp">로그인</a>
		<% } else { %>
		<a href="logout.jsp">로그아웃</a>
		<hr>
		<div class="well well-sm">
			<div>아이디: <%= session.getAttribute("id") %></div>
			<div>이름: <%= session.getAttribute("name") %></div>
			<div>등급: <%= session.getAttribute("lv").equals("1") ? "관리자" : "일반회원" %></div>
		</div>
		<% } %>
		
		<hr>
		
		
		<!-- 회원 전용 메뉴 -->
		<% if(session.getAttribute("id") != null) { %>
		<a href="member.jsp">회원 전용 페이지</a>
		<% } %>
		
		<% if(session.getAttribute("id") != null) { %>
		<a href="member.jsp">회원 전용 페이지</a>
		<% } else { %>
		<a href="#!" onclick="alert('회원 전용입니다. 로그인하세요.'); location.href='login.jsp';">회원 전용 페이지</a>
		<% } %>

		<hr>
		
		
		<!-- 관리자 페이지 -->
		<% if(session.getAttribute("id") != null && session.getAttribute("lv").toString().equals("1")) { %>
		<a href="admin.jsp">관리자 전용 페이지</a>
		<% } %>

	
	</div>
	
	
	<script>

	</script>

</body>
</html>