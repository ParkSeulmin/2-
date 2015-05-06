package Date.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Date.Action.ActionCheckSend;
import Date.Action.ActionDate;
import Date.Action.ActionDelete;
import Date.Action.ActionDeleteFriend;
import Date.Action.ActionDetailInfo;
import Date.Action.ActionDisagree;
import Date.Action.ActionMessage;
import Date.Action.ActionRecievedDate;
import Date.Action.ActionRecievedDate_query;
import Date.Action.ActionRegister;
import Date.Action.ActionSendMessage;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;
import Mypage.DTO.Arrow_DTO;


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
	    
	    //세션 값
	    HttpSession session =request.getSession();
		System.out.println("세션값 확인:"+session.getAttribute("user"));
		Member member=(Member) session.getAttribute("user");
		String id=member.getId();
	    
		ActionForward forward = null;
		Action action = null;
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());
		System.out.println("cmd 확인 : "+cmd);
		PrintWriter out = response.getWriter();
		
		if(cmd.equals("/Date/SendArrow.daa")){	//화살날리기
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

		else if(cmd.equals("/CheckArrow.daa")){//자신에게 날아온 화살 확인하는 메서드
			try {
				forward = new ActionForward();
				action = new ActionRecievedDate();
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
		}
		else if(cmd.equals("/CheckArrow_query.daa")){//자신에게 날아온 화살 확인하는 메서드
			try {
				forward = new ActionForward();
				action = new ActionRecievedDate_query();
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
		}
		else if(cmd.equals("/Mypage_messagesend.daa")){
			//쪽지 날리는 페이지 이동
			try {
				forward = new ActionForward();
				action = new ActionSendMessage();
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
		}
			else if(cmd.equals("/sendmessage.daa")){
				//팝업창에서 정보전달 
				try {
					forward = new ActionForward();
					action = new ActionMessage();
					forward = action.execute(request, response);
					String result=(String)request.getAttribute("result");
					 out.print(result);
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					
				}		
			
		}else if(cmd.equals("/register.daa")){
			//친구추가
			request.setAttribute("s_id", request.getParameter("s_id"));
			request.setAttribute("r_id", request.getParameter("r_id"));

			try {
				action = new ActionRegister();
				action.execute(request, response);
				
				String str = (String) request.getAttribute("result");
				System.out.println(str);
				out.write(str);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}else if(cmd.equals("/disagree_arrow.daa")){
			//받는 사람쪽에서 사용하는 명령체계
			//화살상태 변경 /
			System.out.println(request.getParameter("s_id"));
			System.out.println(request.getParameter("r_id")+" :본인계정");
			request.setAttribute("s_id", request.getParameter("s_id"));
			request.setAttribute("r_id", request.getParameter("r_id"));

			try {
				action = new ActionDisagree();
				action.execute(request, response);
				String str = (String) request.getAttribute("result");
				out.write(str);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{}}
		
			else if(cmd.equals("/delete_friend.daa")){
				//친구 삭제 
				request.setAttribute("friend", request.getParameter("s_id"));
				request.setAttribute("me", request.getParameter("r_id"));
				try {
					forward=new ActionForward();
					action = new ActionDeleteFriend();
					forward=action.execute(request, response);
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
			}
		else if(cmd.equals("/delete_arrow.daa")){
			//보낸 사람쪽에서 사용하는 명령체계
			//화살삭제 /
			request.setAttribute("s_id", request.getParameter("s_id"));
			request.setAttribute("r_id", request.getParameter("r_id"));
			try {
				forward=new ActionForward();
				action = new ActionDelete();
				forward=action.execute(request, response);
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
		}
		
		else if(cmd.equals("/CheckSendArrow.daa")){
			//내가 날린 화살을 보고싶을 때
			request.setAttribute("user", request.getParameter("user"));
			try {
				forward=new ActionForward();
				action = new ActionCheckSend();
				forward=action.execute(request, response);
				if(forward != null){
					if(forward.isRedirect()){ //view 단 바로....
						response.sendRedirect(forward.getPath());
					}else{
						
						System.out.println("여기 타는거 맞지?");
						System.out.println(request.getAttribute("arrowlist"));
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
		else if(cmd.equals("/CheckSendArrow.daa")){//Jquery용 메시지 확인
			//내가 날린 화살을 보고싶을 때
			request.setAttribute("user", request.getParameter("user"));
			try {
				forward=new ActionForward();
				action = new ActionCheckSend();
				forward=action.execute(request, response);
				if(forward != null){
					if(forward.isRedirect()){ //view 단 바로....
						response.sendRedirect(forward.getPath());
					}else{
						
						System.out.println("여기 타는거 맞지?");
						System.out.println(request.getAttribute("arrowlist"));
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
		
	}		
}
