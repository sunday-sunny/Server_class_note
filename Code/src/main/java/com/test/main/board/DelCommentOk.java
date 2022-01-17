package com.test.main.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/delcommnetok.do")
public class DelCommentOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//jsp를 안 만들어서 RequestDispatcher는 삭제
		
		// 할일
		// 1. 데이터 가져오기(seq, bseq)
		// 2. DB작업 > delete > DAO 위임
		// 3. 피드백
		
		
		// 1. 
		String seq = req.getParameter("seq"); // 삭제할 댓글 번호
		String bseq = req.getParameter("bseq"); // 돌아갈 게시글(부모글) 번호
		
		// 2.
		BoardDAO dao = new BoardDAO();
		int result = dao.delComment(seq); // 1, 0
		
		// 3.
		// .jsp에서 하는 일이 alert과 페이지 이동 밖에 없어서 서블릿에서 printwriter로 처리
		if(result == 1)
			resp.sendRedirect("/code/board/view.do?seq=" + bseq);
		else {
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body><script>");
			writer.println("alert('댓글 삭제 실패😥😥'); history.back();");
			writer.println("</script></body></html>");
			writer.close();			
		}
		
	}

}

