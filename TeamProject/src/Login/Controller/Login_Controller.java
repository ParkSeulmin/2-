package Login.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Action.Action;
import Login.Action.ActionForward;
import Login.Action.Action_Login_Check;
import Login.Action.Main_Action;

//@WebServlet("*.Login")
public class Login_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login_Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=utf-8");
		res.setCharacterEncoding("utf-8");
		
		String RequestURI = req.getRequestURI();
		String ContextPath = req.getContextPath();

		String command = RequestURI.substring(ContextPath.length());

		// RequestURI : /Web_JSP17_ServletBoard/boardList.do
		// ContextPath : /Web_JSP17_ServletBoard
		// command : /boardList.do

		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("command : " + command);
		
		ActionForward forward = null;
		Action action = null;
		
		 	
		if (command.equals("/Login/Login.login")) {
		
			action = new  Action_Login_Check(); 
			
			System.out.println(action);
	    	   try{
	     		   forward = action.execute(req, res);
	     	   }catch(Exception e){
	     		   e.printStackTrace();
	     	   }
			
		}else if (command.equals("/Main.login")) {
		
			action = new  Main_Action(); 
			
			System.out.println(action);
	    	   try{
	     		   forward = action.execute(req, res);
	     	   }catch(Exception e){
	     		   e.printStackTrace();
	     	   }
			
		}
		
		if(forward != null){
			if(forward.isRedirect()){ //view 단 바로....
				System.out.println("forward.isRedirect() : " + forward.isRedirect());
				System.out.println(res);
				res.sendRedirect(forward.getPath());
			}else{
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher =
				req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
				req.setAttribute("result",req.getParameter("result"));
				
				
			}
		}
	}

}