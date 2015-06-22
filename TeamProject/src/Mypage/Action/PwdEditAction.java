package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Login.DTO.Member;
import Mypage.DAO.Edit_DAO;


public class PwdEditAction implements Action{

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Member dto = new Member();
		Edit_DAO dao = new Edit_DAO();
		Member member= (Member)session.getAttribute("user");//현재 로그인 한 id
		String user = member.getId();//아이디값만

		
		System.out.println("pwd 수정 action id" + user);
		System.out.println("pwd 수정 action pw값" + request.getParameter("mb_password"));
		
		
		dto.setId(user);//로그인 한 후 회원 id
		dto.setPw(request.getParameter("mb_password"));//변경할 비밀 번호 
		
		
		int personal = dao.pwdedit(dto);//비밀번호 변경
		
		if(personal>0){
			System.out.println("비밀번호 수정 업데이트 성공");
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/Mypage/Mypage_Edit.jsp");
		return forward;
	}

}
