<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 비즈니스 코드
	request.setCharacterEncoding("UTF-8");
	
	// 컨트롤은 존재하는데 값을 입력하지 않으면 > "" 반환
	// 컨트롤이 존재하지 않으면 > null 반환
	String txt1 = request.getParameter("txt1");
	String pw1 = request.getParameter("pw1");
	String txt2 = request.getParameter("txt2");
	txt2 = txt2.replace("\r\n", "<br>");
	
	
	/* 체크박스
		1. value O	>> *사용 권장*
			a. 체크 O > value 전송
			b. 체크 X > null 전송
		2. value X
			a. 체크 O > on 전송
			b. 체크 X > null 전송
	*/
	String cb1 = request.getParameter("cb1");
	String cb2 = request.getParameter("cb2");
	String cb3 = request.getParameter("cb3");
	String cb4 = request.getParameter("cb4");
	String cb5 = request.getParameter("cb5");
	
	String temp = "";
	temp += cb3 != null ? cb3 : "";
	temp += ",";
	temp += cb4 != null ? cb4 : "";
	temp += ",";
	temp += cb5 != null ? cb5 : "";
	
	// name이 동일한 컨트롤이 2개 이상 전송될 때 사용
	String[] cb = request.getParameterValues("cb");
	
	// 라디오 > 단수(O), 복수(X)
	String rb = request.getParameter("rb");
	
	// hidden
	String id = request.getParameter("id");
	
	// select 
	String sel1 = request.getParameter("sel1");
	String[] sel2 = request.getParameterValues("sel2");
	
	String c1 = request.getParameter("c1");
	
	//
	String name = request.getParameter("name");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	table { width : 600px; }
	th { width : 120px;}

</style>

</head>
<body>

	<!-- ex04ok.jsp -->
	<div class="container">
		<h1 class="page-header">결과</h1>
		
		<table class="table table-bordered">
			<tr>
				<th>텍스트 박스</th>
				<td><%= txt1 %></td>
			</tr>
			<tr>
				<th>암호 박스</th>
				<td><%= pw1 %></td>
			</tr>
			<tr>
				<th>다중 라인 텍스트</th>
				<td><pre><%= txt2 %></pre></td>
			</tr>
			<tr>
				<th>체크 박스</th>
				<td><%= cb1 %></td>
			</tr>
			<tr>
				<th>체크 박스2</th>
				<td><%= cb2 %></td>
			</tr>
			<tr>
				<th>체크 박스들</th>
				<td><%= temp %></td>
			</tr>
			<tr>
				<th>체크 박스들2</th>
				<td><%= Arrays.toString(cb) %></td>
			</tr>
			<tr>
				<th>라디오</th>
				<td><%= rb %></td>
			</tr>
			<tr>
				<th>히든태그</th>
				<td><%= id %></td>
			</tr>
			<tr>
				<th>셀렉트박스</th>
				<td><%= sel1 %></td>
			</tr>
			<tr>
				<th>셀렉트박스2</th>
				<td><%= Arrays.toString(sel2) %></td>
			</tr>
			<tr>
				<th>html5</th>
				<td><%= c1 %></td>
			</tr>
			<tr>
				<th>User Control</th>
				<td><%= name %></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
		</table>
	</div>
	

</body>
</html>