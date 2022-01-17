package com.test.main.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*** 게시판, 검색 기능 ***/
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
		
		
		// 1회용으로 쓸 DTO > HashMap
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("word", word);
		map.put("searchmode", searchmode);
		
		
		
		/*** 페이징 ***/
		// list.do == list.do?page=1
		// list.do?page=3
		int nowPage = 0;		// 현재 페이지 번호 
		int totalCount = 0;
		int pageSize = 10;		// 한페이지당 출력할 게시물 수
		int totalPage = 0;
		int begin = 0;			// where 시작 위치
		int end = 0;			// where 끝 위치
		int n = 0;
		int loop = 0;
		int blockSize = 10;
		
		String page = req.getParameter("page");
		
		if(page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		// nowPage > 현재 보게될 페이지 번호
		// list.do?page=1 > where rnum between 1 and 10
		// list do?page=2 > where rnum between 11 and 20
		// list do?page=3 > where rnum between 21 and 30
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		
		
		/*** 게시판, 게시물 목록 보기 기능 ***/
		// 할일
		// 1. DB작업 > select > DAO 위임
		// 1.5 데이터 조작
		// 2. 반환값 전달 + JSP 호출
		
		
		// 1. 
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> list = dao.list(map);
		
		// 1.5
		Calendar now = Calendar.getInstance();
		String strNow = String.format("%tF", now); // "2022-01-13"
		
		
		for(BoardDTO dto : list) {
			// 날짜 자르기
			if(dto.getRegdate().startsWith(strNow))
				dto.setRegdate(dto.getRegdate().substring(11, 16));
			else
				dto.setRegdate(dto.getRegdate().substring(0, 10));
			
			// 제목 자르기
			if(dto.getSubject().length() > 20)
				dto.setSubject(dto.getSubject().substring(0, 20) + "...");
			
			// 제목에서 검색 중 > 검색어 강조!
			if(searchmode.equals("y") && column.equals("subject")) {
				dto.setSubject(dto.getSubject().replace(word, "<span style='background-color:mistyrose; color:tomato';>" + word + "</span>"));
			}
		}
		
		
		// 조회수 증가 제어용 티켓
		HttpSession session = req.getSession();
		session.setAttribute("readcount", "n");
		
		
		// 페이지바
		
		// 총 게시물 수? > 163
		// 총 페이지 수? > 163 / 10 = 16.3 > 17페이지
		
		totalCount = dao.getTotalCount(map); // 검색 기능 때문에 map을 넘김
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		
		String pagebar = "";
		
		// 페이지 번호 > 루프 > 링크 생성

		
		// 해당 범위 내 페이지를 볼 때는 항상 같은 페이지바
		// list.do?page=1
		// 1 2 3 4 5 6 7 8 9 10
		
		// list.do?page=11
		// 11 12 13 14 15 16 17 18 19 20
		
		loop = 1; // 루프변수(while)
		n = ((nowPage - 1) / blockSize) * blockSize + 1; // 페이지 번호

		
		pagebar += "<nav><ul class=\"pagination\">";
		
		// 이전 10페이지
		if(n == 1)
			pagebar += String.format("<li class='disabled'><a href='#!' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		else
			pagebar += String.format("<li><a href='/code/board/list.do?page=%d' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>", n-1);
		
		
		// 페이지 btn 생성
		while(!(loop > blockSize || n > totalPage)) {
			if(n == nowPage)
				pagebar += String.format("<li class='active'><a href='#!'>%d</a></li>", n);
			else 
				pagebar += String.format("<li><a href='/code/board/list.do?page=%d'>%d</a></li>", n, n);
			
			loop++;
			n++;
		}
		

		// 다음 10페이지
		if(n > totalPage)
			pagebar += String.format("<li class='disabled'><a href='#!' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		else
			pagebar += String.format("<li><a href='/code/board/list.do?page=%d' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>", n);
		
		
		pagebar += "</ul></nav>";
		
		
		
		// 2. 
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}
