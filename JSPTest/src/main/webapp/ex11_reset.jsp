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

	<!-- ex11_reset.jsp -->
	<div class="container">
		<h1 class="page-header"> <small></small></h1>
	
		<%
			// 세션 전체를 초기 상태로... > 새로 만들기
			// -> 모든 저장된 데이터 삭제
			
			session.invalidate();
		
		%>
	
		<a href="ex11_session.jsp">돌아가기</a>
		
	
	</div>
	
	
	<script>

	</script>

</body>
</html>