package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.UserDao;
import model.user.UserRequestDto;

/**
 * Servlet implementation class JoinFormAction
 */
@WebServlet("/JoinFormAction")
public class JoinFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int birth = Integer.parseInt(request.getParameter("birth"));
		String phone = request.getParameter("phone");
		
		String address =request.getParameter("sample6_postcode");
		address += " " + request.getParameter("sample6_address");
		address += request.getParameter("sample6_detailAddress");	
		address += request.getParameter("sample6_extraAddress");
		
		
		System.out.print(address + " = address 확인용");

		UserRequestDto user = new UserRequestDto(id, password, name, email, birth, phone,address);

		UserDao userDao = UserDao.getInstance();
		boolean result = userDao.createUser(user);

		String url = "";
		
		if(result) {
			String msg="회원가입이 완료되었습니다.";
			request.setAttribute("msg", msg);
			
			url = "login";
		}else {
			url = "join";
		}
		

		request.getRequestDispatcher(url).forward(request, response);
	}

}
