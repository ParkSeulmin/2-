package Date.Action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;

public class ActionDate implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		
		Member member = new Member();
		member.setId(id);
		SendArrow_DAO dao = new SendArrow_DAO();
		Member result = dao.ArrowSearch_DAO(member);
		Member result2 = dao.ArrowSearchTo_DAO(member);
		
		if((request != null) && (result2 != null)){
			request.setAttribute("result", result);
			request.setAttribute("result2", result2);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("ArrowOk.jsp");
			return forward;	
		}
		return null;
	}
}
