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
		String result = "";
		// session
		HttpSession session=request.getSession();
		
		if(user.getId() == null){
			result += "잘못된 아이디입니다.";
			ActionForward forward = new ActionForward();
			
			request.setAttribute("result", result);
			forward.setRedirect(false);
			forward.setPath("/Login/Login_fail.jsp");
			
			return forward;
		}else if(user.getPw().equals(pwd)){
			result += "로그인 성공";
			ActionForward forward = new ActionForward();
			
			// session set
			session.setAttribute("user",user);
			
			forward.setRedirect(true);
			/*forward.setPath("/Main.jsp?mb_id="+request.getParameter("mb_id"));*/
			forward.setPath(request.getContextPath()+"/Main.jsp");
			
			return forward;
		}else{
			result += "암호가 틀렸습니다.";
			ActionForward forward = new ActionForward();
			
			request.setAttribute("result", result);
			forward.setRedirect(false);
			forward.setPath("/Login/Login_fail.jsp");
			
			return forward;
		}
		
		
		
		
	}
	

	/*public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Login_DAO logindao = new Login_DAO();
		
		String idpwd = logindao.getLoginCheck(request.getParameter("mb_id"));
		String pwd = request.getParameter("mb_password");
		String result = "";
		
		if(idpwd.equals(pwd)){
			result += "로그인 성공";
		}else{
			result += "로그인 실패";
		}
		
		System.out.println(result);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/Login/Login_Check.jsp?result="+request.getParameter("mb_id"));
		System.out.println(forward.getPath());
		return forward;
		
		
	}
	*/

}
