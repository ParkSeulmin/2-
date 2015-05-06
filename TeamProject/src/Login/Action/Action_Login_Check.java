//기존에 작업했던 서비스 계층
//글을 쓰는 서비스 
//Action 패키지 안에 구현

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
		
		Member user = logindao.getLoginCheck(request.getParameter("mb_id"));
		String pwd = request.getParameter("mb_password");
		
		// session
		HttpSession session=request.getSession();
		
		if(user.getId() == null){
			//잘못된 아이디값
			ActionForward forward = new ActionForward();
	
			
			forward.setRedirect(false);
			forward.setPath("/Login/Login_fail.jsp");
			
			return forward;
		}else if(user.getPw().equals(pwd)){
			//로그인 성공
			ActionForward forward = new ActionForward();
			
			// session set
			session.setAttribute("user",user);
			
			forward.setRedirect(true);
			/*forward.setPath("/Main.jsp?mb_id="+request.getParameter("mb_id"));*/
			forward.setPath(request.getContextPath()+"/Mainpage.main");
			
			return forward;
		}else{
			//암호가 다름
			ActionForward forward = new ActionForward();
			
			session.setAttribute("user",user);
			forward.setRedirect(false);
			forward.setPath("/Login/Login_fail.jsp");
			
			return forward;
		}
		
		
		
		
	}
}
