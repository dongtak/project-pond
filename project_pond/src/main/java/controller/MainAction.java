package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.fullmoon.FullMoonDao;
import model.fullmoon.FullMoonResponseDto;
import model.pay.PayDao;
import model.pay.PayRequestDto;
import model.pay.PayResponseDto;

public class MainAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("log");
		System.out.println("id : "+id);
		
		FullMoonDao dao = FullMoonDao.getInstance();
		FullMoonResponseDto moon = dao.fullmoonActivated();

		System.out.println("moonNum : "+moon.getMoonNum());
		
		PayDao payDao = PayDao.getInstance();
		List<PayRequestDto> moonUpPay = payDao.getPayByNum(moon.getMoonNum());
		
		if(moonUpPay.isEmpty()) {
			System.out.println("해당 "+moon.getMoonNum()+"의 pay list 없음");
		}
		
		session.setAttribute("moonUp", moon);
		request.setAttribute("moonUpPay", moonUpPay);

		request.getRequestDispatcher("main").forward(request, response);
	}



}