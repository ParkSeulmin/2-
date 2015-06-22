package Meeting.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Meeting.DAO.Partydetails_DAO;

public class PartyAttenAction implements Action{
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = request.getParameter("partyid");//파티번호 가져옴
		String user = request.getParameter("user");//user id
		//System.out.println("detail action id " + id);
	
		/*request.setAttribute("partylist", partylist);
		request.setAttribute("count", count);
*/
		Partydetails_DAO dao = new Partydetails_DAO();
		System.out.println("attend action partyid " + id);
		System.out.println("attend action user " + user);
		int result = 0;
		result = dao.inserattend(id,user);//값이 insert 되면 result>0
		
		ActionForward forward = new ActionForward();
		
		if(result==0){
			System.out.println("db 프라이머리키 오류");
			forward.setRedirect(false);
			request.setAttribute("result", result);
			forward.setPath("./Party/attend.jsp");
			
		}else{
			System.out.println("attendaction 이다");
			System.out.println("넘어온 result 값" + result );
			request.setAttribute("result", result);
			forward.setRedirect(false);
			forward.setPath("./Party/attend.jsp");
		}
		
		
		
		return forward;
	}
}
