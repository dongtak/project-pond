package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.User;
import model.user.UserDao;

/**
 * Servlet implementation class UpdateIserRequest
 */
@WebServlet("/UpdateIserRequest")
public class UpdateUserRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		UserDao userDao = UserDao.getInstance(); 

		String id = (String) request.getSession().getAttribute("log");

		User user = (User)userDao.getUserById(id);

		String email = "";
		String name = "";
		int birth = 0;
		String phone = "";

		String url = "login";
		
		if(user != null) {
			email = user.getEmail();
			name = user.getName();
			birth = user.getBirth();
			phone = user.getPhone();
			
			request.setAttribute("email", email);
			request.setAttribute("name", name);
			request.setAttribute("birth", birth);
			request.setAttribute("phone", phone);
			
			url = "update";
			
			
	
				System.out.println("수정 성공");
			
		}
		
		
		
		
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}



}
