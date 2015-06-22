package Admin.Action;

 
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

 
import javax.servlet.http.HttpSession;

import Admin.DAO.AdminDAO;
import Board.DAO.BoardDAO;
import Login.DAO.Join;
import Login.DTO.Member;

public class AdminPwdCheckMemberAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		 
		HttpSession session=request.getSession();
		Member user=(Member)session.getAttribute("user");
		
		Join joindao = new Join();
		
	   	boolean result=false;
	    
	   	String userid= request.getParameter("u_id");
	   	String adminid = "";
		if(user != null){
			adminid = user.getId();
		}
		
		
		if(request.getParameter("adminpwd") == ""){
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('비밀번호를 입력하세요.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}
		
		
				
	   AdminDAO admindao = new AdminDAO();
	   String realadminpwd = "";
	   if(admindao.AdminPwdCheck(adminid) != null){
		   realadminpwd = admindao.AdminPwdCheck(adminid);
	   }
	   	 
	   String adminpwd = "";
	   adminpwd = request.getParameter("adminpwd");
	   	if(!(realadminpwd.equals(adminpwd))){
	   		response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('비밀번호가 일치하지 않습니다.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}
	   	
	   	result = joindao.memberdelete(userid);
	
	   	String msg = "";
   		String url = "";
   		if(result == false){
   			msg = "관리자: 회원 삭제 실패";
   			url = request.getContextPath()+"/MemberList.admin";
   		}else{
   			msg = "관리자: 회원 삭제 성공";
   			url = request.getContextPath()+"/MemberList.admin";
   		}
   		
   		request.setAttribute("board_msg", msg);
   		request.setAttribute("board_url", url);
		
	 
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
   		forward.setPath("/Adminpage/redirect.jsp");
		return forward;	
	}	
}
