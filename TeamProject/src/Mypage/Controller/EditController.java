package Mypage.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mypage.Action.Action;
import Mypage.Action.ActionForward;
import Mypage.Action.EditAction;



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
	
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response){
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
		   }
		 
	 }

}
