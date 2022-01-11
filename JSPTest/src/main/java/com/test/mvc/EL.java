package com.test.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/el.do")
public class EL extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			//el.do?seq=5
			String seq = req.getParameter("seq");
		
			AddressDAO dao = new AddressDAO();
			AddressDTO dto = dao.get(seq); // 레코드 한 줄 받아올 것.
			ArrayList<AddressDTO> list = dao.list();
			
			req.setAttribute("num", 100);
			req.setAttribute("color", "노랑");
			
			req.setAttribute("dto", dto);
			req.setAttribute("list", list);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/mvc/el.jsp");
			dispatcher.forward(req, resp);
			
	
	}

}
