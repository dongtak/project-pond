package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
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
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getSession().getAttribute("log");
		
		System.out.println("id : "+id);
		if(id==null) {
			response.sendRedirect("mainAction");
		}
		
		System.out.println("--showMyInfoAction--");
		
		// 파라미터(메뉴)
		String menu = request.getParameter("menu");
		
		if(!menu.equals("")) {
			System.out.println("menu : "+menu);
			request.setAttribute("menu", menu);
		}
		
		if(menu.equals("myInfo")) {
			// 내 정보
			UserDao userdao = UserDao.getInstance();
			User user = userdao.getUserById(id);
			if(user!=null) {
				System.out.println("user : "+user);
				request.setAttribute("user", user);
			}
		}else if(menu.equals("myCardInfo")) {
			// 카드 정보
			CardInfoDao carddao = CardInfoDao.getInstance();
			List<CardInfoResponseDto> cardList = carddao.getUserCardListById(id);
			if(cardList.size()!=0) {
				System.out.println("cardList : "+cardList);
				request.setAttribute("cardList",cardList );
			}
		}else if(menu.equals("myPay")) {
			// 결제 정보
			PayDao paydao = PayDao.getInstance();
			List<PayResponseDto> payList = paydao.getUserPayListById(id);
			if (payList.size()!=0) {
				System.out.println("payList : "+payList);
				request.setAttribute("payList",payList );
			}
		}else if(menu.equals("myMsg")) {
			// 댓글 정보
			ArticleCommentDao commdao = ArticleCommentDao.getInstance();
			List<ArticleCommentRequestDto> commentList = commdao.getUserCommentById(id);
			if (commentList.size()!=0) {
				System.out.println("commentList : "+commentList);
				request.setAttribute("commentList",commentList );
			}
		}

		request.getRequestDispatcher("myInfo").forward(request, response);

	}


}
