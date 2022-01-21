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
	<!-- filetestok.jsp -->
	<div class="container">
		<h1 class="page-header">파일 업로드 결과 + 파일 다운로드 <small></small></h1>

		<div>첨부 파일 다운로드 : <a href="/jsp/files/${filename}">${orgfilename}</a></div>
		<div>첨부 파일 다운로드 : <a href="/jsp/files/${filename}" download>${orgfilename}</a></div>
		<div>첨부 파일 다운로드 : <a href="/jsp/file/download.do?filename=${filename}&orgfilename=${orgfilename}">${orgfilename}</a></div>
		
	</div>

	<script>
   
   </script>
</body>
</html>






