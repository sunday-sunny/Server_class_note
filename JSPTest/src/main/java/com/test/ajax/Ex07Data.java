package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex07data.do")
public class Ex07Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			// 이 구문을 만나면 하던 일을 멈추고 3초 동안 멈춰라
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		int begin = Integer.parseInt(req.getParameter("begin"));
		
		AjaxDAO dao = new AjaxDAO();
		ArrayList<BoardDTO> list = dao.listBoard(begin);
		
		/*
		[
			{
				"subject": "제목",
				"content": "내용",
				"name": "이름",
				"id": "아이디",
				"regdate" : "날짜"
			}
		]
		*/
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();
		String temp = "";
		
		temp += "[";
		
		for(BoardDTO dto : list ) {
			temp += "{";
				temp += String.format("\"subject\": \"%s\",", dto.getSubject());
				temp += String.format("\"content\": \"%s\",", dto.getContent());
				temp += String.format("\"name\": \"%s\",", dto.getName());
				temp += String.format("\"id\": \"%s\",", dto.getId());
				temp += String.format("\"regdate\" : \"%s\"", dto.getRegdate());
			temp += "},";
		}
		
		if(list.size() > 0) 
			temp = temp.substring(0, temp.length()-1);
		temp += "]";
		
		
		
		writer.print(temp);
		writer.close();
		
		
	}

}
