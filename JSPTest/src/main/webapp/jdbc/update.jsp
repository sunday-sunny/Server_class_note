<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 1. DB 연결
	Connection conn = null;
	Statement stat = null;
	conn = DBUtil.open();

	
	// 2. SQL
	String sql = "update tblJava set name = '홍동길', age = 30 where id = 'hong'";
	stat = conn.createStatement();
	int result = stat.executeUpdate(sql);
	
	
	// 3. 종료
	stat.close(); // 원래 stat도 close를 해줘야하나, connection이 close될 때 자동 닫힘, 하지마 적어주는게 좋음
	conn.close();
	
	
	
	
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


	<div class="container">
		<h1 class="page-header"> <small></small></h1>
	
	</div>
	
	
	<script>

	</script>

</body>
</html>