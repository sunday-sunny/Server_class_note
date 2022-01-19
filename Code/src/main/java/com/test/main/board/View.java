package com.test.main.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*** 검색 기능 ***/
		// 호출
		// 1. list.do	> 목록보기
		// 2. list.do?column=subject&word=테스트 > 검색하기
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String searchmode = "n";
		
		// search 유무 check
		if((column == null && word == null) || (column.equals("") && word.equals("")))
			searchmode = "n";
		else 
			searchmode = "y";
		
		
		
		// 할일 
		// 1. 데이터 가져오기(seq)
		// 2. DB작업 > select > DAO 위임
		// 2.3 조회수 증가
		// 2.5 데이터 조작 (개행처리)
		// 2.7 댓글 가져오기
		// 3. 반환값 전달 + JSP 호출하기
		
		// 1.
		String seq = req.getParameter("seq");
		String page = req.getParameter("page");
		
		
		// 2.
		BoardDAO dao = new BoardDAO();
		
		
		// 2.3 조회수 증가
		// 해당 페이지에서 새로고침 했을 때 > 조회수 증가하지 X 도록 조건.
		HttpSession session = req.getSession();
		if(session.getAttribute("readcount") != null 
				&& session.getAttribute("readcount").toString().equals("n")) {
			dao.addReadCount(seq);
			session.setAttribute("readcount", "y");
		}
		
		
		BoardDTO dto = dao.get(seq);
		
		
		// 2.5
		// 제목과 내용에 들어있는 태그를 비활성화
		dto.setSubject(dto.getSubject().replace("<", "&lt;").replace(">", "&gt;"));
		dto.setContent(dto.getContent().replace("<", "&lt;").replace(">", "&gt;"));
		
		// 개행 문자 처리
		dto.setContent(dto.getContent().replace("\r\n", "<br>"));
		
		// 내용에서 검색 중 > 검색어 강조!
		if(searchmode.equals("y") && column.equals("content")) {
			dto.setContent(dto.getContent().replace(word, "<span style='background-color:mistyrose;color:tomato;'>" + word + "</span>"));
		}
		
		
		// 2.7
		ArrayList<CommentDTO> clist = dao.listComment(seq);
		for(CommentDTO cdto : clist) {
			cdto.setContent(cdto.getContent().replace("\r\n", "<br>"));
		}
		
		
		// 3.
		req.setAttribute("dto", dto);
		/* 검색 */
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		/* 댓글 */
		req.setAttribute("clist", clist);
		/* 페이지 */
		req.setAttribute("page", page);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(req, resp);
	}

}

