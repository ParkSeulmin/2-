package Date.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;

public class ActionSendMessage implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		forward.setPath("/Date/Date_SendMessageForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
