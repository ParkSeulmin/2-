package Date.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import Date.Action.ActionDate;
 
import Date.DAO.Search_DAO;
import Date.DTO.Search_Column_DTO;
import Date.DTO.Search_DTO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;

//@WebServlet("/DateController")
public class Search_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Search_Controller() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}
	private void Process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());
		
		System.out.println("RequestURI"+RequestURI);
		System.out.println("contextPath"+contextPath);
		System.out.println("cmd"+cmd);
		
		
		if(cmd.equals("/Date/Search_Controller.sear")){	
			try {
				PrintWriter out = response.getWriter();
				
				
				Search_DAO searchdao = new Search_DAO();
				Search_Column_DTO searColumnDto = new Search_Column_DTO();
				ArrayList<Search_DTO> searMemberSearch = new ArrayList<Search_DTO>();
				
				
				
				
				searColumnDto.setValArea(request.getParameter("search_area").substring(0,request.getParameter("search_area").indexOf(".")));
				System.out.println(searColumnDto.getValArea());
				
				searColumnDto.setValAge1(Integer.parseInt(request.getParameter("search_age1").substring(0,request.getParameter("search_age1").indexOf("."))));
				System.out.println(searColumnDto.getValAge1());
				
				searColumnDto.setValAge2(Integer.parseInt(request.getParameter("search_age2").substring(0,request.getParameter("search_age2").indexOf("."))));
				System.out.println(searColumnDto.getValAge2());
				
				searColumnDto.setValHeight1(Integer.parseInt(request.getParameter("search_stature1").substring(0,request.getParameter("search_stature1").indexOf("."))));
				System.out.println(searColumnDto.getValHeight1());
				
				searColumnDto.setValHeight2(Integer.parseInt(request.getParameter("search_stature2").substring(0,request.getParameter("search_stature2").indexOf("."))));
				System.out.println(searColumnDto.getValHeight2());

				searColumnDto.setValSal(Integer.parseInt(request.getParameter("search_pay").substring(0,request.getParameter("search_pay").indexOf("."))));
				System.out.println(searColumnDto.getValSal());
				
				searColumnDto.setValJob(request.getParameter("job").substring(0,request.getParameter("job").indexOf(".")));
				System.out.println(searColumnDto.getValJob());
				
				if(searColumnDto.getValArea().equals("0")){
					System.out.println("getValArea : 초기화");
					searColumnDto.setValArea("%");
					System.out.println("초기화 된 값 : "+searColumnDto.getValArea());
				}
				if(searColumnDto.getValAge1() == 0){
					System.out.println("getValAge1 : 초기화");
					searColumnDto.setValAge1(0);
					System.out.println("초기화 된 값 : "+searColumnDto.getValAge1());
				}
				if(searColumnDto.getValAge2() == 0){
					System.out.println("getValAge2 : 초기화");
					searColumnDto.setValAge2(200);
					System.out.println("초기화 된 값 : "+searColumnDto.getValAge2());
				}
				if(searColumnDto.getValHeight1() == 0){
					System.out.println("getValHeight1 : 초기화");
					searColumnDto.setValHeight1(0);
					System.out.println("초기화 된 값 : "+searColumnDto.getValHeight1());
				}
				if(searColumnDto.getValHeight2() == 0){
					System.out.println("getValHeight2 : 초기화");
					searColumnDto.setValHeight2(300);
					System.out.println("초기화 된 값 : "+searColumnDto.getValHeight2());
				}
				if(searColumnDto.getValSal() == 0){
					System.out.println("getValSal : 초기화");
					searColumnDto.setValSal(0);
					System.out.println("초기화 된 값 : "+searColumnDto.getValSal());
				}
				if(searColumnDto.getValJob().equals("0")){
					System.out.println("getValJob : 초기화");
					searColumnDto.setValJob("%");
					System.out.println("초기화 된 값 : "+searColumnDto.getValJob());
				}
			
				searMemberSearch = searchdao.getSearch(searColumnDto);
				
				for(int i=0; i<searMemberSearch.size(); i++){
		      	   System.out.println("Action : "+searMemberSearch.get(i).getPhone());
		         }
				
				//HttpSession session=request.getSession();
			/*	response.getWriter().print(searMemberSearch);*/
				
					//ActionForward forward = new ActionForward();
					
					
					//forward.setRedirect(false);
					//forward.setPath("/Date/Search_Success.html");
				//---------------------------------------------------------------------------------
				/*if (forward != null) {
					Member member = (Member) request.getAttribute("result");
					request.setAttribute("member", member);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}else{
					System.out.println("null");
				}*/
				
				
				
				JSONArray seaelist = JSONArray.fromObject(searMemberSearch);
				response.getWriter().print(seaelist);//서버로 데이터 전송
				System.out.println("서버로 list 전송완료");
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		}
	}		
}
