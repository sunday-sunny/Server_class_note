<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp"%>
<style>
</style>
</head>
<body>

	<!-- ex01.jsp -->
	<div class="container">
		<h1 class="page-header">Ajax <small>ajax</small></h1>

		<div class="well" id="txt1"></div>
		<input type="button" value="버튼1" id="btn1" class="btn btn-default">


	</div>

	<script>
		$('#btn1').click(() => {
		   // DB의 데이터를 가져와서 화면에 출력하기
		   // location.href ='/jsp/ajax/ex01ok.do';
		   
		   /* jQuery Ajax */
		   //$('태그').css(); >> 보통의 제이쿼리
		   
		   
		   // jQuery 전역 함수
		   // $.ajax() > 서버에게 데이터 요청 > 응답 데이터 수신 > 업무 처리
		   $.ajax({
			   
			   
			   type : 'GET',						// 요청 메소드 <form method="">
			   url : '/jsp/data/data.txt',			// 요청 대상(서버 프로그램 주소) <form action="">, 보통은 여기에 서블릿이 옴! 
			   
			   // 데이터를 돌려받는 순간 발생하는 함수
			   // result라는 매개변수에 데이터가 담겨서 함수가 호출됨..
			   success : function(result){			// 콜백 함수 > 응답 이벤트 함수
				   $('#txt1').text(result);
			   }
		   });
		   
		   
		   
	   });
   
   
   </script>
</body>
</html>






