package Login.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Action.ActionForward;
import Login.Action.Action_PwdSearch;
import Login.DTO.Member;


//@WebServlet("*.da")
public class PwdSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PwdSearchController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}
	
	private void Process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		ActionForward forward = null;
		Action_PwdSearch action = null;
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());
			
		if(cmd.equals("/Login/PwdSearch.da")){	
			try {
				forward = new ActionForward();
				action = new Action_PwdSearch();
				forward = action.execute(request, response);
				
				if (forward != null) {
					Member member = (Member) request.getAttribute("result");
					request.setAttribute("member", member);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}
	}		
}
