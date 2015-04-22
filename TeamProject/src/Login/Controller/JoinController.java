package Login.Controller;

import java.io.IOException;
import java.sql.SQLException;

import Login.DAO.* ;
import Login.DTO.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException, Exception {

		/* 
		   U_ID U_PWD U_NAME U_JUMIN U_PHONE U_NNAME U_GENDER U_EMAIL U_AGE
		   U_ADDR U_ISADMIN
		  */
		req.setCharacterEncoding("utf-8");// 한글작업

		String U_ID = req.getParameter("mb_id");// id
		String U_PWD = req.getParameter("mb_password");// password
		String U_PWD2 = req.getParameter("mb_password_re");// password 확인
		String U_NAME = req.getParameter("mb_name");// 이름
		String U_JUMIN = req.getParameter("mb_birth")
				+ req.getParameter("mb_birth2");// 주민
		String U_PHONE =req.getParameter("mb_hp1")+ req.getParameter("mb_hp2")+ req.getParameter("mb_hp3");// 번호
		String U_PHONE2 = req.getParameter("mb_hp3");// 번호
		String U_NNAME = req.getParameter("mb_nick");// 닉네임
		int U_GENDER = Integer.parseInt(req.getParameter("gender"));// 성별
		String U_EMAIL = req.getParameter("mb_email1")+"@"+req.getParameter("mb_email2");// 이메일
		//String U_EMAIL2 = req.getParameter("mb_email2");// 이메일
		int U_AGE= 2016-(Integer.parseInt(req.getParameter("mb_birth").substring(0,2))+1900);//성별
		String U_ADDR = req.getParameter("address");// 이메일

/*		System.out.println(U_ID);
		System.out.println(U_PWD);
		System.out.println(U_PWD2);
		System.out.println(U_NAME);
		System.out.println(U_JUMIN);
		System.out.println(U_PWD);
		System.out.println(U_PHONE);
		System.out.println(U_PHONE2);
		System.out.println(U_NNAME);
		System.out.println(U_GENDER);
		System.out.println(U_EMAIL);
		//System.out.println(U_EMAIL2);
		System.out.println(U_AGE);
		System.out.println(U_ADDR); 
*/
		// DTO 객체
	
		  Member dto = new Member();
		  dto.setId(U_ID);
		  dto.setAge(U_AGE);
		  dto.setEmail(U_EMAIL);
		  dto.setGender(U_GENDER);
		  dto.setJumin(U_JUMIN);
		  dto.setName(U_NAME);
		  dto.setNick(U_NNAME);
		  dto.setPhone(U_PHONE);
		  dto.setPw(U_PWD);
		  dto.setAddress(U_ADDR);
		
		   // DB작업 DAO 객체 생성 mvcRegisterdao dao = new mvcRegisterdao(); int
		  Join dao = new Join();
		  int num = dao.writeok(dto);// db들어갔는지 확인
		  if(num>0){
			 System.out.println("db입력완료");
		  }
		  

			// view 설정
			RequestDispatcher dis = req
					.getRequestDispatcher("/WebContent/Login/Join_Plus.html");

			// forward
			dis.forward(req, res);
		
	}
}
