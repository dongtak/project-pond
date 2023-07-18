package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.pay.PayDao;
import model.pay.PayRequestDto;
import model.user.UserDao;
import model.user.UserRequestDto;

/**
 * Servlet implementation class PayAction
 */
public class PayAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		
		String moonNum = request.getParameter("moonNum");
		String name = request.getParameter("donorName");
		String message = request.getParameter("messageInput");
		String money = request.getParameter("moneyInput");
		int payMoney = Integer.parseInt(money);
		
//		if(session.getAttribute("log")!=null) {
			// 카드정보 dao -> 해당 log를 가지고 있는 유저의 카드 정보 가져오기
			// 만약 카드 정보가 있을 경우에
			// 아래 내용 처리
//		 String donorName = request.getParameter("donorName");
//		 String donorBirth = request.getParameter("donorBirth");
//		    String donorPhone = request.getParameter("donorPhone");
//		    String donorEmail = request.getParameter("donorEmail");
//		    
//		    String cardType = request.getParameter("cardType");
//		    String cardNumber = request.getParameter("cardNumber");
//		    String cardPassword = request.getParameter("cardPassword");
//		    String cardExpYear = request.getParameter("cardExpYear");
//		    String cardExpMonth = request.getParameter("cardExpMonth");
			//if (카드 정보가 있음)
			// pay -> new cardNum 포함한 객체
			// 
		
//		}else {
			
			PayRequestDto pay = new PayRequestDto(moonNum,name,message,payMoney);
			
//		}

		

		PayDao payDao = PayDao.getInstance();
		boolean result = payDao.donatePayment(pay);
		

		// 실패 시 후원 form 으로 이동, 나중에 실패 메세지 추가
		String url = "donate";

		if(result) 
			url = "mainAction";
		

		response.sendRedirect(url);
	}

}
