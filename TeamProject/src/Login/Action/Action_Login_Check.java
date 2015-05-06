package Login.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Login.DAO.Login_DAO;
import Login.DTO.Member;

public class Action_Login_Check implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Login_DAO logindao = new Login_DAO();
		
		Member userch = logindao.getLoginCheck(request.getParameter("mb_id"));
		String pwd = request.getParameter("mb_password");
		
		
		// session
		HttpSession session=request.getSession();
		
		if(userch.getId() == null){
			//잘못된 아이디값
			ActionForward forward = new ActionForward();
			System.out.println("잘못된 아이디값");
			
			forward.setRedirect(false);
			forward.setPath("/Login/Login_fail.jsp");
			
			return forward;
		}else if((userch.getPw()).equals(pwd)){
			//로그인 성공
			ActionForward forward = new ActionForward();
			System.out.println("로그인 성공");
			System.out.println(userch.getPw()==pwd);
			// session set
			session.setAttribute("user",userch);
			session.setAttribute("u_id",request.getParameter("mb_id"));
			forward.setRedirect(true);
			/*forward.setPath("/Main.jsp?mb_id="+request.getParameter("mb_id"));*/
			forward.setPath(request.getContextPath()+"/Mainpage.main");
			
			return forward;
		}else{
			//암호가 다름
			System.out.println(userch.getPw());
			System.out.println(pwd);
			System.out.println((userch.getPw()).equals(pwd));
			System.out.println("암호가 다름");
			ActionForward forward = new ActionForward();
			
			forward.setRedirect(false);
			forward.setPath("/Login/Login_fail.jsp");
			
			return forward;
		}
		
		
		
		
	}
}
