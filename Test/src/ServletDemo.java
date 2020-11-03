import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 */

/**
 * @author Administrator
 * @date 2020. 10. 31.
 * @Object Servlet의 개념
 * @Environment Windows 10 EE, openJDK 14.0.2
 */
@WebServlet("/servlet/servlet/ServletDemo")
public class ServletDemo extends HttpServlet {
	private int serviceCount;
	private FileOutputStream fos;
	@Override
	public void init() throws ServletException {
		File f = new File("C:/Temp/Count.txt");
		try {
			fos = new FileOutputStream(f);
			String start = "Now, Start a Text\n";
			String start1 = "-------------------------\n";
			byte[] b = start.getBytes();
			byte[] b1 = start1.getBytes();
			byte[] info = getServletInfo().getBytes();
			System.out.println(getServletInfo() + "aaa");
			fos.write(info);
			fos.write(b);
			fos.write(b1);
			fos.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {	
			e.printStackTrace();
		}
		System.out.println("START");
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String service = serviceCount++ + " : ";
		byte[] br = "\n".getBytes();
		byte[] b = service.getBytes();
		System.out.println("Web is Writing a Text");
		fos.write(b);
		fos.write(br);
		fos.flush();
		System.out.println("SERVICE");
	}
	
	@Override
	public void destroy() {
		String end = "-------------------------\n";
		String end1 = "Now, End a Text\n";
		byte[] b = end.getBytes();
		byte[] b1 = end1.getBytes();
		byte[] b2 = "CopyRiget®".getBytes();
		try {
			System.out.println("Web ended a Text ");
			fos.write(b);
			fos.write(b1);
			fos.write(b2);
			fos.flush();
			fos.close();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		System.out.println("END");
		
	}
}
