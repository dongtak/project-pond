package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.User;
import model.user.UserDao;
import model.user.UserRequestDto;

/**
 * Servlet implementation class DuplIdCheckAction
 */
@WebServlet("/DuplIdCheckAction")
public class DuplIdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DuplIdCheckAction() {
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
		
		 request.setCharacterEncoding("utf8");
	        response.setCharacterEncoding("utf8");
		  PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		
		UserRequestDto user = new UserRequestDto(id);
		UserDao userDao = UserDao.getInstance();
		User result = userDao.getUserById(id);
		
		
		
		boolean dupl = true;
		if(result!=null) {
			dupl=false;
		}
		
		request.setAttribute("dupl", dupl);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/joinForm.jsp");
		dispatcher.forward(request, response);
	}

}
