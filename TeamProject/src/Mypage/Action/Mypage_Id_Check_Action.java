package Mypage.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.DTO.Member;


public class Mypage_Id_Check_Action implements Mypage_Action {

	public Mypage_ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		Member member= new Member();
		userCheck = boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
		if(userCheck == false){
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('삭제할수 없다');");
			out.print("location.href='boardlist.do';");
			out.print("</script>");
			out.close();
			return null;
			
		}
		result = boarddao.boardDelete(num);
		if(result == false){
			System.out.println("게시물 삭제 실패");
			return null;
		}
		System.out.println("게시물 삭제 성공");
		
		///////////////////////////////////////////////////
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("boardlist.do");
		return forward;
	}
}
