package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user.UserDao;
import model.user.UserRequestDto;

public class UpdateUserFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("update").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// 입력값 받아오기
		String id = (String) session.getAttribute("log");
		String inputPwd = request.getParameter("password");
		String inputNewPwd = request.getParameter("new-password");
		
		if(!id.equals("")) {
			if(inputPwd!=null) {
				UserDao userDao = UserDao.getInstance();
				UserRequestDto userDto = new UserRequestDto(id, inputPwd);
				userDao.updateUser(userDto,inputNewPwd);
			}
		}
		
		request.getRequestDispatcher("myPageMenu").forward(request, response);

	}

}
