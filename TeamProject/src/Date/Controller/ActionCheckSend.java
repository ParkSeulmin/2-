package Date.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;
import Mypage.DTO.Arrow_DTO;

public class ActionCheckSend implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List<Arrow_DTO> arlist=new ArrayList<Arrow_DTO>();
		ActionForward forward =new ActionForward();
		SendArrow_DAO dao=new SendArrow_DAO();
		String me=(String)request.getAttribute("user");
		arlist=dao.CheckSend(me);
		dao.getFriendList(me);
		//
		ar=Arw_dao.Recieved_Arrow(recieved_id);
		memberlist=Arw_dao.getFriendList(recieved_id);
		
		//친구를 신청 받은 목록
		request.setAttribute("result", ar);
		//
		request.setAttribute("friends", memberlist);
		
		//
		
		request.setAttribute("arrowlist", arlist);
		System.out.println(arlist);
		forward.setPath("Mypage_SendList.jsp");
		forward.setRedirect(false);
		System.out.println("안녕 여긴 잘 되가니>?");
		return forward;
	}

}
