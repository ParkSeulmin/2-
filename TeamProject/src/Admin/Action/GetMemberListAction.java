package Admin.Action;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Admin.DAO.AdminDAO;
import Login.DTO.Member;

 public class GetMemberListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward= new ActionForward();
		HttpSession session=request.getSession();
		
		AdminDAO admindao=new AdminDAO();
		List memberlist=new ArrayList(); 
		
	  	int page=1;
		int limit=10;
		
		 
		
		// session user admin
		Member user = null;
		user=(Member)session.getAttribute("user");
		if(user == null){			
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('접근 불가');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}else{
			if(user.getAdmin()!=1){
				System.out.println("session user: "+user.getId()+" / user.admin: "+user.getAdmin());

				response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('접근 불가');");
		   		out.println("history.back();");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
		}
		
		 

		if(request.getParameter("page")!=null){
			
			page=Integer.parseInt(request.getParameter("page"));
			System.out.println("getmemberlist page"+page);
		}
		
		
		int membercount= admindao.getMemberListCount(); //총 리스트 수를 받아 옴
		memberlist = admindao.getMemberList(page, limit); //리스트를 받아 옴

		//총 페이지 수
   		int maxpage=(int)((double)membercount/limit+0.95); //0.95를 더해서 올림 처리
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		request.setAttribute("mpage", page);  //현재 페이지 수
   		request.setAttribute("mmaxpage", maxpage);  //최대 페이지 수
   		request.setAttribute("mstartpage", startpage);  //현재 페이지에 표시할 첫 페이지 수
   		request.setAttribute("mendpage", endpage);  //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("membercount",membercount);  // 회원 수 
		request.setAttribute("memberlist", memberlist);
 
		
	   	forward.setRedirect(false);
   		forward.setPath("./Adminpage/member_list.jsp");
   		return forward;
	 }

 }
