package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.UserDao;

public class AdminManageAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminManageAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String menu = request.getParameter("menu");
		
		if(menu.equals("회원")) {
			UserDao userDao = UserDao.getInstance();
			
			
		}else if(menu.equals("활동")) {
			
		}else if(menu.equals("게시글")) {
			
		}else if(menu.equals("후원")) {
			
		}
		
		
		request.getRequestDispatcher("adminManage").forward(request, response);
	}


}
