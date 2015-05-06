package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mypage.DAO.MsgWrite_DAO;
import Mypage.DTO.Message_DTO;






public class Message_Write_Action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        
       Message_DTO writedto = (Message_DTO)request.getAttribute("writedto");
        
	   MsgWrite_DAO writedao = new MsgWrite_DAO();
	   writedao.getMsgWrite(writedto); 
		
		
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("close.msg");
  		return forward;

	 }
}