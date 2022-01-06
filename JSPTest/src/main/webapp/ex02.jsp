<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "Sunny";
	int age = 20;
	String color = "lightblue";
	String txt = "<input type='text'>";
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="inc/asset.jsp" %>

<style>

	h1 {
		border-bottom : 1px solid <%= color %>
	}

</style>


</head>
<body>

	<!-- ex02.jsp -->
	<h1 style="color: <%= color %>;" id="title"><%= name %></h1>
	<p><%= txt %></p>
	
	<%@ include file="inc/copyright.jsp" %>
	
	
	<script>
		document.getElementById("title").onclick = function(){
			alert("<%= age %>");
		};
	
	</script>
	

</body>
</html>