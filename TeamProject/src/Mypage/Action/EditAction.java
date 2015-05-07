package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Login.DTO.Member;
import Mypage.DAO.Edit_DAO;

public class EditAction implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Member dto = new Member();
		Edit_DAO dao = new Edit_DAO();
		Member member= (Member)session.getAttribute("user");//현재 로그인 한 id
		String user = member.getId();//아이디값만

		String realFolder = "";
		String saveFolder = "boardupload";

		int fileSize = 5 * 1024 * 1024;

		realFolder = request.getRealPath(saveFolder);

		System.out.println("joinAction realFolder image: " + realFolder);

		MultipartRequest multi = null;

		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8",
				new DefaultFileRenamePolicy());
		
		System.out.println("edit action id" + user);

		dto.setId(user);//로그인 한 후 회원 id
		dto.setAddress(multi.getParameter("address"));//주소
		dto.setNick(multi.getParameter("mb_nick"));// 닉네임
		dto.setU_mypicture(multi.getFilesystemName((String) multi
				.getFileNames().nextElement()));// 프로필사진
		dto.setPhone(multi.getParameter("mb_hp1")
				+ multi.getParameter("mb_hp2") + multi.getParameter("mb_hp3"));// 번호
		dto.setEmail(multi.getParameter("mb_email1") + "@"
				+ multi.getParameter("mb_email2"));//이메일
		
		
		int personal = dao.editinsereok(dto);//개인정보수정에 보냄
		if(personal>0){
			System.out.println("개인정보수정 업데이트 성공");
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/Mypage/Mypage_Edit.jsp");
		return forward;
	}

}
