package Date.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;

public class ActionMessage implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");

		String recieve_id=request.getParameter("id");//받는사람 id
		System.out.println(recieve_id);
		String title=request.getParameter("title");//쪽지 제목
		String content= request.getParameter("content");//쪽지 내용
		String send_id=member.getId();//보내는 사람 id
		SendArrow_DAO dao=new SendArrow_DAO();
		String result=dao.SendMessage(recieve_id,send_id,title,content);
		request.setAttribute("result", result);
		
		return forward; 
	}

}
