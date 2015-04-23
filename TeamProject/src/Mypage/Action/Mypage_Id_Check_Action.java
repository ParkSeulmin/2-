package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.DTO.Member;
import Mypage.DAO.Mypage_Id_Check_DAO;


public class Mypage_Id_Check_Action implements Mypage_Action {

	public Mypage_ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String name=request.getParameter("name");
		String email=request.getParameter("email")+"@"+request.getParameter("email_domain");
		
		Member member= new Member();

		member.setEmail(email);
		member.setName(name);
		
		Mypage_Id_Check_DAO dao=new Mypage_Id_Check_DAO();
		Member ID_result = dao.Mypage_Id_Test(member);//멤버 객체를 받아옴 , null 값을 받아왔다면 ID_result에는 null값
		//
		//정보가 여기까지 넘어왔다.
		System.out.println(ID_result.getName()+"바로 위 ");
		
		request.setAttribute("result", ID_result);//멤버 객체를 request에 담아줌.
		Mypage_ActionForward forward = new Mypage_ActionForward();
		forward.setRedirect(false);		//담을 객체를 날려줄 페이지
		forward.setPath("Mypage_Find_Result.jsp");
		//넘어가는 모든 데이터
		return forward;
	}
}
