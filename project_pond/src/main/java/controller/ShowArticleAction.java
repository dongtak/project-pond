package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowArticleAction
 */
public class ShowArticleAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String moonNum = request.getParameter("moonNum");
		System.out.println("t:"+moonNum);
		if(moonNum==null){
			response.sendRedirect("articleHome");
		}
		
		request.setAttribute("moonNum",moonNum );
		request.getRequestDispatcher("article").forward(request, response);
	
	}


}
