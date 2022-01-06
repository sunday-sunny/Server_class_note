package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. 서블릿 클래스 선언
//a. javax.servlet.http.HttpServlet 클래스를 상속받는다. > 간편함 > 선택
public class Hello extends HttpServlet{
	
	//2. doGet/doPost 메소드 선언
	//a. 매개변수 작성(2개)
	//b. 예외 미루기
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		
		//3. 동적 HTML 문서 작성 구현
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.print("<html>");
		writer.print("<head>");
		writer.print("<meta charset='utf-8'>");
		writer.print("<title>Hello</title>");
		writer.print("</head>");
		writer.print("<body>");
		writer.print("<h1>Hello World!</h1>");
		writer.print("<p>서블릿으로 만든 페이지입니다! 테스트!</p>");
		writer.print("</body>");
		writer.print("</html>");
		
		writer.close();
		
		// Ctrl + F11
		// 자바 파일은 웹(http://)에서 호출이 불가능하다.
		
		
		// 자바를 브라우저를 통해서 호출할 방법 필요!
		// - 가상주소
		// web.xml에서 가상 주소를 만들어줘야 페이지가 뜸
		// .do는 임의로 적는것,,

		
		// 자바 파일의 컴파일
		// 1. Ctrl + F11	> 사전 준비용
		// 2. 브라우저 요청 > 정석
		
		
	}
	
	
	
}
