package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import model.articleComment.ArticleCommentDao;
import model.articleComment.ArticleCommentRequestDto;

/**
 * Servlet implementation class CommentAction
 */
public class CommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		JSONObject responseBody = new JSONObject();
		responseBody.put("msg", "fail");

		HttpSession session = request.getSession();

		// 받아온 댓글
		String moonNum = request.getParameter("moonNum");
		String addMsg = request.getParameter("msg");
		
		System.out.println("msg : "+addMsg);

		// 세션에 저장되어 있는 로그인중인 유저 id
		String id = (String) session.getAttribute("log");

		if (!addMsg.isEmpty() && id != null) {
			// create comment msg <- articleComment dao
			// 유저아이디, moonNum, 댓글내용
			ArticleCommentDao dao = ArticleCommentDao.getInstance();
			ArticleCommentRequestDto dto = new ArticleCommentRequestDto(id, moonNum, addMsg);
			if (dao.createComment(dto)) {
				responseBody.put("msg", "success");
			}
		}
		response.getWriter().append(responseBody.toString());

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		String moonNum = request.getParameter("moonNum");

		ArticleCommentDao articleCommentDao = ArticleCommentDao.getInstance();
		List<ArticleCommentRequestDto> commentList = articleCommentDao.getCommentByNum(moonNum);

		JSONArray list = new JSONArray(commentList);
		response.getWriter().append(list.toString());

	}

}
