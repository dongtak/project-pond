package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.article.ArticleDao;
import model.article.ArticleRequestDto;

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
		
		ArticleDao articleDao = ArticleDao.getInstance();
		
		// 전체 게시글 수 
		int cnt = articleDao.getCount();
		
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
		
		List<ArticleRequestDto> list = articleDao.getArticleList(startRow, pageSize);
		
		request.setAttribute("count", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("articleList", list);
		
		request.getRequestDispatcher("articleHome").forward(request, response);
		
	}



}
