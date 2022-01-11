package com.test.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 서블릿 업무
		// - DB 작업
		// - 데이터 가공, 조작
		
		String name = "홍길동";
		int age = 20;
		
		// 페이지 출력할 데이터에 한해 담아서 jsp에게 전달.
		req.setAttribute("name", name);
		req.setAttribute("age", age);
		
		
		// 돌려줄 HTML 페이지 제작 중단!
		// PrintWriter writer; -> X!
		
		
		// JSP 페이지 호출하기 > 업무 위임
		// URL > 반드시 슬래시로 시작(webapp 폴더 지칭)
		// web.xml에 가상주소 반드시 매핑 해주기!
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mvc/hello.jsp");
		
		
		// 페이지 이동
		dispatcher.forward(req, resp);
		
		
	}
	

}
