
package Admin.Action;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 



import Admin.DAO.AdminDAO;
import Login.DTO.Member;
import Meeting.DTO.Party_DTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class PartyAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
		AdminDAO admindao = new AdminDAO();
		Party_DTO partydata = new Party_DTO();				
		 
	   	ActionForward forward=new ActionForward();
	   	
	   	HttpSession session=request.getSession();
		 
	   	System.out.println("session.getAttribute: ?!?"+session.getAttribute("user"));
		if(session.getAttribute("user") == null){
	   		response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('관리자만 파티만들기가 가능합니다.');");
	   		out.println("history.back();");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}   		
	   	
		String realFolder="";
   		String saveFolder="boardupload";
   		
   		int fileSize=5*1024*1024;
   		
   		realFolder=request.getRealPath(saveFolder);
   		System.out.println("board file realFolder: "+ realFolder);
   		
   		boolean result=false;
   		String msg = "";
   		String url = "";
   	 
   		
   		try{
   			//if(request.getSession().getAttribute("userid") != null){
	   			MultipartRequest multi=null;
	   			
	   			multi=new MultipartRequest(request,
	   					realFolder,
	   					fileSize,
	   					"utf-8",
	   					new DefaultFileRenamePolicy());
	   			
	   			partydata.setP_TITLE(multi.getParameter("p_title"));
		   		partydata.setP_AREA(multi.getParameter("p_area"));
		   		/*partydata.setP_DATE(Date.parse(multi.getParameter("p_date")));*/
		   		partydata.setP_MAXPEOPLE(Integer.parseInt(multi.getParameter("p_maxpeople")));
		   		partydata.setP_IMG(
		   				multi.getFilesystemName(
		   						(String)multi.getFileNames().nextElement()));
		   		
		   		result = admindao.PartyAdd(partydata);
		   		
		   		
		   		if(result == false){
		   			msg = "파티 등록 실패";
		   			url = "./PartyListadmin.admin";
		   		}else{
		   			msg = "파티 등록 성공";
		   			url ="./PartyListadmin.admin";
		   		}
	   		
		   		request.setAttribute("board_msg", msg);
		   		request.setAttribute("board_url", url);
		   		
		   		forward.setRedirect(false);
		   		forward.setPath("/Adminpage/redirect.jsp");
		   		return forward;
		   		
   			 

  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	

}
