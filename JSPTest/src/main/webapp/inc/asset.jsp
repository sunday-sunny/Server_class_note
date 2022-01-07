<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- asset.jsp -->


<link rel="stylesheet" href="<%= request.getContextPath() %>/asset/css/bootstrap.css">

<!-- context root가 변경될 경우를 대비 & 장기간 운용을 위해서는
직접 경로를 넣는게 아니라 request.getContextPath()를 넣어 관리한다. -->
<script src="<%= request.getContextPath() %>/asset/js/jquery-1.12.4.js"></script>
<script src="<%= request.getContextPath() %>/asset/js/bootstrap.js"></script>
<script src="<%= request.getContextPath() %>/asset/js/cookie.js"></script>