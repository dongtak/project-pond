package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.articleComment.ArticleCommentDao;
import model.cardInfo.CardInfoDao;
import model.pay.PayDao;
import model.user.UserDao;

/**
 * Servlet implementation class ShowMyInfoAction
 */
public class ShowMyInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 내 정보 가져오기
		// 1. 유저 정보
		UserDao userdao = UserDao.getInstance();
	
		// 2. 카드 정보
		CardInfoDao carddao = CardInfoDao.getInstance();
		
		// 3. 결제 정보
		PayDao paydao = PayDao.getInstance();
		
		// 4. 댓글 정보
//		ArticleCommentDao = 
		
		
		request.getRequestDispatcher("myInfo").forward(request, response);
		
	}


}
