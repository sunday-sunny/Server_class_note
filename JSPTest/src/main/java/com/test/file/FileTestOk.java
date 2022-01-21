package com.test.file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/file/filetestok.do")
public class FileTestOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// <form method="POST" action="/jsp/file/filetestok.do" enctype="multipart/form-data">
		// - request의 getParameter 정상 동작하지 않는다.
		// - cos.jar > 해결책
		
		req.setCharacterEncoding("UTF-8");
	
		
		
		try {
			// com.oreilly.servlet.MultipartRequest
			// Request -> (대신 + 파일업로드) -> MultipartRequest
			String str;
			MultipartRequest multi = new MultipartRequest(
											req,
											req.getRealPath("/files"),		// 클라이언트가 업로드한 파일을저장할 폴더위치
											1024 * 1024 * 100,				// 제한 파일 크기 100M
											"UTF-8",
											new DefaultFileRenamePolicy()	// 파일 이름 충돌시 넘버링 역할
										);
			
			
			// 진짜 실행 폴더
			// D:\class\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
			// - 여기에 업로드해서 받은 파일이 저장됨
			
			System.out.println(req.getRealPath("/files"));
			
			String txt = multi.getParameter("txt");
			System.out.println("txt : " + txt);
			
			String orgfilename = multi.getOriginalFileName("attach");	// 사용자가 올린 원본 이름
			String filename = multi.getFilesystemName("attach");		// 서버에 진짜로 저장된 이름 (이름 충돌 등으로)
			System.out.println("orgfilename: " + orgfilename);
			System.out.println("filename: " + filename);
			
			req.setAttribute("orgfilename", orgfilename);
			req.setAttribute("filename", filename);
			
		} catch (Exception e) {
			System.out.println("FileTestOk.doPost()");
			e.printStackTrace();
		}
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/file/filetestok.jsp");
		dispatcher.forward(req, resp);
	}

}

