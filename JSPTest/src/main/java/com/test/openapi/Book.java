package com.test.openapi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/openapi/book.do")
public class Book extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

String query = req.getParameter("query"); //검색어
		
		if (query != null && !query.equals("")) {
			
			int page = 1;
			
			if (req.getParameter("page") != null) {
				page = Integer.parseInt(req.getParameter("page"));
			}
			
			//1 -> 11
			//2 -> 21
			//3 -> 31
			
			int start = page * 10 + 1;
			
			BookDAO dao = new BookDAO();
			
			ArrayList<BookDTO> list = dao.list(query, start);
			HashMap<String,Integer> map = dao.getPageInfo(query, start);
			
			req.setAttribute("list", list);
			req.setAttribute("query", query); //상태 유지
			req.setAttribute("map", map);
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/openapi/book.jsp");
		dispatcher.forward(req, resp);
	}

}

