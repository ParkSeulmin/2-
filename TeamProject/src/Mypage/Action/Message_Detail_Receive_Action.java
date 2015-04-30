package Mypage.Action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mypage.DAO.MsgDetail_DAO;
import Mypage.DTO.Message_DTO;




public class Message_Detail_Receive_Action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        
        
		MsgDetail_DAO detaildao = new MsgDetail_DAO();
	   	Message_DTO msgdto = new Message_DTO();
	
	   	
	   	
	   	
		msgdto = detaildao.getMsgDetail(Integer.parseInt(request.getParameter("m_id")));
	   	
	   	if(msgdto==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   
	   	
	   	
	   	request.setAttribute("msgdto", msgdto);
	   	
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("./Mypage/Message_Detail_Receive_Mypage.jsp");
  		return forward;

	 }
}