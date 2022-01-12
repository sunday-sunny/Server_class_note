package com.test.main.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/logoutok.do")
public class LogoutOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 할일
		// 1. 인증 티켓 제거
		
		HttpSession session = req.getSession();
		
		// 줬던 session은 다 뺏어야 한다.
		// 방법1) 
//		session.removeAttribute("id");
//		session.removeAttribute("name");
//		session.removeValue("lv");
		
		// 방법2) 세션 완전 초기화
		// 지우면 안되는 세션이 있을 수 있으니 주의!
		session.invalidate();
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/logoutok.jsp");
		dispatcher.forward(req, resp);
	}

}
