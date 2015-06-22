package Login.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.DAO.Login_Id_Check_DAO;
import Login.DTO.Member;


public class Login_Id_Check_Action implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		
		Member member= new Member();

		member.setEmail(email);
		member.setName(name);
		
		Login_Id_Check_DAO dao=new Login_Id_Check_DAO();
		Member result = dao.Login_Id_Test(member);//멤버 객체를 받아옴 , null 값을 받아왔다면 ID_result에는 null값
		String error = "정보틀림";
		String result1 = "정보맞음";
		
		if(result!=null){
			mailtest mailtest = new mailtest(result);
			request.setAttribute("result", result);//멤버 객체를 request에 담아줌.
			request.setAttribute("result1", result1);
		}
		else{
			Member member2 = new Member();
			request.setAttribute("result", member2);
			request.setAttribute("error", error);
			
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);		//담을 객체를 날려줄 페이지
		forward.setPath("Login_Find_Id.jsp");
		//넘어가는 모든 데이터
		return forward;
	}
}
