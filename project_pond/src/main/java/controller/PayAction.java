package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pay.PayDao;
import model.pay.PayRequestDto;
import model.user.UserDao;
import model.user.UserRequestDto;

/**
 * Servlet implementation class PayAction
 */
@WebServlet("/PayAction")
public class PayAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayAction() {
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
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String moonNum = request.getParameter("moonNum");
		String name = request.getParameter("donorName");
		String money = request.getParameter("moneyInput");
		String message = request.getParameter("messageInput");
		

//		 String donorName = request.getParameter("donorName");
//		    String donorBirth = request.getParameter("donorBirth");
//		    String donorPhone = request.getParameter("donorPhone");
//		    String donorEmail = request.getParameter("donorEmail");
//		    
//		    String cardType = request.getParameter("cardType");
//		    String cardNumber = request.getParameter("cardNumber");
//		    String cardPassword = request.getParameter("cardPassword");
//		    String cardExpYear = request.getParameter("cardExpYear");
//		    String cardExpMonth = request.getParameter("cardExpMonth");
		
		
		
		System.out.println(moonNum);
		System.out.println(name);
		System.out.println(money);
		
		System.out.println(message);
		
		PayRequestDto pay = new PayRequestDto(moonNum,name,money,message);

		PayDao payDao = PayDao.getInstance();
		boolean result = payDao.donatePayment(pay);

		String url = "";

		if(result) 
			url = "mainAction";
		

		response.sendRedirect(url);
	}

}
