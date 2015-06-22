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
        
       Message_DTO writedto = new Message_DTO();
       
       writedto.setM_SENDID(request.getParameter("sendid"));
       writedto.setM_TITLE(request.getParameter("title"));
       writedto.setM_CONTENT(request.getParameter("content"));
       writedto.setM_RECIEVEID(request.getParameter("selectmodal"));
       
       System.out.println("Action : "+request.getParameter("sendid"));
       System.out.println("Action : "+request.getParameter("title"));
       System.out.println("Action : "+request.getParameter("content"));
       System.out.println("Action : "+request.getParameter("selectmodal"));
      MsgWrite_DAO writedao = new MsgWrite_DAO();
      writedao.getMsgWrite(writedto); 
      
      
         ActionForward forward = new ActionForward();
         forward.setRedirect(false);
        forward.setPath("./Receivemsg.msg");
        return forward;

    }
}