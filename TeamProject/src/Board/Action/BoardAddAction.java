
package Board.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.DAO.BoardDAO;
import Board.DTO.Board;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class BoardAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		BoardDAO boarddao=new BoardDAO();
	   	Board boarddata=new Board();
	   	ActionForward forward=new ActionForward();
	   	
		String realFolder="";
   		String saveFolder="boardupload";
   		
   		int fileSize=5*1024*1024;
   		
   		realFolder=request.getRealPath(saveFolder);
   		
   		boolean result=false;
   		String msg = "";
   		String url = "";
   		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
   		
   		try{
   			//if(request.getSession().getAttribute("userid") != null){
	   			MultipartRequest multi=null;
	   			
	   			multi=new MultipartRequest(request,
	   					realFolder,
	   					fileSize,
	   					"utf-8",
	   					new DefaultFileRenamePolicy());
	   			
	   			boarddata.setBo_writer(multi.getParameter("bo_writer"));
		   		boarddata.setBo_title(multi.getParameter("bo_title"));
		   		boarddata.setBo_content(multi.getParameter("bo_content"));
		   		boarddata.setBo_file(
		   				multi.getFilesystemName(
		   						(String)multi.getFileNames().nextElement()));
		   		//boarddata.setBo_file(null);
		   		
		   		boarddata.setBo_id(boardtype);
		  
		   		
		   		result=boarddao.boardInsert(boarddata);
		   		
		   		
		   		if(result == false){
		   			msg = "게시판 등록 실패";
		   			url = "./BoardList.bo?boardtype="+boardtype;
		   		}else{
		   			msg = "게시판 등록 성공";
		   			url ="./BoardList.bo?boardtype="+boardtype;
		   		}
	   		
		   		request.setAttribute("board_msg", msg);
		   		request.setAttribute("board_url", url);
		   		
		   		forward.setRedirect(false);
		   		forward.setPath("/Board/redirect.jsp");
		   		return forward;
		   		
   			/*} else{
   				msg = "회원만 게시물 등록이 가능합니다^ ^";
	   			url ="./BoardList.bo?boardtype="+boardtype;
   				
   				forward.setRedirect(false);
   		   		forward.setPath("/Board/redirect.jsp");
   		   		return forward;*/
   			//}

  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	

}
