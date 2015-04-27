package Board.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.DAO.BoardDAO;
import Board.DTO.Board;


public class BoardModifyView implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("utf-8");
	   		
			BoardDAO boarddao=new BoardDAO();
		   	Board boarddata=new Board();
		   	
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");
			
			boolean usercheck=false;
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
			
		   	boarddata=boarddao.getDetail(num);
		   	
		   	if(boarddata==null){
		   		System.out.println("(수정)상세보기 실패");
		   		return null;
		   	}
		   	System.out.println("(수정)상세보기 성공");
		   	
		   	request.setAttribute("boarddata", boarddata);
		   	forward.setRedirect(false);
	   		forward.setPath("./Board/nomal_board_modify.jsp");
	   		return forward;
	 }
}