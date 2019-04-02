package encdec;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		final String  UPLOAD_DIR = "uploadedFiles";
		HttpSession session = request.getSession();
		String appPath = request.getServletContext().getRealPath("");
		String absolutePath = appPath+File.separator+UPLOAD_DIR;
		String filename=null;
		int eord = Integer.parseInt(request.getParameter("eord"));
		if(eord==4)
		{
			filename=session.getAttribute("efname").toString();
		}
		else
		{
			filename=session.getAttribute("dfname").toString();
		}

		System.out.println(filename);
		File f =new File(absolutePath + File.separator+filename);
		  FileInputStream fileinputstream = new FileInputStream(f); 
		  BufferedInputStream bstr = new BufferedInputStream(fileinputstream);
		  int size = (int) f.length();
		  byte[] data = new byte[size];
		  bstr.read( data, 0, size ); // read into byte array
		  bstr.close();
		  response.setContentType("application/octet-stream");
		  response.setHeader("Content-Disposition","attachment; filename="+filename);
		  ServletOutputStream sos = response.getOutputStream();
		  sos.write(data);
		  sos.flush();
		  sos.close();
	}

}
