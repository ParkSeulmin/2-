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
		
		String totalfriend=Arw_dao.getTotal(recieved_id);//총 친구 수-페이징처리
		String totalrecieve=Arw_dao.getRecieveTotal(recieved_id);//총 받은 메시지 수-페이징처리 
		
		ar=Arw_dao.Recieved_Arrow(recieved_id,arrowpage);//화살
		memberlist=Arw_dao.getFriendList(recieved_id,requestpage); //친구
		
		request.setAttribute("totalrecieve", totalrecieve);
		request.setAttribute("total", totalfriend);
		request.setAttribute("result", ar);
		request.setAttribute("friends", memberlist);
		System.out.println("데이터 확인");
		System.out.println(totalrecieve);
		System.out.println(totalfriend);
		System.out.println(ar);
		System.out.println(memberlist);
		
		
		
		
		forward.setPath("/Mypage/Mypage_RecieveList.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
