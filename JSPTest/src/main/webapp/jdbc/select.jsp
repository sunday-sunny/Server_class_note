<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 반환값이 있는 쿼리
	
	/* init */
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null; // select 결과 테이블 참조 객체 
	
	
	// 1. DB 연결 
	conn = DBUtil.open();
	
	
	// 2. SQL 실행
	String sql = "select * from tblJava";
	stat = conn.createStatement();
	rs = stat.executeQuery(sql); // rs -> 결과 테이블

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
		<h1 class="page-header">테이블 목록<small></small></h1>
		
		<% 
			// 레코드를 한 개씩 접근 > 커서 이동
			while(rs.next()) {
				
				// 가르키고 있는 레코드의 데이터를 접근
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String regdate = rs.getString("regdate");
		%>
			<div><%= id %>, <%= name %>, <%= age %>, <%= regdate %></div>
		<% } %>
			
		
	</div>
	
	
	<script>

	</script>

</body>
</html>

<% 

	// 3. DB 연결 해제
	// select 작업시 > close 하단
	// - 위에서 닫아버리면 결과셋도 닫혀(rs) 참조를 할 수 없어 아래에서 닫는다.
	// - 닫을 때는 open한 순서의 역순으로 close 
	rs.close();
	stat.close();
	conn.close();

%>


