package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.admin.AdminDao;
import model.user.UserDao;

/**
 * Servlet implementation class DuplIdCheckAction
 */
public class DuplIdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		
		boolean isDuple = false;
		
		UserDao userDao = UserDao.getInstance();
		AdminDao adminDao = AdminDao.getInstance();
		
		if(userDao.getUserById(id)!=null || adminDao.getAdminById(id)!=null) {
			isDuple=true;
		}
		
		JSONObject responseBody = new JSONObject();
		responseBody.put("isDuple", isDuple);
		
		response.getWriter().append(responseBody.toString());
		
	}

}
