package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.UserDao;
import model.user.UserRequestDto;

/**
 * Servlet implementation class UpdateUserFormAction
 */
@WebServlet("/UpdateUserFormAction")
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
		
	request.setCharacterEncoding("UTF-8");
	
		UserRequestDto userDto = null;
		
		String id = request.getParameter("id");
		System.out.println(id+"=확인용");
		String password = request.getParameter("password");
		System.out.println(password+"=확인용");
		String newPassword = request.getParameter("new-password");
	

		

		userDto = new UserRequestDto(id, password);
		
		
		
		
		
		UserDao userDao = UserDao.getInstance();
		userDao.updateUser(userDto, newPassword);
		
//		String url = "UpdateRequest";
		
	String url="update";
		
		
		
		
		response.sendRedirect(url);
	}

}
