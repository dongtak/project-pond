package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.fullmoon.FullMoonDao;
import model.fullmoon.FullMoonResponseDto;

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
		
		System.out.println("moonMenu : "+moonMenu);
		
		request.setAttribute("moonMenu", moonMenu);

		// 추가
		FullMoonDao dao = FullMoonDao.getInstance();
		ArrayList<FullMoonResponseDto> list = null;
		list = dao.getMoonAllByKeyword(moonMenu);
		request.setAttribute("moonList", list);
		
		
		request.getRequestDispatcher("moon").forward(request, response);
	
	}


}
