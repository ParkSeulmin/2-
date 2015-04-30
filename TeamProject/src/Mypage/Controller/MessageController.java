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
import Mypage.Action.Message_Detail_Receive_Action;
import Mypage.Action.Message_Detail_Send_Action;
import Mypage.Action.Message_Send_Action;
import Mypage.Action.Message_Receive_Action;

/**
 * Servlet implementation class MessageController
 */
//@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MessageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			 	throws ServletException, IOException {
		 System.out.println("msgcontroller 들어옴");
				 String RequestURI=request.getRequestURI();
				 String contextPath=request.getContextPath();
				 String command=RequestURI.substring(contextPath.length());
				 
				 ActionForward forward=null;
				 Action action=null;
				 
				 System.out.println("msg command: "+command);
				   
				 if(command.equals("/Receivemsg.msg")){	//받은메시지 가져오기
					   action = new Message_Receive_Action();//메시지 액션 소환
					   try{
						   forward=action.execute(request, response);
					   }catch(Exception e){
						   e.printStackTrace();
					   }
				   }else if(command.equals("/Sendmsg.msg")){//보낸 메시지 가져오기
					   action = new Message_Send_Action();//메시지 액션 소환
					   try{
						   forward=action.execute(request, response);
					   }catch(Exception e){
						   e.printStackTrace();
					   }
				   }else if(command.equals("/Detailreceivemsg.msg")){
					   action = new Message_Detail_Receive_Action();//메시지 액션 소환
					   try{
						   forward=action.execute(request, response);
					   }catch(Exception e){
						   e.printStackTrace();
					   }
				   }else if(command.equals("/Detailsendmsg.msg")){
					   action = new Message_Detail_Send_Action();//메시지 액션 소환
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
						   System.out.println("마지막"+forward.getPath());
						   System.out.println(request.getAttribute("msgdto"));
						   RequestDispatcher dispatcher=
							   request.getRequestDispatcher(forward.getPath());
						   dispatcher.forward(request, response);
					   }
				   }
			 }
}
