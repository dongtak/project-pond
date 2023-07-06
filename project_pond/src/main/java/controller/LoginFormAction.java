package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user.User;
import model.user.UserDao;


public class LoginFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginFormAction() {
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

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		System.out.println(1);
		UserDao userDao = UserDao.getInstance();
		System.out.println(2);
		User user = userDao.getUserById(id);
		System.out.println(3);
//		System.out.println(user.getId()+user.getPwd());

		String url = "login";
		System.out.println(4);
		if (user != null && user.getPwd().equals(pwd)) {
			url = "main";
			System.out.println(5);

			// 4. 로그인한 회원의 아이디를 -> session 에 속성값으로 저장
			HttpSession session = request.getSession();
			System.out.println(6);
			session.setAttribute("log", id);
			System.out.println(7);
		}

		if (url.equals("login")) {
			System.out.println("로그인 실패");
		} else {
			System.out.println("로그인 성공");
		}
		response.sendRedirect(url);

	}
}
