package Mypage.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mypage.Action.Action;
import Mypage.Action.ActionForward;
import Mypage.Action.AddEditAction;
import Mypage.Action.DeleteAction;
import Mypage.Action.EditAction;
import Mypage.Action.PwdEditAction;



//@WebServlet("/EditController")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
		 Action action=null;
		 
		   System.out.println("command: "+command);
		   if(command.equals("/EditProfile.edit")){	//개인정보수정
			   action = new EditAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/DeleteProfile.edit")){//회원탈퇴
			   System.out.println("회우너탈퇴 controller 들어옴");
			   action = new DeleteAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
			  
		   }else if(command.equals("/Editadd.edit")){
			   System.out.println("추가 정보 controller 들어옴");
			   action = new AddEditAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
			   
		   }else if(command.equals("/PwdEdit.edit")){
			   System.out.println("pw 수정 controller 들어옴");
			   action = new PwdEditAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
		   
			if (forward != null) {
				if (forward.isRedirect()) { // view 단 바로....
					response.sendRedirect(forward.getPath());
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward
							.getPath());
					dispatcher.forward(request, response);
				}
			}
		 
	 }

}
