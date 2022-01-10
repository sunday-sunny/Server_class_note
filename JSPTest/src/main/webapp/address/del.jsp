<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 1. 데이터 가져오기(seq)
	// 2. delok.jsp에게 seq 전달하기
	
	String seq = request.getParameter("seq");
	
	
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
	<!-- add.jsp > del.jsp -->

	<div class="container">
		<h1 class="page-header">주소록 <small>삭제하기</small></h1>
		
		<form method="POST" action="/jsp/address/delok.jsp">

			<div class="btns">
				<button type="button" class="btn btn-default" onclick="location.href='/jsp/address/list.jsp'">
					<span class="glyphicon glyphicon-chevron-left">돌아가기</span>
				</button>
				
				<button type="submit" class="btn btn-primary">
					삭제하기 <span class="glyphicon glyphicon-pencil"></span>
				</button>
			</div>
			
			<inpu type="hidden" name="seq" value="<%= seq %>">
		
		</form>
		
	
	</div>
	
	
	<script>

	</script>

</body>
</html>

<% 



%>