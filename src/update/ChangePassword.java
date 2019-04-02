package update;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String password = request.getParameter("password");
		String email = request.getParameter("email").toString();
		Userdao dao = new Userdao();
		int i = dao.UpdatePassword(password, email);
		System.out.println("returned value is="+i);
		if(i>0)
		  {
			request.setAttribute("message", "Your password has been updated succesfully");
			request.getRequestDispatcher("change_password.jsp").forward(request, response);
		  }
		else
		    {
		        request.setAttribute("message", "Someting went wrong, your new password couldn't update");
		        request.getRequestDispatcher("change_password.jsp").forward(request, response);
		    }
	}

}
