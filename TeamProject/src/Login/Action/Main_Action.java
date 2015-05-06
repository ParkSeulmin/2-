package Login.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Login.DAO.Login_DAO;
import Login.DTO.Member;

public class Main_Action implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
			ActionForward forward = new ActionForward();
			
			
			forward.setRedirect(false);
			forward.setPath("/Main.jsp");
			
		
			return forward;
		
		
		
		
		
	}
}
