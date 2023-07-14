package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.fullmoon.FullMoonDao;
import model.fullmoon.FullMoonResponseDto;

public class MainAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("log");
		System.out.println("id : "+id);
		
		FullMoonDao dao = FullMoonDao.getInstance();
		FullMoonResponseDto moon = dao.fullmoonActivated();
		System.out.println("moon : "+moon.getTitle());
		
		session.setAttribute("moonUp", moon);
		response.sendRedirect("main");

	}



}
