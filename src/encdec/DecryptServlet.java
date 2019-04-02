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
 * @author NasimAhmadKhan
 * 
 */
@WebServlet(description = "Decryption Implementation class. it will take file from client upload it on server and calls for decryption() method to decrypt the file.", urlPatterns = { "/DecryptServlet" })
public class DecryptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	private static final String  UPLOAD_DIR = "uploadedFiles";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("downloaddecrypted.jsp");
		String appPath = request.getServletContext().getRealPath("");
		String absolutePath = appPath+File.separator+UPLOAD_DIR;
		File savedir = new File(absolutePath);
			if(!savedir.exists())
			{
				savedir.mkdirs();
			}
	 MultipartRequest mrequest = new MultipartRequest(request, absolutePath, 50*1024*1024);
	  String filename = mrequest.getOriginalFileName("fileName");
	  String key = mrequest.getParameter("key");
	 
	  System.out.println("Decryption key = "+key);
	  
	  System.out.println("Filename = "+filename);
	  System.out.println("Path to upload = "+absolutePath);
	  File inputFile = new File(absolutePath+File.separator+filename);
	  File decryptedFile = new File(absolutePath+File.separator+filename+"decrypted");
	  String filenamefordownload = decryptedFile.getName();
	  session.setAttribute("dfname", filenamefordownload);
	  System.out.println("Thiss file goona be downloaded "+filenamefordownload);
	  try {
		CryptoUtil.decrypt(key, inputFile, decryptedFile);
	} catch (CryptoException e) {
		 //TODO Auto-generated catch block
		e.printStackTrace();
		out.println(e);
	}
		
	rd.forward(request, response);
	}

}
