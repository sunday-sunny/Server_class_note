package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex02bok.do")
public class Ex02BOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		AjaxDAO dao = new AjaxDAO();
		int count = dao.count();
		
		/* 브라우저 요청 (보통의 경우) */
		// 1. RequestDispatcher > JSP 호출하기 > HTML 생성 + 반환
		// 2. 다른 페이지로 이동
		
		
		/* Ajax 요청 */
		PrintWriter writer = resp.getWriter();
		writer.print(count + "");
		writer.close();
		
		
	}

}

