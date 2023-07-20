package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.User;
import model.user.UserDao;

/**
 * Servlet implementation class MyPageAction
 */
public class MyPageMenuAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getSession().getAttribute("log");
		
		if(id==null) {
			response.sendRedirect("mainAction");
		}

		UserDao userdao = UserDao.getInstance();
		User user = userdao.getUserById(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("myPage").forward(request, response);
	
	}

}
