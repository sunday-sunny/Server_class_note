package com.test.openapi;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/openapi/map.do")
public class Map extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// map.do?01
		String no = req.getQueryString();
		
		if(no == null) no = "";
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/openapi/map" + no + ".jsp");
		dispatcher.forward(req, resp);
	}

}
