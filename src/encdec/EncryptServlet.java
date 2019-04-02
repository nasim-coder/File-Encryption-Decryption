package encdec;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class EncryptServlet
 * 
 */
@WebServlet(description = "It will provide Encryption to the client and give a link to download encrypted files", urlPatterns = { "/EncryptServlet" })
public class EncryptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	private static final String  UPLOAD_DIR = "uploadedFiles";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
		HttpSession session= request.getSession();
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("downloadencrypted.jsp");
		String appPath = request.getServletContext().getRealPath("");
		String absolutePath = appPath+File.separator+UPLOAD_DIR;
		File savedir = new File(absolutePath);
			if(!savedir.exists())
			{
				savedir.mkdirs();
			}
	 MultipartRequest mrequest = null;
	try {
		mrequest = new MultipartRequest(request, absolutePath, 50*1024*1024);
	} catch (IOException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
	}
	  String filename = mrequest.getOriginalFileName("fileName");
	  String key = mrequest.getParameter("key");
	  request.setAttribute("kkey", key);
	  //request.setAttribute("filenamenotencrpted", filename);
	  System.out.println("Encryption key = "+key);
	  
	  System.out.println("Filename = "+filename);
	  System.out.println("Path to upload = "+absolutePath);
	  File inputFile = new File(absolutePath+File.separator+filename);
	  File encryptedFile = new File(absolutePath+File.separator+filename+"encrypted");
	  String filenamefordownload = encryptedFile.getName();
	  session.setAttribute("efname", filenamefordownload);
	  System.out.println("Thiss file goona be downloaded "+filenamefordownload);
			
	  try {
		CryptoUtil.encrypt(key, inputFile, encryptedFile);
	} catch (CryptoException e3) {
		 //TODO Auto-generated catch block
		e3.printStackTrace();
	}	
	try {
		rd.forward(request, response);
	} catch (ServletException e4) {
		// TODO Auto-generated catch block
		e4.printStackTrace();
	} catch (IOException e5) {
		// TODO Auto-generated catch block
		e5.printStackTrace();
		out.println(e5.getMessage());
	}
	}

}

