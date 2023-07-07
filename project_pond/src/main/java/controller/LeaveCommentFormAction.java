package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LeaveCommentFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public LeaveCommentFormAction() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 1. 파라미터 값 가져오기 (id, password)
		// 2. User 조회 getUserById(id)
		// 3. 결과에 따른 페이징 처리
		// ㄴ User 객체가 null -> loginForm.jsp
		// ㄴ User 객체가 있으면
//		    ㄴ 비밀번호 일치 -> main.jsp -> welcome message 
//		    ㄴ 비밀번호 불일치 -> loginForm.jsp 

		String comment = request.getParameter("comment");
	
	
		System.out.println(comment);

		String url = "article";

		response.sendRedirect(url);
	}

}
