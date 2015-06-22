package Admin.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Admin.Action.Action;
import Admin.Action.ActionForward;
import Admin.Action.AdminPwdCheckAction;
import Admin.Action.AdminPwdCheckMemberAction;
import Admin.Action.BoardListAdminAction;
import Admin.Action.GetMemberListAction;
import Admin.Action.GetPartyListAction;
import Admin.Action.PartyAddAction;


 public class AdminFrontController 
 	extends javax.servlet.http.HttpServlet 
 	implements javax.servlet.Servlet {
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
		 Action action=null;
		 
		   System.out.println("adminctrl command: "+command);
		   if(command.equals("/MemberList.admin")){		// 회원리스트
			   action = new GetMemberListAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardListadmin.admin")){		//   게시판
			   action = new BoardListAdminAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
 
		   }else if(command.equals("/PartyListadmin.admin")){		//   게시판
			   action = new GetPartyListAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
 
		   }else if(command.equals("/PartyWrite.admin")){
			   if(request.getSession().getAttribute("user") == null){
				   response.setContentType("text/html;charset=utf-8");
			   		PrintWriter out=response.getWriter();
			   		out.println("<script>");
			   		out.println("alert('관리자만 파티만들기가 가능합니다.');");
			   		out.println("history.back();");
			   		out.println("</script>");
			   		out.close();
			   		
			   		forward=new ActionForward();
					forward.setRedirect(true);
					forward.setPath("/PartyListadmin.admin");
			   }
				   forward=new ActionForward();
				   forward.setRedirect(true);
				   forward.setPath(request.getContextPath()+"/Adminpage/party_write_admin.jsp");
		   }else if(command.equals("/PartyAddAction.admin")){	
			   System.out.println("partyaddaction 들어왔");//   게시판
			   action = new PartyAddAction();
			   
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
 
		   }else if(command.equals("/AdminPwdCheckPage.admin")){		//   관리자 비밀번호확인
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath( "/Adminpage/admin_pwd_check.jsp");
			  
		   }else if(command.equals("/AdminPwdCheckPageMember.admin")){		//   관리자 비밀번호확인
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath( "/Adminpage/admin_pwd_check_member.jsp");
			  
		   }else if(command.equals("/AdminPwdCheck.admin")){		//   게시판
			   action = new AdminPwdCheckAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/AdminPwdCheckMember.admin")){		//   게시판
			   action = new AdminPwdCheckMemberAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }      
		   
		   if(forward != null){
			   if(forward.isRedirect()){
				   response.sendRedirect(forward.getPath());
			   }else{
				   RequestDispatcher dispatcher=
					   request.getRequestDispatcher(forward.getPath());
				   dispatcher.forward(request, response);
			   }
		   }
	 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		System.out.println("admin");
		doProcess(request,response);
	}  	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		doProcess(request,response);
	}   	  	    
}
