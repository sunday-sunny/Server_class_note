package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02 extends HttpServlet{
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
//		서버 -> 클라이언트로 페이지를 전송하니, 한글이 깨지지 않도록 resp.xxx
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>데이터 전송하기</h1>");
		
//      서버측의 가상 주소의 '/'과 같은 의미 (/servlet == '/')
      	writer.println("<form action='/servlet/ex02ok.do' method='POST'>");
      	writer.println("<div>데이터 : <input type='text' name='data'></div>");
      	writer.println("<div><input type='submit' value='전송하기'></div>");
      	writer.println("</form>");
      	writer.println("<h2>링크</h2>");
      	writer.println("<a href='/servlet/ex02ok.do?data=100'>페이지 이동하기</a>");
      	writer.println("<h2>버튼</h2>");
      	writer.println("<input type='button' value='버튼' onclick='location.href=\"/servlet/ex02ok.do?data=200\"'>");
      	writer.println("</body>");
      	writer.println("</html>");
		
		writer.close();
		
		
		/*
		http://localhost:8090/servlet/ex02.do
		'servelt' -> context root
		
		404 에러 > url 잘못된 경우!, 주소를 잘못 적음
		500	에러 > 자바 쪽(서블릿)에서 에러 난 것 (오타 등)
		
		405 에러 > 허용되지 않는 메소드
			- HTTP 메소드인 POST는 이 URL에 의해 지원되지 않습니다.
			- POST로 요청했는데, POST 요청을 받을 수 있는 메소드가 없음
			- 요청에 맞는 메소드가 없어서 일어나는 에러.
		*/
		
		
	}

}
