package Login.Action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.DAO.PwdSearch_DAO;
import Login.DTO.Member;

public class Action_PwdSearch implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws SQLException{
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		Member member = new Member();
		member.setName(name);
		member.setId(id);
		member.setEmail(email);
		System.out.println(name);
		System.out.println("여기까진될까?");
		PwdSearch_DAO dao = new PwdSearch_DAO();
		Member result = dao.Search_Pwd(member);
		String error = "잘못넣었습니다.";
		
		if(result != null){
			request.setAttribute("result", result);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("PwdSearchOk.jsp");
			return forward;	
		}else{
			request.setAttribute("error", error);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("PwdSearch.jsp");
			return forward;	
		}
	
	}
}
