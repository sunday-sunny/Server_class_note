<%@page import="java.util.ArrayList"%>
<%@page import="com.test.mvc.AddressDTO"%>
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


	<div class="container">
		<h1 class="page-header">주소록 <small></small></h1>
	
		<table class="table">
			<%
			ArrayList<AddressDTO> list = (ArrayList<AddressDTO>)request.getAttribute("list");
			%>
		
		
			<% for(AddressDTO dto : list) { %>
			<tr>
				<td><%= dto.getSeq() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getAge() %></td>
				<td><%= dto.getTel() %></td>
				<td><%= dto.getAddress() %></td>
			</tr>
			<% }  %>
			
		</table>
	
	</div>
	
	
	<script>

	</script>

</body>
</html>