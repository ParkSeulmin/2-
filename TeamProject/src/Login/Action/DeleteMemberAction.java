package Login.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 

import Login.DAO.Join;
import Login.DTO.Member;


public class DeleteMemberAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		Member user= null;
		Join joindao=new Join();
		 
		
		if(request.getSession().getAttribute("user") != null){
			user = (Member)request.getSession().getAttribute("user");
			if(user.getAdmin()!=1){
				response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('회원 삭제 불가');");
		   		out.println("history.back();");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
		}
		
	   	boolean result=false;
	   	boolean usercheck=false;
	   	String userid="";
	   	if(request.getParameter("u_id") != null){
	   		userid= request.getParameter("u_id");
	   	}
	   	result = joindao.memberdelete(userid);
	
	   	String msg = "";
   		String url = "";
   		if(result == false){
   			msg = "회원 삭제 실패";
   			url = "./MemberList.admin";
   		}else{
   			msg = "회원 삭제 성공";
   			url ="./MemberList.admin";
   		}
   		
   		request.setAttribute("board_msg", msg);
   		request.setAttribute("board_url", url);
   		
   		forward.setRedirect(false);
   		forward.setPath("/Board/redirect.jsp");
   		return forward;
	 }
}