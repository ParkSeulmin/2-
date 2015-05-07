package Login.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Action.Action;
import Login.Action.ActionForward;
import Login.Action.Login_Id_Check_Action;
import Login.Action.Login_Myself_Check_Action;
import Login.DTO.Member;

@WebServlet("*.check")
public class Login_BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login_BoardFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}

	private void Process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		ActionForward forward = null;
		Action action = null;

		// 주소와 명령을 분리
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());

		if (cmd.equals("/Login/find_id.check")) {// 명령이 id찾기인 경우
			try {
				System.out.println("ㅁ머나이러ㅏㅁ닝러ㅏㅣㅁㄴㅇ러ㅏㅣ 값은 넘어감");
				
				forward = new ActionForward();
				action = new Login_Id_Check_Action();//
				// 액션에서 만들어 온 forward 객체를 가져옴.(Execute)
				// Member me=(Member) request.getAttribute("result");

				forward = action.execute(request, response);
				// forward.setRedirect(false); <<결과를 가져옴
				// forward.setPath("IdView.check");

				if (forward != null) {
					Member member = (Member) request.getAttribute("result");
					request.setAttribute("member", member);
					System.out.println(member.getEmail() + "여긴되야됭");
					RequestDispatcher dispatcher = request
							.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				
			}
		} else if (cmd.equals("/Login/MySelf.check")) {
			try {
				String na=request.getParameter("name");
				request.setAttribute("name1", na);
				forward = new ActionForward();
				action = new Login_Myself_Check_Action();// 해당하는 액션 넣어주기
				forward = action.execute(request, response);

				if (forward != null) {
					String result = (String) request.getAttribute("result");
					request.setAttribute("result", result);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}finally{}
		}
	}
}
