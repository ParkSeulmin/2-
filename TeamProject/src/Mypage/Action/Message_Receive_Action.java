package Mypage.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Login.DTO.Member;
import Mypage.DAO.Msgreceive_DAO;
import Mypage.DTO.Message_DTO;

public class Message_Receive_Action implements Action{

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		HttpSession session=request.getSession();
		Member user= (Member)session.getAttribute("user");//현재 로그인 한 id
		String userid = user.getId();
		System.out.println("dao userid " + userid);
		
		
		Msgreceive_DAO dao = new Msgreceive_DAO();//받은 메시지 db쿼리문
		ArrayList<Message_DTO> recievelist = new ArrayList<Message_DTO>(); //받은 쪽지 list
		
		int recievecount =0;//받은메시지 카운트
		
	  	int page=1;
		int limit=5;
		
		recievecount = dao.getmsgcount(userid);//user id 쿼리문 넣은 뒤에 메시지 갯수 반환
		recievelist= dao.getrecievecelist(userid);
		
		//보낸 메시지함 총 카운트 수 
   		int maxpage=(int)((double)recievecount/limit+0.95); //0.95를 더해서 올림 처리
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		request.setAttribute("page", page);  //현재 페이지 수
   		request.setAttribute("maxpage", maxpage);  //최대 페이지 수
   		request.setAttribute("startpage", startpage);  //현재 페이지에 표시할 첫 페이지 수
   		request.setAttribute("endpage", endpage);  //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("recievecount",recievecount);  //글 수
		request.setAttribute("recievelist", recievelist); //받은 메시지 리스트
		
	   	forward.setRedirect(false);
   		forward.setPath("./Mypage/Message_Receive_Mypage.jsp");
   		return forward;	
	}
	

}
