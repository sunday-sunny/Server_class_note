package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex05data.do")
public class Ex05Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 데이터 가져오기(x,y)
		// 2. DB 작업 > insert > DAO 위임
		
		String x = req.getParameter("x");
		String y = req.getParameter("y");
		String id = req.getParameter("id");
		
		AjaxDAO dao = new AjaxDAO();
		
		PointDTO dto = new PointDTO();
		dto.setX(x);
		dto.setY(y);
		dto.setId(id);
		
		dao.updatePoint(dto);
	
		
		
	}

}

