<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
	/* 
		1. 데이터 가져오기(id, pw)
	 	2. DB 작업 > select
	 	3. 결과
	 		a. 성공 > 인증 티켓 발급 > 피드백
	 		b. 실패 > 피드백
	*/
	
	
	// 1.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 2.
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	boolean result = false;
	
	conn = DBUtil.open();
	stat = conn.createStatement();
	
	String sql = String.format("select * from tblUser where id = '%s' and pw = '%s'", id, pw);
	rs = stat.executeQuery(sql);
	
	if(rs.next()){
		// 로그인 성공 > 인증 티켓 발급(***)
		result = true;
		
		session.setAttribute("id", id); // 인증 티켓(***)
		session.setAttribute("name", rs.getString("name"));
		session.setAttribute("lv", rs.getString("lv"));
		
		
	}
	else {
		// 로그인 실패
		result = false;
	}

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

	<!-- loginok.jsp -->
	<div class="container">
		<h1 class="page-header">로그인 <small></small></h1>
		
		<%= result %>
		
	</div>
	
	
	<script>
		<% if(result) { %>
			location.href = 'index.jsp';
		<% } else { %>
			alert('실패');
			history.back();
		<% } %>

	</script>

</body>
</html>