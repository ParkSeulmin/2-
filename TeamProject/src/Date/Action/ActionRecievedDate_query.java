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

public class ActionRecievedDate_query implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Arrow_DTO> ar=new ArrayList<Arrow_DTO>();	//화살 받아오는 배열
		List<Member> memberlist=new ArrayList<Member>();//친구 
		HttpSession session = request.getSession();
		ActionForward forward=new ActionForward(); 
		SendArrow_DAO Arw_dao=new SendArrow_DAO();

		Member member= (Member)session.getAttribute("user");
		String recieved_id=member.getId();
		
		
		String requestpage=request.getParameter("rp");
		if(request.getParameter("rp")==null){//처음으로 페이지 요청 할 때 1페이지를 요청함.(친구)
			requestpage="1";
		}
		
		String arrowpage=request.getParameter("ap");
		if(request.getParameter("ap")==null){//처음으로 페이지 요청 할 때 1페이지를 요청함.(받은 메시지)
			arrowpage="1";
		}
		
		ar=Arw_dao.Recieved_Arrow(recieved_id,arrowpage);
		memberlist=Arw_dao.getFriendList(recieved_id,requestpage);
		String totalfriend=Arw_dao.getTotal(recieved_id);
		
		
		request.setAttribute("total", totalfriend);
		request.setAttribute("result", ar);
		request.setAttribute("friends", memberlist);
		
		forward.setPath("/Mypage/Mypage_RecieveList.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
