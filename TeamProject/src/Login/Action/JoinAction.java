package Login.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Action.*;
import Login.DAO.Join;
import Login.DTO.Member;
import Login.DTO.Personal_Info;


public class JoinAction implements Action {

	public ActionForward execute(HttpServletRequest req,
			HttpServletResponse response) throws Exception {

		Join joindao = new Join();//DAO 호출
		Member dto = new Member();//회원기본정보
		Personal_Info dto_plus = new Personal_Info();//추가정보


			//회원 기본정보 set
		  dto.setId(req.getParameter("mb_id"));
		  dto.setAge(2016-(Integer.parseInt(req.getParameter("mb_birth").substring(0,2))+1900));
		  dto.setEmail(req.getParameter("mb_email1")+"@"+req.getParameter("mb_email2"));
		  dto.setGender(Integer.parseInt(req.getParameter("gender")));
		  dto.setJumin(req.getParameter("mb_birth")+ req.getParameter("mb_birth2"));
		  dto.setName(req.getParameter("mb_name"));
		  dto.setNick(req.getParameter("mb_nick"));
		  dto.setPhone(req.getParameter("mb_hp1")+ req.getParameter("mb_hp2")+ req.getParameter("mb_hp3"));
		  dto.setPw(req.getParameter("mb_password"));
		  dto.setAddress(req.getParameter("address"));

		  //회원 추가정보 set
		  dto_plus.setU_ID(req.getParameter("mb_id"));
		  dto_plus.setContent(req.getParameter("content"));
		  dto_plus.setFschool(req.getParameter("school"));
		  dto_plus.setHeight(Integer.parseInt(req.getParameter("cm")));
		  dto_plus.setJob(req.getParameter("job"));
		  dto_plus.setSal(Integer.parseInt(req.getParameter("sal")));
		  dto_plus.setWeight(Integer.parseInt(req.getParameter("weight2")));
	 
		  int num = joindao.writeok(dto);// db들어갔는지 확인
		  int num2 = joindao.writeplus(dto_plus);//추가정보 객체 넘겨줌
		  	
	
		  if(num>0){
				 System.out.println("db 기본 정보 입력완료");
			  }
			  if(num2>0){
				 System.out.println("db 추가 정보 입력완료");
			  }
			  
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WebContent/Main.jsp");
		return forward;
	}
}
