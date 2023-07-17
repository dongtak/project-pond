package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.fullmoon.FullMoon;
import model.fullmoon.FullMoonDao;
import model.fullmoon.FullMoonResponseDto;

/**
 * Servlet implementation class MoonContentAction
 */
@WebServlet("/MoonContentAction")
public class MoonContentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoonContentAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("application/json; charset=utf-8");
//		
//		String moonMenu = request.getParameter("moonMenu");
//		System.out.println("moonMenu : " + moonMenu);
//		
//		ArrayList<FullMoonResponseDto> list = null;
//		
//		FullMoonDao dao = FullMoonDao.getInstance();
//		list = dao.getMoonAllByKeyword(moonMenu);
//		
//		JSONArray result = new JSONArray(list);
//		response.getWriter().append(result.toString());
	}


}
