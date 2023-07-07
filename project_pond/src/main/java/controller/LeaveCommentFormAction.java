package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.articleComment.ArticleCommentDao;
import model.articleComment.ArticleCommentRequestDto;

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
		request.setCharacterEncoding("UTF-8");
		//comment
		String comment = request.getParameter("comment");
		System.out.println(comment);	//콘솔 출력 확인, 입력값 출력
		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");	//값 2개
		System.out.println(id); 	//현재 로그인 중인 아이디 
		
		ArticleCommentRequestDto commentdto = new ArticleCommentRequestDto(id,comment);
		System.out.println(commentdto.getUserId()); 
		System.out.println(commentdto.getContent()); 
		
		ArticleCommentDao commentDao = ArticleCommentDao.getInstance();
		boolean result = commentDao.createComment(commentdto);
		
		String url = "article";

	

		response.sendRedirect(url);
		
		
		
	}

}
