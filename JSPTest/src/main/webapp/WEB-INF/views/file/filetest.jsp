<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp"%>
<style>
	form > div {
		margin-bottom : 15px;
	}

</style>
</head>
<body>
	<!-- filetest.jsp -->
	<div class="container">
		<h1 class="page-header">파일보내기<small>cos</small></h1>

		<form method="POST" action="/jsp/file/filetestok.do" enctype="multipart/form-data">
			<div>텍스트 : <input type="text" name="txt"></div>
			<div>첨부파일 : <input type="file" name="attach"></div>
			<div><input type="submit" value="보내기"></div>
		
		</form>
		
		
	</div>

	<script>
   
   </script>
</body>
</html>






