package Date.Action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;

public class ActionDate implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String add = request.getParameter("add");
		String age = request.getParameter("age");
		int age2 = Integer.parseInt(age);
		Member member = new Member();
		member.setName(name);
		member.setAddress(add);
		member.setAge(age2);
		System.out.println(name);
		System.out.println(add);
		System.out.println(age2);
		SendArrow_DAO dao = new SendArrow_DAO();
		
		
		
		
		
		
		return null;
	}
}
