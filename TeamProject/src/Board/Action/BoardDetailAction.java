package Board.Action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.DAO.BoardDAO;
import Board.DTO.Board;
import Board.DTO.Reply;
import Login.DTO.Member;

 public class BoardDetailAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("utf-8");
   		
		BoardDAO boarddao=new BoardDAO();
	   	Board boarddata = new Board();
	   	List replylist = new ArrayList();
	   	
	   	int boardtype = 0;
		//System.out.println("boarddetailaction boardtype: "+request.getParameter("boardtype"));
		if(request.getParameter("boardtype") != null){
			boardtype = Integer.parseInt(request.getParameter("boardtype"));
		}
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		String sessionid = "";
		
		if(boardtype == 50){
			if(request.getSession().getAttribute("user") != null){
				Member user = null;
				user = (Member)request.getSession().getAttribute("user");
				if(!(boarddao.isBoardWriter(num, user.getId())) && (user.getAdmin()!=1)){
					response.setContentType("text/html;charset=utf-8");
			   		PrintWriter out=response.getWriter();
			   		out.println("<script>");
			   		out.println("alert('이 게시물은 작성자와 관리자만 열람이 가능합니다.');");
			   		out.println("history.back();");
			   		out.println("</script>");
			   		out.close();
			   		return null;
				}
			}else{
				response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('이 게시물은 회원만 열람이 가능합니다.');");
		   		out.println("history.back();");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
		}
		
		if(request.getSession().getAttribute("user") != null){
			Member user = null;
			user = (Member)request.getSession().getAttribute("user");
			System.out.println("board detail member: "+user);
			if(boarddao.isBoardWriter(num, user.getId())){
				sessionid=user.getId();
			}		
		}
		
		
		// userid(session id)와 글쓴이가 같으면 조회수가 올라가지 않는다.
	   	// 즉 자신의 글은 조회수가 올라가지 않음
		boarddao.setReadCountUpdate(num, sessionid);
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