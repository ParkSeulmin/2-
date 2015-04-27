package Board.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.DAO.BoardDAO;


public class ReplyDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		
	   	boolean result=false;
	   	boolean usercheck=false;
	   	int num=Integer.parseInt(request.getParameter("replynum"));
	   	
	   	BoardDAO boarddao=new BoardDAO();
	   	usercheck=boarddao.isReplyWriter(num, userid);
	   	
	   	if(usercheck==false){
	   		response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('삭제할 권한이 없습니다.');");
	   		out.println("history.back()");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}
	   	int bo_no = Integer.parseInt(request.getParameter("bo_no"));
	   	result=boarddao.ReplyDelete(num);
	
	   	String msg = "";
   		String url = "";
   		if(result == false){
   			msg = "댓글 삭제 실패";
   			url = "./BoardDetailAction.bo?num="+bo_no;
   		}else{
   			msg = "댓글 삭제 성공";
   			url ="./BoardDetailAction.bo?num="+bo_no;
   		}
   		
   		request.setAttribute("board_msg", msg);
   		request.setAttribute("board_url", url);
   		
   		forward.setRedirect(false);
   		forward.setPath("/Board/redirect.jsp");
   		return forward;
	 }
}