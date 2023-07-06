package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user.User;
import model.user.UserDao;

/**
 * Servlet implementation class LoginFormAction
 */
@WebServlet("/LoginFormAction")
public class LoginFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginFormAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
