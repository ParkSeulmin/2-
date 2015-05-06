package Date.Action;

import java.net.HttpRetryException;
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

public class ActionCheckSend implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Member> memberlist=new ArrayList<Member>();
		List<Arrow_DTO> arlist=new ArrayList<Arrow_DTO>();
		
		ActionForward forward =new ActionForward();
		SendArrow_DAO dao=new SendArrow_DAO();
		
		HttpSession session= request.getSession();
		Member member=(Member)session.getAttribute("user");
		String me=member.getId();
		
		arlist=dao.CheckSend(me);//
		
		String requestpage=request.getParameter("rp");
		if(request.getParameter("rp")==null){
			requestpage="1";
		}
		memberlist=dao.getFriendList(me,requestpage);//
		String totalfriend=dao.getTotal(me);//
		
		request.setAttribute("total", totalfriend);
		request.setAttribute("friends", memberlist);
		request.setAttribute("arrowlist", arlist);
		
		forward.setPath("/Mypage/Mypage_SendList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
