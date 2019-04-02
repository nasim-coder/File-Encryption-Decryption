package mail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendServlet
 */
@WebServlet("/SendServlet")
public class SendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Reqst is coming here");
		try {
		String to = request.getParameter("to");
		String sub = request.getParameter("subject");
		String msg = request.getParameter("message");
		SendMail.send(to, sub, msg);
		request.setAttribute("message", "Your message has been sent succesfully");
		request.getRequestDispatcher("send_email.jsp").forward(request, response);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
