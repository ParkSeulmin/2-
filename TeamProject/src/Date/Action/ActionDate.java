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
		dao.ArrowRegister_DAO(s_id, u_id);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Party/party.jsp");
		return forward;
		/*
		HttpSession session = request.getSession();

		Party_DAO dao = new Party_DAO();// DAO 호출
		Party_DTO dto = new Party_DTO();// party
		List partylist = new ArrayList();// party list 저장

		partylist = dao.getpartylist();// db쿼리문 결과 받아오기

		request.setAttribute("partylist", partylist);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Party/party.jsp");
		return forward;*/

	}
}
