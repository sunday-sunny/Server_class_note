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

	<!-- ex13_cookie.jsp -->
	<div class="container">
		<h1 class="page-header">쿠키, Cookie<small></small></h1>
		
		<!-- 
			쿠키, Cookies
			- 개인 정보를 저장하는 저장소
			- 브라우저가 관리
			- 방문자가 사이트를 접속했을 때 사이트가 접속한 브라우저(개인)의 정보를 관리하기 위해 사용되는 저장소
			- 단순한 문자열을 저장하는 장소(텍스트 파일)
			- 4KB 최대 크기
			- 사이트 전역 변수 역할(특정 페이지에서 종속되지 않고, 전달과정이 모든 페이지에서 액세스 가능)
			- 브라우저(PC)에 종속
			
			쿠키의 만료시간
			1. 메모리 쿠키
				- 현재 세션이 만료되면 같이 소멸
				- 브라우저가 켜져있을 동안만 관리되는 쿠키
			
			2. 하드 쿠키
				- 지정된 만료 시간까지 관리되는 쿠키
				
			
			
		 -->
		
		<input type="button" value="쿠키에 데이터 저장하기" id="btn1">
		<input type="button" value="쿠키에 저장된 데이터 가져오기" id="btn2">
		<input type="button" value="쿠키에 저장된 데이터 삭제하기" id="btn3">
		
		
	</div>
	
	
	<script>
		$('#btn1').click(function(){
			//document.cookie = "name=sunny&age=20&address=서울시";
			
			setCookie('num', 100);
			setCookie('name', 'sunny');
			
			// 하드 쿠키
			// 30일 동안은 쿠키를 지우지 않고 보관(age 값에 대해)
			setCookie('age', 20, 30);
			
		});
		
		
		$('#btn2').click(function(){
			//console.log(document.cookie);
			
			alert(getCookie('num'));
			alert(getCookie('name'));
			alert(getCookie('age'));
			
		});
		
		
		// 쿠키 지우기
		$('#btn3').click(function(){
			setCookie('age', 0, -1);
		});
	
		
	</script>

</body>
</html>