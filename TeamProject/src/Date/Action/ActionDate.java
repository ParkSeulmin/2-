package Date.Action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;
import Meeting.DAO.Party_DAO;
import Meeting.DTO.Party_DTO;

public class ActionDate implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String u_id = request.getParameter("id");
		String s_id= request.getParameter("sender");
		
		SendArrow_DAO dao = new SendArrow_DAO();//보내고자 하는 사람의 아이디 
		String result=dao.ArrowRegister_DAO(s_id, u_id);

		ActionForward forward = new ActionForward();
		
		request.setAttribute("arrow_result", result);
		forward.setRedirect(false);
		forward.setPath("/Date/ArrowResult.jsp");
		return forward;
	}
}
