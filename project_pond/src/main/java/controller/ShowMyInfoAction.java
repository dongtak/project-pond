package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.articleComment.ArticleCommentDao;
import model.articleComment.ArticleCommentRequestDto;
import model.cardInfo.CardInfoDao;
import model.cardInfo.CardInfoResponseDto;
import model.pay.PayDao;
import model.pay.PayResponseDto;
import model.user.User;
import model.user.UserDao;

/**
 * Servlet implementation class ShowMyInfoAction
 */
public class ShowMyInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String id = (String) request.getSession().getAttribute("id");
		
		if(id==null) {
			response.sendRedirect("mainAction");
		}
		
		// 내 정보 가져오기
		// 1. 유저 정보
		UserDao userdao = UserDao.getInstance();
		User user = userdao.getUserById(id);
		
		// 2. 카드 정보
		CardInfoDao carddao = CardInfoDao.getInstance();
		List<CardInfoResponseDto> cardList = carddao.getUserCardListById(id);
		
		// 3. 결제 정보
		PayDao paydao = PayDao.getInstance();
		List<PayResponseDto> payList = paydao.getUserPayListById(id);
		
		// 4. 댓글 정보
		ArticleCommentDao commdao = ArticleCommentDao.getInstance();
		List<ArticleCommentRequestDto> commentList = commdao.getUserCommentById(id);
		
		
		request.setAttribute("user",user );
		request.setAttribute("cardList",cardList );
		request.setAttribute("payList",payList );
		request.setAttribute("commentList",commentList );
		
		
		request.getRequestDispatcher("myInfo").forward(request, response);
		

	}


}
