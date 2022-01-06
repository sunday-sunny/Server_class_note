package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02Ok extends HttpServlet{

	
	// HttpServlet의 메소드 오버라이딩 가능 
	//(ctrl + space로 오버라이딩 메소드 찾기)
	// 클라이언트 GET 요청 > doGet 메소드 실행
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Get 요청을 감지했습니다.");
	}
	

	// 클라이언트 POST 요청 > doPOST 메소드 실행
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("POST 요청을 감지했습니다.");
		
		// 클라이언트 -> 서버로 데이터를 전송하니, 한글이 깨지지 않도록 req.xxx
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		// ***
		String data = req.getParameter("data");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>결과</h1>");
		writer.println("data: " + data);
      	writer.println("</body>");
      	writer.println("</html>");
		
		writer.close();
		
		
		
	}
	
}
