package Mypage.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.DTO.Member;
import Mypage.DAO.Mypage_Id_Check_DAO;


public class Mypage_Id_Check_Action implements Mypage_Action {

	public Mypage_ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		boolean result = false;
		boolean userCheck = false;
		
		String name=request.getParameter("name");
		String email=request.getParameter("email")+"@"+request.getParameter("email_domain");
		Member member= new Member();

		member.setEmail(email);
		member.setName(name);
		
		Mypage_Id_Check_DAO dao=new Mypage_Id_Check_DAO();
		Member ID_result=dao.Mypage_Id_Test(member);
		request.setAttribute("result", ID_result);
		
		///////////////////////////////////////////////////
		Mypage_ActionForward forward = new Mypage_ActionForward();
		forward.setRedirect(true);
		forward.setPath("IdView.check");
		return forward;
	}
}
