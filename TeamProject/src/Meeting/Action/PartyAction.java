package Meeting.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Meeting.DAO.Party_DAO;
import Meeting.DTO.Party_DTO;

public class PartyAction implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		
		HttpSession session = request.getSession();

		Party_DAO dao = new Party_DAO();// DAO 호출
		Party_DTO dto = new Party_DTO();// party
		List partylist = new ArrayList();// party list 저장

		partylist = dao.getpartylist();// db쿼리문 결과 받아오기

		request.setAttribute("partylist", partylist);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Party/party.jsp");
		return forward;
	}
}
