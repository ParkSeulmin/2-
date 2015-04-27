package Board.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.DAO.BoardDAO;
import Board.DTO.Board;



 public class BoardModifyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 request.setCharacterEncoding("utf-8");
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		 
		 BoardDAO boarddao=new BoardDAO();
		 Board boarddata=new Board();
		 
		 /*boolean usercheck=boarddao.isBoardWriter(
				 				num, request.getParameter("BOARD_ID"));
		 if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('수정할 권한이 없습니다.');");
		   		out.println("location.href='./BoardList.bo';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 */
		 try{
			 boarddata.setBo_no(num);
			 boarddata.setBo_title(
					 			request.getParameter("BOARD_SUBJECT"));
			 boarddata.setBo_content(
					 			request.getParameter("BOARD_CONTENT"));
			 
			 result = boarddao.boardModify(boarddata);

			 String msg = "";
		   		String url = "";
		   		if(result == false){
		   			msg = "게시판 수정 실패";
		   			url = "./BoardDetailAction.bo?num="+boarddata.getBo_no();
		   		}else{
		   			msg = "게시판 수정 성공";
		   			url ="./BoardDetailAction.bo?num="+boarddata.getBo_no();
		   		}
		   		
		   		request.setAttribute("board_msg", msg);
		   		request.setAttribute("board_url", url);
		   	 
		   	 forward.setRedirect(false);
		   	 forward.setPath("/Board/redirect.jsp");
		   	 //return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return forward;
	 }
}