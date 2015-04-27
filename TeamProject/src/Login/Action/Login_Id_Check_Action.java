package Login.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.DAO.Login_Id_Check_DAO;
import Login.DTO.Member;


public class Login_Id_Check_Action implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String name=request.getParameter("name");
		String email=request.getParameter("email")+"@"+request.getParameter("email_domain");
		
		Member member= new Member();

		member.setEmail(email);
		member.setName(name);
		
		Login_Id_Check_DAO dao=new Login_Id_Check_DAO();
		Member ID_result = dao.Login_Id_Test(member);//멤버 객체를 받아옴 , null 값을 받아왔다면 ID_result에는 null값
		//
		//정보가 여기까지 넘어왔다.
		if(ID_result!=null){
			request.setAttribute("result", ID_result);//멤버 객체를 request에 담아줌.
		}
		else{
			Member member2=new Member();
			request.setAttribute("result", member2);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);		//담을 객체를 날려줄 페이지
		forward.setPath("Login_Find_Result.jsp");
		//넘어가는 모든 데이터
		return forward;
	}
}