<%@page import="java.sql.Statement"%>
<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 'test' 레코드 삭제하기
	
	// 1. DB 접속
	Connection conn = null;

	conn = DBUtil.open();
	
	// 2. SQL 실행
	String sql = "delete from tblJava where id = 'hong'";
	Statement stat = conn.createStatement();
	int result = stat.executeUpdate(sql); //적용된 행의 갯수(질의 결과x)
	

		
	
	// 3. DB 접속해제
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
	
	
<%-- 		<% 	if(result > 0) %>
			<div>계정을 삭제했습니다.</div>
		<%  else %>
			<div>계정 삭제를 실패했습니다.</div> --%>
		
	
	</div>
	
	
	<script>

	</script>

</body>
</html>