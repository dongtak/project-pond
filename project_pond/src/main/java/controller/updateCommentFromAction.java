package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;

import model.articleComment.ArticleCommentDao;
import model.articleComment.ArticleCommentRequestDto;

/**
 * Servlet implementation class updateCommentFromAction
 */
@WebServlet("/updateCommentFromAction")
public class updateCommentFromAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCommentFromAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
//		ArticleCommentRequestDto articleDto = null;
//		
//		
//		int id = Integer.parseInt(request.getParameter("id"));
//		String articleId = request.getParameter("articleId");
//		String userId =request.getParameter("userId");
//		String content =request.getParameter("content");
//		Timestamp createdAt =new Timestamp(System.currentTimeMillis()); 
//		Timestamp modifiedAt =new Timestamp(System.currentTimeMillis()); 
//		
//		articleDto = new ArticleCommentRequestDto(id,articleId,userId,content,createdAt,modifiedAt);
//	
//		
//		ArticleCommentDao articleDao = ArticleCommentDao.getInstance();
//	
//		articleDao.updateArticleComment(articleDto,userId);
//		
//		String url = "UpdateCommentRequest";
//		response.sendRedirect(url);
		
	
		
		
	}

}
