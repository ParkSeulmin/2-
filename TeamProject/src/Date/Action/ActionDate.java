package Date.Action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;
import Meeting.DAO.Party_DAO;
import Meeting.DTO.Party_DTO;

public class ActionDate implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String u_id = request.getParameter("id");
		String s_id= request.getParameter("sender");
		
		SendArrow_DAO dao = new SendArrow_DAO();//보내고자 하는 사람의 아이디 
		String result=dao.ArrowRegister_DAO(s_id, u_id);
		//화살이 어쩌구되었습니다.
		System.out.println(result+"action단 에 넘어올까");
		ActionForward forward = new ActionForward();
		
		request.setAttribute("result", result);
		return forward;
	}
}
