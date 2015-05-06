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

public class ActionDelete implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		
		String s_id=(String)request.getAttribute("s_id");
		String r_id=(String)request.getAttribute("r_id");
		
		SendArrow_DAO mydao=new SendArrow_DAO();
		mydao.deleteArrow(s_id,r_id);
		
		List<Member> memberlist=new ArrayList<Member>();
		
		List<Arrow_DTO> arlist=new ArrayList<Arrow_DTO>();
		
		arlist=mydao.CheckSend(s_id);//
		
		String requestpage=request.getParameter("rp");
		if(request.getParameter("rp")==null){
			requestpage="1";
		}
		memberlist=mydao.getFriendList(s_id,requestpage);//
		String totalfriend=mydao.getTotal(s_id);//
		
		System.out.println("여기는 친구 신청배열"+arlist);
		System.out.println("친구배열"+memberlist);
		
		request.setAttribute("total", totalfriend);
		request.setAttribute("friends", memberlist);
		request.setAttribute("arrowlist", arlist);
		
		forward.setPath("/Mypage/Mypage_SendListTable.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
