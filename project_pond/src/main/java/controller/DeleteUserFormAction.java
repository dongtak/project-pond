package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.User;
import model.user.UserDao;

/**
 * Servlet implementation class DeleteUserFormAction
 */
public class DeleteUserFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getSession().getAttribute("log");
		
		if(id!=null) {
			UserDao userdao = UserDao.getInstance();
			User user = userdao.getUserById(id);
			request.setAttribute("user", user);
		}
		
		request.getRequestDispatcher("leave").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		System.out.println("del id : "+id);
		String pwd = request.getParameter("password");
		
		String url = "myPageAction";
		boolean result=false;

		if(id!=null) {
			UserDao userDao = UserDao.getInstance();
			result = userDao.deleteUserById(id, pwd);
			
			if (result) {
				request.getSession().removeAttribute("log");
				url="mainAction";
				
			}
		}
		
		
		response.sendRedirect(url);
		

	}

}