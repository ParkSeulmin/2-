package Mypage.Action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





public class Message_Close_Action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		
   	
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("./Mypage/Mypage_Close.jsp");
  		return forward;

	 }
}