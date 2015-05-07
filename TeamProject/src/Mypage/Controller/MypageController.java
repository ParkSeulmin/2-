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
import Mypage.Action.MyPartyAction;


public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			 	throws ServletException, IOException {
				 String RequestURI=request.getRequestURI();
				 String contextPath=request.getContextPath();
				 String command=RequestURI.substring(contextPath.length());
				 
				request.setCharacterEncoding("UTF-8");
			    response.setContentType("text/html;charset=utf-8");
			    response.setCharacterEncoding("utf-8");
				 
				 ActionForward forward=null;
				 Action action=null;
				 
				 System.out.println("command: "+command);
				   
				   if(command.equals("/MypageParty.my")){	//메시지 리스트
					   System.out.println("myparty 들어옴");
					   action = new MyPartyAction();//party 리스트 액션
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
}
