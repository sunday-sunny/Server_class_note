<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>

<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
</head>
<body>

	<!--  -->
	<div class="container">
		<h1 class="page-header">Open API <small>Naver Books</small></h1>
	
		<div class="well">
			<form method="GET" action="">
				<input type="text" name="query" class="form-control" vaue="${query}">
				<input type="submit" value="검색하기" class="btn btn-default">
			</form>
		</div>
		
		<table class="table table-bordered">
			<tr>
				<th>표지</th>
				<th>제목</th>
				<th>저자</th>
				<th>출판사</th>
				<th>출간일</th>
				<th>가격</th>
			</tr>
			
			<c:if test="${empty list}">
			<tr>
				<td colspan="6">도서가 없습니다.</td>
			</tr>
			<</c:if>
			
			<c:forEach items="${list}" var="dto">
			<tr>
				<td><img src="${dto.image}"></td>
				<td>${dto.title}</td>
				<td>${dto.author}</td>
				<td>${dto.publisher}</td>
				<td>${dto.pubdate}</td>
				<td>
					<div style="text-decoration:line-through;">${dto.price}원</div>
					<div style="color:conflowerblue;">${dto.discount}원</div>
				</td>
				
			</tr>
			</c:forEach>
		
		</table>
		
		<div>
			<c:forEach var="i" begin="1" end="${map.totalPage}">
				<a href="/jsp/openapi/book.do?query=${query}&page=${i}">${i}</a>
			</c:forEach>
		</div>
	
	
	</div>

	<script>
	
	</script>

</body>
</html>