package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mypage.DAO.MsgWrite_DAO;
import Mypage.DTO.Message_DTO;






public class Message_Writeview_Action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        
       
		request.setAttribute("u_id", request.getAttribute("u_id"));
		System.out.println("write view u_id= "+request.getAttribute("u_id"));
		
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("./Mypage/Message_Write_Mypage.jsp");
  		return forward;

	 }
}