package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.articleComment.ArticleComment;
import model.articleComment.ArticleCommentDao;

/**
 * Servlet implementation class LeaveCommentFormAction
 */
@WebServlet("/LeaveCommentFormAction")
public class LeaveCommentFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LeaveCommentFormAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//
//		String comment = request.getParameter("comment");
//	
//		ArticleCommentDao commentDao = ArticleCommentDao.getInstance();
//		ArticleComment articlecomment = commentDao.getUserById(id);
//		
//		String url = "comment";
//		
//		System.out.println(comment);
//
//		// TODO Auto-generated method stub
//		request.setCharacterEncoding("UTF-8");
//		String text = request.getParameter("comment");
//		System.out.println(text);
//
//		String url = "article";
//		response.sendRedirect(url);

	}

}