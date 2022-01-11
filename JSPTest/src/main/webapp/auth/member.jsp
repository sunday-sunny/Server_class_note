<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	// 접속한 유저가 인증 사용자인지?
	if(session.getAttribute("id") == null ) {
		
		out.print("<html><head><meta charset='utf-8'></head><body><script>alert('로그인하세요!');</script></body></html>");
		response.sendRedirect("index.jsp");
		
		
		// out.close()를 만나는 순간 아래 html 실행(X).
		// 이후 코드를 출력하지 않는다. 
		out.close();  
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

	<!-- member.jsp -->
	<div class="container">
		<h1 class="page-header">회원 전용 페이지 <small></small></h1>
	
	</div>
	
	
	<script>

	</script>

</body>
</html>