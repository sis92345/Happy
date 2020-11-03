/**
 * 
 */
package com.example.libs;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

/**
 * @author SIST4-10
 * @Date 2020. 10. 28.
 * @Object 서블릿의 라이프 사이클, 상속된거 주의
 * @Environment Windows 10 Pro, openJDK 14.0.2
 */
@WebServlet("/servlets/servlet/Lifecycle")
public class ServletLifeCycle extends GenericServlet{
	private int initCount;
	private int serviceCount;
	private int destoryCount;
	private BufferedOutputStream bos;
	//FileOutputStream(File name, append boolean); append는 누적 여부를 의미
	//Servlet interface 상속받으면 메소드 5개를 강제 재정의해야함, 따라서 자식인 GenericServlet을 상속받아서 원하는거 재정의
	//서블릿의 Life Cycle: init() -> service() -> service() -> ... -> service() -> destory()
	//재컴파일 후 저장하면 destory() -> init()
	//브라우저에서 입력하면 console창에 나타남
	//브라우저에서 F5계속 누르면 service()가 계속 실행된다.
	//즉 새로고침을 누르면 변경된 내용을 볼 수 있다.
	//FileoutputStream을 이용한 것
	@Override
    public void init(ServletConfig config) throws ServletException{
		//init()는 단 한번 메모리에 로딩됨을 유의
		try {
			this.bos = new BufferedOutputStream(new FileOutputStream("C:/temp/lifecycle.txt",true));
			String str = "called init() :" + ++this.initCount + "\n";
			this.bos.write(str.getBytes());
			System.out.println("ccc");
			this.bos.flush(); //실제 파일보냄
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		String str = "called service() :" + ++this.serviceCount + "\n";
		this.bos.write(str.getBytes()); //buffer에 writer
		System.out.println("aaaa");
		System.out.println("aaaa");
		this.bos.flush();//buffer를 사용하면 무조건 flush
	}
	@Override
	public void destroy() {
		String str = "called destory() :" + ++this.destoryCount + "\n";
		try {
			this.bos.write(str.getBytes());
			System.out.println("bbb");
			System.out.println("bbb");
			this.bos.flush();
			this.bos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

