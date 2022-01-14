<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<!-- board/addok.jsp > board/editok.jsp > board/delok.jsp-->
	
	<main class="main">
		<%@include file="/WEB-INF/views/inc/header.jsp" %>
		<section class="content">
			
		</section>
		<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	</main>	

	
	<script>
		
		//성공
		<c:if test="${result == 1}">
			location.href= '/code/board/list.do';
		</c:if>
		
		// 실패
		<c:if test="${result == 0}">
			alert('글 삭제 실패 😥😥');
			history.back();
		</c:if>
		
		
	</script>

</body>
</html>