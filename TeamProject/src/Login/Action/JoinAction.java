package Login.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

		String realFolder="";
   		String saveFolder="boardupload";
   		
   		int fileSize=5*1024*1024;
   		
   		realFolder=req.getRealPath(saveFolder);
   		
   		System.out.println("joinAction realFolder image: "+realFolder);
		
   		MultipartRequest multi=null;
   		
   		multi=new MultipartRequest(req,
					realFolder,
					fileSize,
					"utf-8",
					new DefaultFileRenamePolicy());
   		System.out.println("multi.getparameber mb_id"+multi.getParameter("mb_id"));

			//회원 기본정보 set
		  dto.setId(multi.getParameter("mb_id"));
		  dto.setAge(2016-(Integer.parseInt(multi.getParameter("mb_birth").substring(0,2))+1900));
		  dto.setEmail(multi.getParameter("mb_email1")+"@"+multi.getParameter("mb_email2"));
		  dto.setGender(Integer.parseInt(multi.getParameter("gender")));
		  dto.setJumin(multi.getParameter("mb_birth")+ multi.getParameter("mb_birth2"));
		  dto.setName(multi.getParameter("mb_name"));
		  dto.setNick(multi.getParameter("mb_nick"));
		  dto.setPhone(multi.getParameter("mb_hp1")+ multi.getParameter("mb_hp2")+ multi.getParameter("mb_hp3"));
		  dto.setPw(multi.getParameter("mb_password"));
		  dto.setAddress(multi.getParameter("address"));

		  // 자신의 프로필 사진넣기 
		  dto.setU_mypicture(
	   				multi.getFilesystemName(
	   						(String)multi.getFileNames().nextElement()));
		  
		  
		  //회원 추가정보 set
		  dto_plus.setU_ID(multi.getParameter("mb_id"));
		  dto_plus.setContent(multi.getParameter("content"));
		  dto_plus.setFschool(multi.getParameter("school"));
		  dto_plus.setHeight(Integer.parseInt(multi.getParameter("cm")));
		  dto_plus.setJob(multi.getParameter("job"));
		  dto_plus.setSal(Integer.parseInt(multi.getParameter("sal")));
		  dto_plus.setWeight(Integer.parseInt(multi.getParameter("weight2")));
	 
		  int num = joindao.writeok(dto);// db들어갔는지 확인
		  int num2 = joindao.writeplus(dto_plus);//추가정보 객체 넘겨줌
		  int num3 = joindao.insertarrow(multi.getParameter("mb_id"));
		  	
	
		  if(num>0){
				 System.out.println("db 기본 정보 입력완료");
			  }
			  if(num2>0){
				 System.out.println("db 추가 정보 입력완료");
			  }if(num3>0){
				  System.out.println("화살 등록 완료");
			  }
			  
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/intro.html");
		return forward;
	}
}
