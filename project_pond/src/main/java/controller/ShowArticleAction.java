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
		
		// 위 moonNum을 가지고
		// fullmoon, article, articleComment, pay <- moon_num 을 가지고 있는 애들만
		// fullmoon, article 각 개체 단 하나만 존재.
		// articleComment, pay 여러개 존재. 따라서 list로 받아와야 함
		
		ArticleDao articleDao = ArticleDao.getInstance();
		ArticleCommentDao articleCommentDao = ArticleCommentDao.getInstance();
		
		// article 받아옴
		ArticleRequestDto article = articleDao.getArticleByNum(moonNum);
		// articleComment list 받아옴
		List<ArticleCommentRequestDto> commentList = articleCommentDao.getCommentByNum(moonNum);
		
		// fullmoon
		
		// pay list
		
		if(moonNum==null){
			response.sendRedirect("articleHomeAction");
		}else {
			request.setAttribute("article",article );
			request.setAttribute("commentList", commentList);
			
			request.getRequestDispatcher("article").forward(request, response);
		}
		
	
	}


}
