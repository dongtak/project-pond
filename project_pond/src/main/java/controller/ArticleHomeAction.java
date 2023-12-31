package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.fullmoon.FullMoonDao;
import model.fullmoon.FullMoonResponseDto;

/**
 * Servlet implementation class ArticleHomeAction
 */

public class ArticleHomeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		FullMoonDao fullmoonDao = FullMoonDao.getInstance();
		
		// 메뉴
		String moonMenu = request.getParameter("moonMenu");
		if(moonMenu==null) {
			moonMenu="new";
		}
		
		// 전체 게시글 수 
		int cnt = fullmoonDao.getCount()-1;
		
		// 현재 페이지 정보
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		// 한 페이지에서 보여 줄 게시글 수
		int pageSize = 4;
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
		// 첫 행 번호
		int startRow = (currentPage-1)*pageSize+1;
		
		List<FullMoonResponseDto> list = fullmoonDao.getMoonAllByKeyword(moonMenu, startRow, pageSize);
		
		request.setAttribute("count", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("moonMenu", moonMenu);
		request.setAttribute("moonList", list);
		
		request.getRequestDispatcher("articleHome").forward(request, response);
		
		
		
	}



}
