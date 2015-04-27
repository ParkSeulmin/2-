
package Board.Action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.DAO.BoardDAO;
import Board.DTO.Reply;



public class ReplyAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		BoardDAO boarddao=new BoardDAO();
	   	Reply replydata=new Reply();
	   	ActionForward forward=new ActionForward();
	   	
	   	request.setCharacterEncoding("utf-8");

   		
   		boolean result=false;
   		
   		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		
		if(userid == null){
	   		response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('회원만 댓글 등록이 가능합니다.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}   		
   		
   		try{
   			
   			
   			int bo_no = Integer.parseInt(request.getParameter("bo_no"));
   			replydata.setBo_no(bo_no);
   			replydata.setRe_content(request.getParameter("re_content"));
   			replydata.setRe_writer(request.getParameter("re_writer"));
	  
	   		
	   		result=boarddao.ReplyInsert(replydata);
	   		
	   		String msg = "";
	   		String url = "";
	   		if(result == false){
	   			msg = "댓글 등록 실패";
	   			url = "./BoardDetailAction.bo?num="+bo_no;
	   		}else{
	   			msg = "댓글 등록 성공";
	   			url ="./BoardDetailAction.bo?num="+bo_no;
	   		}
	   		
	   		request.setAttribute("board_msg", msg);
	   		request.setAttribute("board_url", url);
	   		
	   		forward.setRedirect(false);
	   		forward.setPath("/Board/redirect.jsp");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	

}
