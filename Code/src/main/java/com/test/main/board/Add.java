package com.test.main.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 할일
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("id") == null) {
			resp.sendRedirect("/code/member/member.do");
			//응답이 이미 커밋된 후에는 forward할 수 없습니다.
			// sendRedirect 이후에는 dispatcher로 forward 할 수 없어서 나는 에러
			
			return;
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		dispatcher.forward(req, resp);
	}

}
