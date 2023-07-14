package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MoonMenuAction
 */

public class MoonMenuAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String moonMenu = request.getParameter("moonMenu");
		if(moonMenu==null) {
			moonMenu="new";
		}
		
		request.setAttribute("moonMenu", moonMenu);
		
		request.getRequestDispatcher("moon").forward(request, response);
	
	}


}