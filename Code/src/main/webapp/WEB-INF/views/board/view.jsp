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

	<!-- board/add.jsp > board/view.jsp-->
	<main class="main">
		<%@include file="/WEB-INF/views/inc/header.jsp" %>
		<section class="content">
			
			<!-- 글작성 폼 -->
			<table class="table table-bordered add">
				<tr>
					<th>이름</th>
					<td>${dto.name}(${dto.id}) <small>${dto.userip}</small></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${dto.regdate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${dto.readcount}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="height: 300px;">${dto.content}</td>
				</tr>
			</table>
			
			<!-- btn -->
			<div class="btns">
				<input type="button" value="돌아가기"
					class="btn btn-default"

					onclick="location.href='/code/board/list.do?column=${column}&word=${word}&page=${page}';">
				
				<c:if test="${not empty id}">
            	<input type="button" value="답변쓰기"
               		class="btn btn-success"
               		onclick="location.href='/code/board/add.do?reply=1&thread=${dto.thread}&depth=${dto.depth}';">   
            	</c:if>
				
				<c:if test="${not empty id && dto.id == id}">	
				<input type="button" value="수정하기"
					class="btn btn-primary"
					onclick="location.href='/code/board/edit.do?seq=${dto.seq}';">
				
				<input type="button" value="삭제하기"
					class="btn btn-danger"
					onclick="location.href='/code/board/del.do?seq=${dto.seq}';">
				</c:if>
			</div>
			
			
			<!-- 댓글 기능 -->
			<!--  댓글 목록 테이블	-->		
			<table class="table table-bordered comment">
				<c:forEach items="${clist}" var="cdto">
				<tr>
					<td>
						${cdto.content}
						<small>${cdto.name}(${cdto.id}) ${cdto.regdate}</small></td>
					<td>
						<c:if test ="${cdto.id == id}">
						<input type="button" value="삭제" 
							class="btn btn-default"
							onclick="location.href='/code/board/delcommnetok.do?seq=${cdto.seq}&bseq=${dto.seq}';">
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<!--  댓글 입력 폼 -->
			<form method="POST" action="/code/board/addcommentok.do">
				<table class="addcomment">
					<tr>
						<td><textarea name="content" class="form-control" required></textarea></td>
						<td><input type="submit" value="댓글쓰기" class="btn btn-primary"></td>
					</tr>
				</table>
				<input type="hidden" name="bseq" value="${dto.seq}">
			</form>
			
			
		</section>
		<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	</main>	

	
	<script>

	</script>

</body>
</html>