package update;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users;
import dao.Userdao;
import mail.SendMail;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String email = request.getParameter("email");
		Userdao dao = new Userdao();
		Users user=dao.forgot(email);
			
		if(user==null)
			{
				request.setAttribute("message", "Entered email was incorrect or you have not registered yet");
				request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
			}
		    else
		    {
		    	String to=user.getEmail();
		    	String sub = "From Encryption Decryption";
		    	String msg = "Hello!!! "+user.getFname()+", Your username is= "+email+" And password is= "+user.getPassword();
		    	SendMail.send(to, sub, msg);
		    	
		    	request.setAttribute("message", "Your username and password has been sent on your entered email id");
		    	request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
		    }
	}

}
