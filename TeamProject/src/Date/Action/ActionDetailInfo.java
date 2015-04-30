package Date.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.DAO.Search_DAO;
import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;

public class ActionDetailInfo implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward =new ActionForward();
		SendArrow_DAO mydao=new SendArrow_DAO();
		String id=(String)request.getAttribute("id");
		
		Member member=mydao.Memberinfo_DAO(id);
		request.setAttribute("memberinfo", member);
		forward.setPath("Mypage_MemberInfok.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
