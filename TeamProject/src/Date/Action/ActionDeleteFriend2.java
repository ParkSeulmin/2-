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

public class ActionDeleteFriend2 implements Action {
//recieve용
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		SendArrow_DAO dao= new SendArrow_DAO();
		String friend=(String)request.getAttribute("friend");
		List<Member> memberlist=new ArrayList<Member>();
		List<Arrow_DTO> ar=new ArrayList<Arrow_DTO>();	//화살 받아오는 배열

		HttpSession session= request.getSession();
		Member member=(Member)session.getAttribute("user");
		String me=member.getId();
		
		String requestpage=request.getParameter("rp");
		if(request.getParameter("rp")==null){//처음으로 페이지 요청 할 때 1페이지를 요청함.(친구)
			requestpage="1";
		}
		
		String arrowpage=request.getParameter("ap");
		if(request.getParameter("ap")==null){//처음으로 페이지 요청 할 때 1페이지를 요청함.(받은 메시지)
			arrowpage="1";
		}
		
		String totalfriend=dao.getTotal(me);//총 친구 수-페이징처리
		String totalrecieve=dao.getRecieveTotal(me);//총 받은 메시지 수-페이징처리 
		dao.deleteFriend(me, friend);
		ar=dao.Recieved_Arrow(me,arrowpage);//화살
		memberlist=dao.getFriendList(me,requestpage); //친구
		
		request.setAttribute("totalrecieve", totalrecieve);
		request.setAttribute("total", totalfriend);
		request.setAttribute("result", ar);
		request.setAttribute("friends", memberlist);
		
		
		
		forward.setPath("/Mypage/Mypage_RecieveListTable.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
