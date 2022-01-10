<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	/*
		*** JDBC(Java)의 모든 SQL 작업은 자동 커밋이다. ***
		> 수동 커밋 전환 가능
		
		> 트랜잭션 제어 방법
		1. Oracle > 프로시저 > 트랜잭션 제어
		2. JDBC > Connection > 트랜잭션 제어
		
		
		1. DB연결
			- 연결 문자열(DB 서버 접속 정보)
			- Connection 클래스
		
		
		2. DB작업
			- SQL 작성 + 실행
			- Statmement 클래스 (쿼리 실행)
				a. 반환값이 없는 SQL > insert, update, delete, create, alter, drop..
					- void executeUpdate()
				b. 반환값이 있는 SQL > select
					- ResultSet exectueQuery()
			
		3. DB종료
			- Connection 클래스
			
		
		* JDBC 환경 설정(설치)
			- C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar >> 해당 파일 존재.
			- JDBC Driver 파일 > 이 파일이 있어야지만 (자바 -> 오라클) 접속 가능
				1) c드라이브 or d드라이브 루트로 복사
				2) webapp > WEB-INF > lib > ojdbc6.jar 복사
					- 원래는 라이브러리 탭에서 add하여 가져오는게 정석이나, 웹 프로젝트에 한해서 lib 폴더에 복붙 허용
	*/
	
	
	Connection conn = null;
	try {
		
		// 1. DB 접속
		conn = DBUtil.open();		
		conn.setAutoCommit(false); // 수동 트랜잭션 제어(자동 커밋 해제)
		//System.out.println(conn.isClosed());
		
		
		// 2. SQL 실행
		// 2.1) SQL 작성 > "SQL" 문자열로 작성 > 스크립트에서 짜고 테스트 해온 코드 복사해서 사용
		String sql = "insert into tblJava(id, name, age, regdate) values ('test2', '테스트', 20, default)";
		
		
		// 2.2) state -> 쿼리만 날리는 역할, DB정보는 conn이 알고 있음
		Statement stat = conn.createStatement(); 	
		
		
		// 2.3) SQL 실행 (SQL Developer > Ctrl + Enter 동일 행동)
		int reulst = stat.executeUpdate(sql);
		
		
		
		// 3. DB 접속해제
		conn.rollback(); // > rollback으로 지정해서 db에 들어가지 않음.
		conn.close();
		//System.out.println(conn.isClosed());
		
		
	} catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}
	

%>    
    
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
		<h1 class="page-header"> <small></small></h1>
	
	</div>
	
	
	<script>

	</script>

</body>
</html>