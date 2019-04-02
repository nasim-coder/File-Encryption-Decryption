package registerlogin;
import mail.SendMail;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users;
import dao.Userdao;

/**
 * @author NasimAhmadKhan
 * 
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		try {
		String fname=request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password1");
		
		String to=email;
		String sub="Login Details";
		String msg="Hello!!! "+fname+" Welcome to encryption decryption. Yor username is="+email+" And password is= "+password;
		
		Userdao udao = new Userdao();
		String s = udao.register(fname, lname, email, mobile, gender, password);
		if(s!=null)
		{
			SendMail.send(to, sub, msg);
			request.setAttribute("message", "You are succefully Registered, please login with same credentials.Also Your username and password has been sent to your mail id");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "Something Went Wrong!!! can not register");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		System.out.println("Returned string after register is = "+s);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		    out.println(e.getMessage());
		}
		System.out.println("New user registered");
		
		
	}

}
