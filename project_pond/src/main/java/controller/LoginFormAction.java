package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.admin.Admin;
import model.admin.AdminDao;
import model.user.User;
import model.user.UserDao;

/**
 * Servlet implementation class LoginFormAction
 */
public class LoginFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// 1. 파라미터 값 가져오기 (id, password)
		// 2. User 조회 getUserById(id)
		// 3. 결과에 따른 페이징 처리
		// ㄴ User 객체가 null -> loginForm.jsp
		// ㄴ User 객체가 있으면
//		    ㄴ 비밀번호 일치 -> main.jsp -> welcome message 
//		    ㄴ 비밀번호 불일치 -> loginForm.jsp 

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");


		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(id);
		
		String url = "login";
		boolean isAdmin = false;
		
		if(user!=null&&user.getPwd().equals(pwd)) {
			url = "main";
			session.setAttribute("log", id);
			session.setAttribute("isAdmin", isAdmin);
		}else {
			AdminDao adminDao = AdminDao.getInstance();
			Admin admin = adminDao.getAdminById(id);
			if(admin!=null&&admin.getAdmin_pwd().equals(pwd)) {
				url = "main";
				isAdmin=true;
				session.setAttribute("log", id);
				session.setAttribute("isAdmin", isAdmin);
			}
		}

		if (url.equals("login")) {
			System.out.println("로그인 실패");
		} else {
			System.out.println("로그인 성공");
		}
		response.sendRedirect(url);
	}

}
