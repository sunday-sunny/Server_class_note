package com.test.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	public static Connection open() {
		
		// 1. DB 연결
		Connection conn = null; //interface로 가져오기
		
		// 연결 문자열(Connection String)
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; // Developer에서 설정한 정보
	    String id = "hr";
	    String pw = "java1234";
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DB 접속한 정보를 가지고 있는 Connection 객체 생성
			// conn = new Connection(); -> (X)		
			// 객체 인터페이스를 DriverManager를 통해 만들어야함.
			conn = DriverManager.getConnection(url, id, pw); // DB객체 + Connection 객체 생성
			
			
			
			return conn;
			
		} catch(Exception e) {
			System.out.println("오류!");
			e.printStackTrace();
		}
		
		return null;
	}

}
