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
		List<Member> memberlist=new ArrayList<Member>();
		List<Arrow_DTO> arlist=new ArrayList<Arrow_DTO>();
		
		ActionForward forward =new ActionForward();
		SendArrow_DAO dao=new SendArrow_DAO();
		String me=(String)request.getAttribute("user");
		arlist=dao.CheckSend(me);
		
		 
		//친구 불러오는 코드 추가
 
		String requestpage=request.getParameter("rp");
	      if(request.getParameter("rp")==null){
	         requestpage="1";
	      }
	      //친구 불러오는 코드 추가
	    memberlist=dao.getFriendList(me,requestpage);
	
		request.setAttribute("friends", memberlist);
		request.setAttribute("arrowlist", arlist);
		
		System.out.println(arlist);
		forward.setPath("Mypage_SendList.jsp");
		forward.setRedirect(false);
		System.out.println("안녕 여긴 잘 되가니>?");
		return forward;
	}

}
