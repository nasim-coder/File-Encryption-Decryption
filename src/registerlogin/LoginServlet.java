package registerlogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Users;
import dao.Userdao;

/**
 * @author NasimAhmadKhan
 * 
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		try {
		String email =request.getParameter("email");
		String password = request.getParameter("password");
		
		Userdao dao = new Userdao();
		
	Users user = dao.authenticate(email, password);
	
	if(user==null) {
		request.setAttribute("message", "Error : Make sure You have entered the correct username and password.");
		getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
	}
	else {
	   session.setAttribute("user", user);
	   response.sendRedirect("home.jsp");
	}
		}catch (Exception e) {
			out.println(e.getMessage());
			e.printStackTrace();
		}	
	}
}

