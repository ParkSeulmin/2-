package Date.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.Action.ActionDate;
import Date.Action.ActionDetailInfo;
import Date.Action.ActionRecievedDate;
import Login.Action.Action;
import Login.Action.ActionForward;


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
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=utf-8");
	    response.setCharacterEncoding("utf-8");
	    
		ActionForward forward = null;
		Action action = null;
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
				out.write(ar);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}

		else if(cmd.equals("/CheckArrow.daa")){
			System.out.println("controller 탄다.");
			try {
				forward = new ActionForward();
				action = new ActionRecievedDate();
				forward = action.execute(request, response);
				
				if(forward != null){
					if(forward.isRedirect()){ //view 단 바로....
						response.sendRedirect(forward.getPath());
					}else{
						System.out.println("여긴 찍히냐???");
						RequestDispatcher dispatcher =
						request.getRequestDispatcher(forward.getPath());
						dispatcher.forward(request, response);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}
		
		else if(cmd.equals("/Mypage/MemberInfo.daa")){
			//사람 정보 보여주는 커맨드
			request.setAttribute("id", request.getParameter("id"));
			try {
				forward = new ActionForward();
				action = new ActionDetailInfo();
				forward = action.execute(request, response);
				
				if(forward != null){
					if(forward.isRedirect()){ //view 단 바로....
						response.sendRedirect(forward.getPath());
					}else{
						RequestDispatcher dispatcher =
						request.getRequestDispatcher(forward.getPath());
						dispatcher.forward(request, response);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}			

		}else if(cmd.equals("/Mypage/register.daa")){
			//친구추가
			System.out.println("명령실행확인");
			System.out.println(request.getParameter("s_id"));
			System.out.println(request.getParameter("r_id")+" :본인계정");
			request.setAttribute("s_id", request.getParameter("s_id"));
			request.setAttribute("r_id", request.getParameter("r_id"));

			try {
				//sforward = new ActionForward(); 페이지 넘기는 부분이 필요없어서 막아놈
				action = new ActionRegister();
				//forward = action.execute(request, response);
				action.execute(request, response);
				
				String str = (String) request.getAttribute("result");
				System.out.println(str);
				out.write(str);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}else if(cmd.equals("/Mypage/delete_arrow.daa")){
			//화살삭제 /
			System.out.println("명령들어올까");
			System.out.println(request.getParameter("s_id"));
			System.out.println(request.getParameter("r_id")+" :본인계정");
			request.setAttribute("s_id", request.getParameter("s_id"));
			request.setAttribute("r_id", request.getParameter("r_id"));

			try {
				action = new ActionDelete();
				action.execute(request, response);
				
				String str = (String) request.getAttribute("result");
				out.write(str);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}
		
	}		
}
