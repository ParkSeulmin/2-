package JDBC.loader;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/DBCPInit")
public class DBCPInit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DBCPInit() {
        super();
        // TODO Auto-generated constructor stub
    }


	public void init(ServletConfig config) throws ServletException {
		//초기화 (톰켓 구동시 제일 먼저 실행 파일)
		//근거 : web.xml =>	<load-on-startup>1</load-on-startup>
		
		//드라이버 로딩
		try{
			//벤더(오라클 , mysql ) 맞는 드라이버 로딩 
			String driver = config.getInitParameter("jdbcdriver");	
			Class.forName(driver);
			//dbcp pool 드라이버 로딩
			Class.forName("org.apache.commons.dbcp.PoolingDriver");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
