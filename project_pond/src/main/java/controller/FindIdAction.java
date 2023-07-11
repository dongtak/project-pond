package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.User;
import model.user.UserDao;

/**
 * Servlet implementation class FindIdAction
 */
@WebServlet("/FindIdAction")
public class FindIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdAction() {
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
	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		
		UserDao userDao = UserDao.getInstance();
		String id = userDao.findIdbyEmail(name,email);
		
		String url = "";
		
		if(id!=null) {
			url = "findIdSuccess";	//아이디 찾기 성공 화면
			
			
		}else {
			url="findId";	// 아이디 찾기 페이지
		}
		
		
	}

}
