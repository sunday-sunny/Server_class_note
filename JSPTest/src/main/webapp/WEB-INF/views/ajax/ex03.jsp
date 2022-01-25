<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<!-- ex03.jsp -->
	<div class="container">
		<h1 class="page-header">Ajax + 데이터 주고받기 <small></small></h1>
		
		<h4>보내기(X), 가져오기(O) + 단일 데이터(원자값)</h4>
		<div class="well txt1"></div>
		<input type="button" value="데이터 가져오기" id="btn1" class="btn btn-default">
		
		
		<h4>보내기(O) + 단일 데이터, 가져오기(O) + 단일 데이터(원자값)</h4>
		<div class="well txt2"></div>
		<input type="text" id="seq" class="form-control">
		<input type="button" value="데이터 가져오기" id="btn2" class="btn btn-default">


		<h4>보내기(X), 가져오기(O) + 다중 데이터(1컬럼, N행)</h4>
		<div class="well txt3"></div>
		<input type="button" value="데이터 가져오기" id="btn3" class="btn btn-default">
		
		
		<h4>보내기(O) + 단일 데이터, 가져오기(O) + 다중 데이터(N컬럼, 1행)</h4>
		<div class="well txt4"></div>
		<input type="button" value="데이터 가져오기" id="btn4" class="btn btn-default">
		
		
		<h4>보내기(X), 가져오기(O) + 다중 데이터(N컬럼, N행)</h4>
		<div class="well txt5"></div>
		<input type="button" value="데이터 가져오기" id="btn5" class="btn btn-default">
		
		<!-- 회원가입 -->		
		<h4>보내기(O) + 다중 데이터, 가져오기(O) + 다중 데이터(N컬럼, N행)</h4>
		<div class="well txt6"></div>
		<form id="form1">
			<div><input type="text" name="id" placeholder="아이디"></div>
			<div><input type="text" name="pw" placeholder="암호"></div>
			<div><input type="text" name="name" placeholder="이름"></div>
		</form>
		
		<input type="button" value="데이터 보내기" id="btn6" class="btn btn-default">
		
		
	</div>

	<script>
		$('#btn1').click(()=> {
			
			$.ajax({
				type : 'GET',
				url : '/jsp/ajax/ex03data.do',
				success : function(result){
					$('.txt1').text('@' + result + '@');
				}
			});
		});
		
		
		$('#btn2').click(()=>{
			// 게시판
			// 글번호 전달 > 제목 반환
			$.ajax({
				type : 'GET',
				url : '/jsp/ajax/ex03data.do',
				data : 'seq=' + $('#seq').val(), //ajax가 서버로 보낼 데이터(QueryString 형식으로 작성)
				success : function(subject) {
					$('.txt2').text(subject);
				}
			});	
		});
		
		
		$('#btn3').click(()=>{
			
			$.ajax({
				type : 'GET',
				url : '/jsp/ajax/ex03data.do',
				
				// 서버 -> (데이터) -> 클라이언트
				// 1. 텍스트
				// 2. XML
				// 3. JSON
				dataType : 'JSON',
				success : function(result) {
					result.forEach((item) => {
						$('.txt3').append('<div>' + item.subject +'</div>');
					});
				}
			});
		});
		
		
		/* $('#btn4').click(()=> {
			// 아이디 전달 -> 회원 정보 반환
			
			$.ajax({
				
				type : 'GET',					// 요청
				url : '/jsp/ajax/ex03data.do'	// 요청
				data : 'id=hong',				// 요청
				
				dataType : 'json',				// 응답
				success : function(dto){		// 응답
					
					// `` : template string(ES6), String.format() 역할
					// jsp에서 사용시에는 $ 앞에 \를 붙여줘야함
					$('.txt4').append(`<div>\${dto.id}</div>`);
					$('.txt4').append(`<div>\${dto.pw}</div>`);
					$('.txt4').append(`<div>\${dto.name}</div>`);
					$('.txt4').append(`<div>\${dto.lv}</div>`);
				}
			
			});
			
		});
		
		
		
		$('#btn5').click(()=>{
			// 회원 목록 가져오기(N행 N열)
			$.ajax({
				
				type : 'GET',
				url : '/jsp/ajax/ex03data.do',
				dataType : 'json',
				success : function(list) {
					list.forEach((item)=>{
						$('.txt5').append(`<div>\${dto.id}</div>`);
						$('.txt5').append(`<div>\${dto.pw}</div>`);
						$('.txt5').append(`<div>\${dto.name}</div>`);
						$('.txt5').append(`<div>\${dto.lv}</div>`);
						$('.txt5').append('<hr>');
						
					});
				}
				
			});
			
		}); */
		
		
		$('#btn6').click(()=>{
			
			//jQuery
			// alert($('#form1').serialize()); // *** 쿼리스트링을 만들어줌
			
			// 회원가입
			$.ajax({
				type : 'POST',
				url : '/jsp/ajax/ex03data.do',
				//data : 'id=' + $('input[name=id]').val() + '&pw=' + $('ipnut[name=pw]').val() + '&name=' + $('input[name=name]').val(),
				
				data : $('#form1').serialize(),
				
				success: function(result){
					$('.txt6').text(result.result);
				}
			});
			
		});
		
		
		
   
   </script>
</body>
</html>






