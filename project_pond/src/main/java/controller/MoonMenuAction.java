package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
//		if(moonMenu.equals("new")) {
//			
//		}else if(moonMenu.equals("done")) {
//			
//		}else if(moonMenu.equals("peak")) {
//			
//		}else if(moonMenu.equals("topMsg")) {
//			
//		}
		
	
	}


}
