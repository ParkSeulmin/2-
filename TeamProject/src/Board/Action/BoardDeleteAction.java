package Board.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.DAO.BoardDAO;
import Login.DTO.Member;


public class BoardDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		Member user=(Member)session.getAttribute("user");
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		
	   	boolean result=false;
	   	boolean usercheck=false;
	   	int num=Integer.parseInt(request.getParameter("num"));
	   	String userid = "";
		if(user != null){
			userid = user.getId();
		}
		
	   	BoardDAO boarddao=new BoardDAO();
	   	usercheck = boarddao.isBoardWriter(num, userid);
	   	
	   	if(usercheck==false){
	   		response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('삭제할 권한이 없습니다.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}
	   	
	   	result=boarddao.boardDelete(num);
	
	   	String msg = "";
   		String url = "";
   		if(result == false){
   			msg = "게시판 삭제 실패";
   			url = "./BoardList.bo?boardtype="+boardtype;
   		}else{
   			msg = "게시판 삭제 성공";
   			url ="./BoardList.bo?boardtype="+boardtype;
   		}
   		
   		request.setAttribute("board_msg", msg);
   		request.setAttribute("board_url", url);
   		
   		forward.setRedirect(false);
   		forward.setPath("/Board/redirect.jsp");
   		return forward;
	 }
}