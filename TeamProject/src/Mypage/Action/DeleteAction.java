package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Login.DAO.Join;
import Login.DTO.Member;


public class DeleteAction implements Action{

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Member dto = new Member();
		Join dao = new Join();
		Member member= (Member)session.getAttribute("user");//현재 로그인 한 id
		String user = member.getId();//아이디값만


		
		System.out.println("delete action id" + user);

		boolean personal = dao.memberdelete(user); //회원탈퇴 dao
		
		
		if(personal==true){
			System.out.println("회원탈퇴 업데이트 성공");
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/Mypage/Mypage_Edit.jsp");
		return forward;
	}

}
