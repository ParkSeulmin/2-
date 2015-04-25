package Board.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.DAO.BoardDAO;
import Board.DTO.Board;
import Board.DTO.Reply;

 public class BoardDetailAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("utf-8");
   		
		BoardDAO boarddao=new BoardDAO();
	   	Board boarddata = new Board();
	   	List replylist = new ArrayList();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		boarddao.setReadCountUpdate(num);
	   	boarddata=boarddao.getDetail(num);
	   	
	   	if(boarddata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	replylist=boarddao.getReply(num);
	   	
	   	if(replylist==null){
	   		System.out.println("댓글보기 실패");
	   		return null;
	   	}
	   	System.out.println("댓글보기 성공");
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	request.setAttribute("replylist", replylist);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./Board/nomal_board_view.jsp");
   		return forward;

	 }
}