<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% 
	// POST 방식으로 전송된 데이터 때문에 인코딩 처리(깨짐)
	// GET 방식은 UTF-8로 전송되기 떄문에 깨지지 X
	//request.setCharacterEncoding("UTF-8");
	String data = request.getParameter("data");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ex03ok.jsp -->
	<h1>데이터 받기</h1>
	
	<p>data : <%= data %> ✨✨</p>
	


</body>
</html>