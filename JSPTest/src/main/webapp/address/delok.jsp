<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 1. 데이터 가져오기
	// 2. DB 작업 > delete
	// 3. 피드백
	
	
	// 1. 
	String seq = request.getParameter("seq");

	
	// 2.
	Connection conn = null;
	Statement stat = null;
	
	conn = DBUtil.open();
	String sql = "delete from tblAddress where seq = " + seq;
	stat = conn.createStatement();
	
	int result = stat.executeUpdate(sql);
	
	stat.close();
	stat.close();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<%@ include file="/inc/asset.jsp" %>
<%@ include file="/address/inc/asset.jsp" %>
<style>

</style>
</head>
<body>

	<!-- template.jsp > addok.jsp > delok.jsp -->
	<div class="container">
		<h1 class="page-header">주소록 <small>삭제하기</small></h1>
		
	
	</div>
	
	
	<script>
		
	
		<% if (result == 1) { %>
		// 성공
		location.href = '/jsp/address/list.jsp';
		<% } else { %>
		// 실패
		alert('삭제 실패 😥😥');
		history.back(); // 전 페이지로 돌아가도 작성 내용이 남아있음.(location.href -> x 내용 지워짐)
		<% } %>
	
	
	</script>

</body>
</html>

<% 



%>