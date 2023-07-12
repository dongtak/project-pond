package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.article.ArticleDao;
import model.article.ArticleRequestDto;
import model.articleComment.ArticleCommentDao;
import model.articleComment.ArticleCommentRequestDto;

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
		
		ArticleDao articleDao = ArticleDao.getInstance();
		ArticleCommentDao articleCommentDao = ArticleCommentDao.getInstance();
		
		ArticleRequestDto article = articleDao.getArticleByNum(moonNum);
		List<ArticleCommentRequestDto> list = articleCommentDao.getCommentByNum(moonNum);
		
		
		if(moonNum==null){
			response.sendRedirect("articleHomeAction");
		}else {
			request.setAttribute("article",article );
			request.setAttribute("commentList", list);
			request.getRequestDispatcher("article").forward(request, response);
		}
		
	
	}


}
