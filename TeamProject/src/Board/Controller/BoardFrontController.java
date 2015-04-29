package Board.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Action.Action;
import Board.Action.ActionForward;
import Board.Action.BoardAddAction;
import Board.Action.BoardDeleteAction;
import Board.Action.BoardDetailAction;
import Board.Action.BoardListAction;
import Board.Action.BoardModifyAction;
import Board.Action.BoardModifyView;
import Board.Action.ReplyAddAction;
import Board.Action.ReplyDeleteAction;

 public class BoardFrontController 
 	extends javax.servlet.http.HttpServlet 
 	implements javax.servlet.Servlet {
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
		 Action action=null;
		 
		   System.out.println("command: "+command);
		   if(command.equals("/BoardList.bo")){		// 공지사항 게시판
			   action = new BoardListAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardWrite.bo")){
			   if(request.getSession().getAttribute("user") == null){
				   response.setContentType("text/html;charset=utf-8");
			   		PrintWriter out=response.getWriter();
			   		out.println("<script>");
			   		out.println("alert('회원만 글쓰기가 가능합니다.');");
			   		out.println("history.back();");
			   		out.println("</script>");
			   		out.close();
			   		
			   		forward=new ActionForward();
					forward.setRedirect(false);
					forward.setPath("/BoardWrite.bo?boardtype="+request.getAttribute("boardtype"));
			   }
				   forward=new ActionForward();
				   forward.setRedirect(false);
				   forward.setPath("/Board/nomal_board_write.jsp");
		   }else if(command.equals("/BoardAddAction.bo")){
			   action  = new BoardAddAction();
			   try {
				   forward=action.execute(request, response );
			   } catch (Exception e) {
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardDetailAction.bo")){
			   action = new BoardDetailAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardModify.bo")){
			   action = new BoardModifyView();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
	 	   }else if(command.equals("/BoardModifyAction.bo")){
			   action = new BoardModifyAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/BoardDeleteAction.bo")){
			   action = new BoardDeleteAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("/ReplyWrite.bo")){
			   action = new ReplyAddAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
	 	   }else if(command.equals("/ReplyDeleteAction.bo")){
			   action = new ReplyDeleteAction();
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
		System.out.println("board");
		doProcess(request,response);
	}  	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		doProcess(request,response);
	}   	  	    
}