package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Login.DTO.Member;
import Login.DTO.Personal_Info;
import Mypage.DAO.Edit_DAO;


public class AddEditAction implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");//한글인코딩
		Personal_Info dto = new Personal_Info();
		Edit_DAO dao = new Edit_DAO();
		Member member= (Member)session.getAttribute("user");//현재 로그인 한 id
		String user = member.getId();//아이디값만
		


		System.out.println("edit add action id" + user);

		dto.setU_ID(user);//로그인 한 후 회원 id
		dto.setSal(Integer.parseInt(request.getParameter("sal")));//연봉
		dto.setHeight(Integer.parseInt(request.getParameter("cm")));//키
		dto.setWeight(Integer.parseInt(request.getParameter("weight2")));//몸무게
		dto.setJob(request.getParameter("job"));//직업
		dto.setFschool(request.getParameter("school"));
		dto.setContent(request.getParameter("content"));
		
		int personal = dao.addinfoinsereok(dto);//추가정보수정에 보냄
		
		if(personal>0){
			System.out.println("추가정보수정 업데이트 성공");
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/Mypage/Mypage_Edit.jsp");
		return forward;
	
	}

}
