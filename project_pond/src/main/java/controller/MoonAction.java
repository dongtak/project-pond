package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.fullmoon.FullMoonResponseDto;


/**
 * Servlet implementation class MoonAction
 */
public class MoonAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		FullMoonResponseDto moonUp = (FullMoonResponseDto) request.getSession().getAttribute("moonUp");
		String moonNum = moonUp.getMoonNum();
		
		request.setAttribute("moonNum", moonNum);
		
		request.getRequestDispatcher("moon").forward(request, response);
	}


}
