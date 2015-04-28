package Date.Action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Date.DAO.Search_DAO;
import Date.DTO.Search_Column_DTO;
import Date.DTO.Search_DTO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DAO.Login_DAO;
import Login.DTO.Member;

public class Search_Action implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		Search_DAO searchdao = new Search_DAO();
		Search_Column_DTO searColumnDto = new Search_Column_DTO();
		ArrayList<Search_DTO> searMemberSearch = new ArrayList<Search_DTO>();
		
		//searColumnDto.setColArea(request.getParameter("search_area").substring(request.getParameter("search_area").indexOf(".")+1));
		//System.out.println(searColumnDto.getColArea());
		searColumnDto.setValArea(request.getParameter("search_area").substring(0,request.getParameter("search_area").indexOf(".")));
		System.out.println(searColumnDto.getValArea());
		
		//searColumnDto.setColAge1(request.getParameter("search_age1").substring(request.getParameter("search_age1").indexOf(".")+1));
		//System.out.println(searColumnDto.getColAge1());
		searColumnDto.setValAge1(Integer.parseInt(request.getParameter("search_age1").substring(0,request.getParameter("search_age1").indexOf("."))));
		System.out.println(searColumnDto.getValAge1());
		
		//searColumnDto.setColAge2(request.getParameter("search_age2").substring(request.getParameter("search_age2").indexOf(".")+1));
		//System.out.println(searColumnDto.getColAge2());
		searColumnDto.setValAge2(Integer.parseInt(request.getParameter("search_age2").substring(0,request.getParameter("search_age2").indexOf("."))));
		System.out.println(searColumnDto.getValAge2());
		
		//searColumnDto.setColHeight1(request.getParameter("search_stature1").substring(request.getParameter("search_stature1").indexOf(".")+1));
		//System.out.println(searColumnDto.getColHeight1());
		searColumnDto.setValHeight1(Integer.parseInt(request.getParameter("search_stature1").substring(0,request.getParameter("search_stature1").indexOf("."))));
		System.out.println(searColumnDto.getValHeight1());
		
		//searColumnDto.setColHeight2(request.getParameter("search_stature2").substring(request.getParameter("search_stature2").indexOf(".")+1));
		//System.out.println(searColumnDto.getColHeight2());
		searColumnDto.setValHeight2(Integer.parseInt(request.getParameter("search_stature2").substring(0,request.getParameter("search_stature2").indexOf("."))));
		System.out.println(searColumnDto.getValHeight2());
		
		//searColumnDto.setColSal(request.getParameter("search_pay").substring(request.getParameter("search_pay").indexOf(".")+1));
		//System.out.println(searColumnDto.getColSal());
		searColumnDto.setValSal(Integer.parseInt(request.getParameter("search_pay").substring(0,request.getParameter("search_pay").indexOf("."))));
		System.out.println(searColumnDto.getValSal());
		
		//searColumnDto.setColJob(request.getParameter("job").substring(request.getParameter("job").indexOf(".")+1));
		//System.out.println(searColumnDto.getColJob());
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
		
		HttpSession session=request.getSession();
		
		session.setAttribute("searMemberSearch", searMemberSearch);
		
			ActionForward forward = new ActionForward();
			
			
			forward.setRedirect(false);
			forward.setPath("/Date/Search_Success.jsp");
			
			return forward;
			
			
	}

}