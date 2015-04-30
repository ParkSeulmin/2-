package Date.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;
import Mypage.DTO.Arrow_DTO;

public class ActionRecievedDate implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Arrow_DTO> ar=new ArrayList<Arrow_DTO>();
		List<Member> memberlist=new ArrayList<Member>();
		
		ActionForward forward=new ActionForward(); 
		SendArrow_DAO Arw_dao=new SendArrow_DAO();
		
		String recieved_id=(String)request.getAttribute("id");
		System.out.println(recieved_id+"우다다다다다다닫다");
		ar=Arw_dao.Recieved_Arrow(recieved_id);
		memberlist=Arw_dao.getFriendList(recieved_id);
		
		//친구를 신청 받은 목록
		request.setAttribute("result", ar);
		//
		request.setAttribute("friends", memberlist);
		
		forward.setPath("Mypage_RecieveList.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
