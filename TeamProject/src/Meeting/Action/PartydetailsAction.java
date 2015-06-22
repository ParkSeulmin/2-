package Meeting.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Meeting.DAO.Party_DAO;
import Meeting.DAO.Partydetails_DAO;
import Meeting.DTO.Party_DTO;

public class PartydetailsAction implements Action{
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = request.getParameter("partyid");//파티번호 가져옴
		
		//String userid = request.getParameter("userid");//user id
		//System.out.println("detail action id " + id);
	
		/*request.setAttribute("partylist", partylist);
		request.setAttribute("count", count);
*/
		Partydetails_DAO dao = new Partydetails_DAO();
		List detail = dao.getlist(id);//select 할 id 값을 넘겨줌 
		int count = dao.getcount(Integer.parseInt(id));//파티 몇명 참석햇는지 보여줌
		
		System.out.println("party" + id + "참석인원 : " + count); 
		
		request.setAttribute("detail", detail);
		request.setAttribute("count", count);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./Party/partydetail.jsp");
		return forward;
	}

}
