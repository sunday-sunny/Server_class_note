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


	<div class="container">
		<h1 class="page-header">로그인<small></small></h1>
	
		<table class="table table-bordered" style="width: 300px">
        	<tr>
            	<th>아이디</th>
            	<td><input type="text" id="txtid" class="form-control"></td>
         	</tr>
         	<tr>
	            <th>암호</th>
	            <td><input type="password" id="txtpw" class="form-control"></td>
         	</tr>
      	</table>
      	<label><input type="checkbox" id="cb"> 아이디 기억하기</label>
        <input type="button" value="로그인" class="btn btn-default">
	
	</div>
	
	
	<script>
		$("input[type=button]").click(function(){
			
			// 로그인한 아이디를 쿠키에 저장하기
			if($('#cb').prop('checked')) {
				setCookie('txtid', $('#txtid').val(), 365);
			}
		});
		
		//alert(getCookie('txtid') === "");
		
		if(getCookie('txtid') != ""){
			$('#txtid').val(getCookie('txtid'));
			$('#cb').prop('checked', true);
			$('#txtpw').focus();
		}
		else {
			$('#txtid').focus();
		}
		
	
	</script>

</body>
</html>