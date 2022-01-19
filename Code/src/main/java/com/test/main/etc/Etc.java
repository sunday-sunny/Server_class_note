package com.test.main.etc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.main.member.MemberDAO;
import com.test.main.member.MemberDTO;

@WebServlet("/etc/etc.do")
public class Etc extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 원래는 EtcDAO를 따로 만들어야함 > 카테고리가 바뀌면 성향이 바뀌는거니.
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/etc/etc.jsp");
		dispatcher.forward(req, resp);
	}

}

