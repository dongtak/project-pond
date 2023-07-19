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
import model.user.UserRequestDto;
public class UpdateUserFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserFormAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("update");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserRequestDto userDto = null;
		// 입력값 받아오기

		String id = request.getParameter("id");
		System.out.println(id + "id");
		
		
		String inputPwd = request.getParameter("password");
		System.out.println(inputPwd + "inputPwd");
		String inputNewPwd = request.getParameter("new-password");
		System.out.println(inputNewPwd + "inputNewPwd");
		
		
		
		UserDao userDao = UserDao.getInstance();

		if(inputPwd!=null) {
			System.out.println("비밀번호 변경"+inputPwd);
			userDto = new UserRequestDto(id, inputPwd);
			userDao.updateUser(userDto,inputNewPwd);
		}
		
		User user = userDao.getUserById(id);

		
		
		String password = user.getPwd();
		System.out.println(password + "=password???");
		session.setAttribute("pwd", password);
		response.sendRedirect("update");

	}

}
