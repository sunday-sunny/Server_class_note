<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>
   .container > div { margin: 10px 0; }
</style>
</head>
<body>
   <!-- openapi > map.jsp -->
   <div class="container">
      <h1 class="page-header">Map API <small>Kokao Map</small></h1>
      
      <div><input type="button" value="π μ²«λ²μ§Έ μ§λ" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?01', 'child', '');"></div>
      
      <div><input type="button" value="μ’ν, λλκ·Έ, νλ/μΆμ" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?02', 'child', '');"></div>
      
      <div><input type="button" value="π λ§μ»€ μ μ΄νκΈ°1" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?03', 'child', '');"></div>
      
      <div><input type="button" value="π λ§μ»€ μ μ΄νκΈ°2" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?04', 'child', '');"></div>
      
      <div><input type="button" value="π λ§μ»€ μ μ΄νκΈ°3" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?05', 'child', '');"></div>
         
   </div>
   
   <script>
   
   </script>
</body>
</html>






