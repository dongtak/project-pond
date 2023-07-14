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

		String name = request.getParameter("leavename");
		String money = request.getParameter("cntrAmount");
		String message = request.getParameter("messageInput");
		
		System.out.println(name);
		System.out.println(money);
		
		System.out.println(message);
		
		PayRequestDto pay = new PayRequestDto(name,money,message);

		PayDao payDao = PayDao.getInstance();
		boolean result = payDao.payment(pay);

		String url = "modal";

		if(result) 
			url = "main";
		

		response.sendRedirect(url);
	}

}
