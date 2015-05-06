package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mypage.DAO.MsgDelete_DAO;




public class Message_Delete_Action implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        
        MsgDelete_DAO deletedao = new MsgDelete_DAO();
	   
		deletedao.getMsgDelete(Integer.parseInt(request.getParameter("m_id")));
		
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("close.msg");
  		return forward;

	 }
}