package Admin.Action;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Admin.DAO.AdminDAO;
import Login.DTO.Member;

 public class GetSsomeListAction implements Action {
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
      ActionForward forward= new ActionForward();
      HttpSession session=request.getSession();
      
      AdminDAO admindao=new AdminDAO();
      List ssomelist= new ArrayList<Member>();
      
        int page=1;
      int limit=3;
      int membercount = 0;
      List memberlist=new ArrayList(); //회원 리스트 담을 액션
      memberlist = admindao.getMemberList(page, limit);
      System.out.println("memberlist 뽑을거다");
      
      //총 페이지 수
         int maxpage=0;
         //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
         int startpage = 0;
         //현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
         int endpage = 0;
         
          

         if(request.getParameter("page")!=null){
         
         page=Integer.parseInt(request.getParameter("page"));
         System.out.println("getmemberlist page"+page);
      }

      // session user admin
      Member user = null;
      user=(Member)session.getAttribute("user");
      
      if(user == null){   
         ssomelist = null;
         request.setAttribute("page", page);  //현재 페이지 수
            request.setAttribute("maxpage", maxpage);  //최대 페이지 수
            request.setAttribute("startpage", startpage);  //현재 페이지에 표시할 첫 페이지 수
            request.setAttribute("sendpage", endpage);  //현재 페이지에 표시할 끝 페이지 수
         request.setAttribute("membercount",membercount);  // 회원 수 
         request.setAttribute("memberlist", memberlist);
         request.setAttribute("ssomelist", ssomelist);
         forward.setRedirect(false);
            forward.setPath("/Main.jsp");
            return forward;
      } 
      
 
       
      ssomelist = admindao.getSsomeList(user.getId(), page, limit); //리스트를 받아 옴
      membercount = admindao.getSsomeListCount(user.getId());
      System.out.println("membercount : "+membercount);
        maxpage=(int)((double)membercount/limit+0.95); //0.95를 더해서 올림 처리
         //현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
           startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
         //현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
           endpage = maxpage;
           
           System.out.println("getssomelistaction maxpage: "+ maxpage);
         System.out.println("getssomelistaction page: "+ page);
         
         request.setAttribute("page", page);  //현재 페이지 수
         request.setAttribute("maxpage", maxpage);  //최대 페이지 수
         request.setAttribute("startpage", startpage);  //현재 페이지에 표시할 첫 페이지 수
         request.setAttribute("sendpage", endpage);  //현재 페이지에 표시할 끝 페이지 수
      request.setAttribute("membercount",membercount);  // 회원 수 

         request.setAttribute("ssomelist", ssomelist);
         request.setAttribute("memberlist", memberlist);
 
 
      
         forward.setRedirect(false);
         forward.setPath("/Main.jsp");
         return forward;
    }

 }