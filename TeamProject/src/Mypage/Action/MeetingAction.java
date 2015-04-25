/*package Mypage.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mypage.DAO.Meeting_DAO;


public class MeetingAction implements Action{

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();

		Meeting_DAO dao = new Meeting_DAO();
		List sendlist=new ArrayList();
		List recievelist=new ArrayList();
		
		int sendcount =0;//보낸메시지 카운트
		int recievecount =0;//받은메시지 카운트
		
	  	int page=1;
		int limit=5;
		

		sendcount=dao.Sendcount(); //총 send수를 받아 옴
		recievecount=dao.Recievecount(); // 총 recieve 수를 받아옴
		sendlist=dao.MessageSendlist();// sendlist
		recievelist=dao.MessageRecievelist();//recievelist
		
		//보낸 메시지함 총 카운트 수 
   		int sendmaxpage=(int)((double)sendcount/limit+0.95); //0.95를 더해서 올림 처리
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int sendstartpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
   		int sendendpage = sendmaxpage;
   		
   		if (sendendpage>sendstartpage+10-1) sendendpage=sendstartpage+10-1;
   		
   		request.setAttribute("page", page);  //현재 페이지 수
   		request.setAttribute("maxpage", maxpage);  //최대 페이지 수
   		request.setAttribute("startpage", startpage);  //현재 페이지에 표시할 첫 페이지 수
   		request.setAttribute("endpage", endpage);  //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount",listcount);  //글 수
		request.setAttribute("sendlist", sendlist);
		request.setAttribute("recievelist", recievelist); 
		
	   	forward.setRedirect(false);
   		forward.setPath("./Board/nomal_board_list.jsp");
   		return forward;	
		
		
		return null;
	}

}
*/