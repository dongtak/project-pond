package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.admin.Admin;
import model.admin.AdminDao;
import model.user.User;
import model.user.UserDao;

public class AdminMainAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String menu = request.getParameter("menu");
		String id= (String) request.getSession().getAttribute("log");
		
		AdminDao adminDao = AdminDao.getInstance();
		Admin admin = adminDao.getAdminById(id);

		if(admin!=null) {
			request.setAttribute("admin", admin);
		}

		if (menu != null) {
			if (menu.equals("회원")) {
				UserDao userDao = UserDao.getInstance();
				ArrayList<User> userList = userDao.getUserAll();
				if (!userList.isEmpty()) {
					request.setAttribute("userList", userList);
				}
			} else if (menu.equals("활동")) {
				
			} else if (menu.equals("게시글")) {

			} else if (menu.equals("후원")) {

			}
		}
		
		
		request.setAttribute("menu", menu);
		request.getRequestDispatcher("adminMain").forward(request, response);
		
	}

}
