package Date.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session=request.getSession();
		Member user = null;
		user=(Member)session.getAttribute("user");
		ActionForward forward=new ActionForward(); 
		SendArrow_DAO Arw_dao=new SendArrow_DAO();
		System.out.println(user + "아이디값 받아오니?");
		
		/*String recieved_id=(String)session.getAttribute(user);

		ar=Arw_dao.Recieved_Arrow(recieved_id);

		memberlist=Arw_dao.getFriendList(recieved_id);
		
		//친구를 신청 받은 목록

		request.setAttribute("result", ar);

		request.setAttribute("friends", memberlist);
		
		forward.setPath("Mypage/Mypage_RecieveList.jsp");
		forward.setRedirect(false);*/
		return forward;
	}
}
