package Mypage.Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Login.DTO.Member;
import Meeting.DTO.Party_DTO;
import Mypage.DAO.Myparty_DAO;

public class MyPartyAction implements Action {


	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		Member user1 = null;
		user1=(Member)session.getAttribute("user");
		String user = user1.getId();
		
		System.out.println("dao userid " + user);

		Party_DTO dto = new Party_DTO();
		Myparty_DAO dao = new Myparty_DAO();
		List partylist = new ArrayList();
		partylist = dao.getpartylist(user);

	
		request.setAttribute("partylist", partylist); // 개인 파티 리스트

		forward.setRedirect(false);
		forward.setPath("./Mypage/Mypage_Partylist.jsp");
		return forward;
	}

}
