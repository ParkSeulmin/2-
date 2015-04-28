package Date.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.Action.ActionDate;
import Date.Action.Search_Action;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;

//@WebServlet("/DateController")
public class Search_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Search_Controller() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}
	private void Process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{	
		ActionForward forward = null;
		Action action = null;
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());
		
		System.out.println(RequestURI);
		System.out.println(contextPath);
		System.out.println(cmd);
		
		
		if(cmd.equals("/Date/Search.sear")){	
			try {
				forward = new ActionForward();
				action = new Search_Action();
				forward = action.execute(request, response);
				
				if (forward != null) {
					Member member = (Member) request.getAttribute("result");
					request.setAttribute("member", member);
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}
	}		
}
