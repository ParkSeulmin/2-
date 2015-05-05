package Admin.Action;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Admin.DAO.AdminDAO;
import Board.DAO.BoardDAO;
import Board.DTO.Board;
import Login.DTO.Member;

 public class BoardListAdminAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward= new ActionForward();
		HttpSession session=request.getSession();
		
		AdminDAO admindao = new AdminDAO(); 
		List boardlist=new ArrayList();
		 
		
	  	int page=1;
		int limit=9;
		int boardtype=20; // 게시판 타입
		
		if(request.getParameter("boardtype")!=null){
			boardtype = Integer.parseInt(request.getParameter("boardtype"));
		}
		
		
		// session user  
		Member user = null;
		user=(Member)session.getAttribute("user");
		
	 
			if((user == null) || (user.getAdmin()!=1)){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('이 게시물은 관리자만 열람이 가능합니다.');");
		   		out.println("history.back();");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	} 

		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		int listcount=admindao.getListCountadmin(boardtype); //총 리스트 수를 받아 옴
		boardlist = admindao.getBoardListadmin(page,limit,boardtype); //리스트를 받아 옴
		
		
		//총 페이지 수
   		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		request.setAttribute("page", page);  //현재 페이지 수
   		request.setAttribute("maxpage", maxpage);  //최대 페이지 수
   		request.setAttribute("startpage", startpage);  //현재 페이지에 표시할 첫 페이지 수
   		request.setAttribute("endpage", endpage);  //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount",listcount);  //글 수
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("boardtype", boardtype); // 게시판 타입 10:공지사항 20:후기 30:남자 40:여자 50:1:1문의
 
	   	forward.setRedirect(false);
   		forward.setPath("./Adminpage/nomal_board_list_admin.jsp");
   		return forward;
	 }

 }
