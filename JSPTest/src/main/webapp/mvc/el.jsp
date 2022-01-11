<%@page import="com.test.mvc.AddressDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<!-- el.jsp -->
	<div class="container">
		<h1 class="page-header">EL <small></small></h1>
		
		<!--  
			EL, Expression Language
			- 표현식 언어
			- 내장 객체 안에 있는 데이터를 HTML 페이지에 출력하는 기능을 가지는 언어
		-->
		
		<p>num : <%= request.getAttribute("num") %></p>
		
		<!-- EL 형식 -->		
		<p>num : ${(num)}</p>
		<p>num : ${(num * 2)}</p>
		<p>num : ${num > 0 ? "양수" : "음수"}</p>
		<hr>

		
		<p>이름 : <%= ((AddressDTO)request.getAttribute("dto")).getName() %></p>
		<p>이름 : ${dto.getName()} </p>
		<p>이름 : ${dto.name} </p> <!-- *** .name은 == .getName을 호출한 것 *** 변수를 끌고 온게 X -->
		
		
		<!-- 
			JSTL > 프로그래밍 기능이 있는 태그
				- jar 파일을 가져와서 설치해서 사용해야함 
				- 자바가 하는 일들을 태그로 만들어둔 것(이런 류를 '액션태그'라고 한다.)
				
				1. maven repository 사이트 > JSTL검색 > 제일 많이 다운된 것 1.2버전 > JAR 파일 다운
				2. 복사해서 WEB-INF > lib에 붙여넣기
				3. 사용하려는 .jsp 파일 상단에 태그라이브러리 지시자를 넣어줘야함
				4. 모든 자원 접근은 el로 한다.
				
				
				1. 변수 생성
				2. 조건문(if, switch)
				3. 반복문(for)
				
		 -->
		
		
<%-- 		<% if((int)request.getAttribute("num") > 0 { %>
		<div>양수</div>
		<% } else { %>
		<div>음수</div>
		<% } %> --%>
		
		
		<!-- if문
			- c로 시작하는 이유는 상단에 prefix ="c"로 지정해줘서
			- else문은 없음..
		-->
		<c:if test="${num > 0}">
		<div>양수</div>
		</c:if>
		
		
		<!-- for문 
			- step의 값은 음수는 X
		-->
		<c:forEach var="i" begin="1" end ="10" step="1">
			<div>${i}</div>
		</c:forEach>
		<hr>
		
		
		<!-- 향상된 for문 
			- items : 배열
			- var	: 배열의 한 객체를 담기 위한 변수
		-->
		<table class="table">
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.name}</td>
				<td>${dto.age}</td>
				<td>${dto.tel}</td>
				<td>${dto.address}</td>
			</tr>
			</c:forEach>
		</table>
		
				
		
	</div>
	
	
	<script>

	</script>

</body>
</html>