package Date.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.Action.ActionDate;
import Login.Action.ActionForward;
import Login.DTO.Member;


public class DateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DateController() {
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
		ActionDate action = null;
		System.out.println("process접근");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());
		PrintWriter out = response.getWriter();
		if(cmd.equals("/Date/SendArrow.daa")){	
			
			String sender_id=request.getParameter("sender");
			String u_id=request.getParameter("id");
			
			request.setAttribute("sender", sender_id);
			request.setAttribute("id", u_id);
			
			try {
				forward = new ActionForward();
				action = new ActionDate();
				forward = action.execute(request, response);
				String ar=(String)request.getAttribute("result");
				System.out.println("컨트롤러에 넘어오나"+ar);
				out.write(ar);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}
	}		
}
