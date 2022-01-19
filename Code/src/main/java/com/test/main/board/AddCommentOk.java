package com.test.main.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/addcommentok.do")
public class AddCommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//jsp를 안 만들어서 RequestDispatcher는 삭제
		
		// 할일
		// 1. POST > 인코딩 처리
		// 2. 데이터 가져오기(content, bseq)
		// 3. DB 작업 > insert > DAO 위임
		// 4. 피드백
		
		
		// 1. 
		req.setCharacterEncoding("UTF-8");
		
		// 2.
		String content = req.getParameter("content");
		String bseq = req.getParameter("bseq");
		
		HttpSession session = req.getSession();
		
		// 3.
		BoardDAO dao = new BoardDAO();
		CommentDTO cdto = new CommentDTO();
		cdto.setContent(content);
		cdto.setBseq(bseq);
		cdto.setId(session.getAttribute("id").toString());
		
		int result = dao.addComment(cdto); // 1, 0

		
		// 4. 
		// .jsp에서 하는 일이 alert과 페이지 이동 밖에 없어서 서블릿에서 printwriter로 처리
		if(result == 1)
			resp.sendRedirect("/code/board/view.do?seq=" + bseq);
		else {
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body><script>");
			writer.println("alert('댓글 달기 실패😅😅'); history.back();");
			writer.println("</script></body></html>");
			writer.close();			
		}
		
		
	}

}

