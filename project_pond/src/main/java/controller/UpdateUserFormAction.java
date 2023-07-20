package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user.User;
import model.user.UserDao;
import model.user.UserRequestDto;

public class UpdateUserFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = (String) request.getSession().getAttribute("log");

		if (id != null) {
			UserDao userdao = UserDao.getInstance();
			User user = userdao.getUserById(id);
			request.setAttribute("user", user);
		}
		
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
		String inputPwd = request.getParameter("new-password");
		
		
		boolean result=false;
		
		if(!id.equals("")) {
			if(inputPwd!=null) {
				UserDao userDao = UserDao.getInstance();
				UserRequestDto userDto = new UserRequestDto(id, inputPwd);
				result = userDao.updateUser(userDto);
				if(result) {
					System.out.println("비밀번호 변경 성공");
				}else {
					System.out.println("비밀번호 변경 실패");
				}
			}
		}
		
		response.sendRedirect("myPageMenu");
//		request.getRequestDispatcher("/myPageMenu").forward(request, response);

	}

}
