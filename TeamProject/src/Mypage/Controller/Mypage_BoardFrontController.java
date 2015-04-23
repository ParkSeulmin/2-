package Mypage.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.DTO.Member;
import Mypage.Action.Mypage_Action;
import Mypage.Action.Mypage_ActionForward;
import Mypage.Action.Mypage_Id_Check_Action;
import Mypage.DAO.Mypage_Id_Check_DAO;

@WebServlet("*.check")
public class Mypage_BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Mypage_BoardFrontController() {
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

	private void Process(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Mypage_ActionForward forward = null;
		Mypage_Action action = null;

		// 주소와 명령을 분리
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());

		if (cmd.equals("/Mypage/find_id.check")) {// 명령이 id찾기인 경우
			try {
				forward = new Mypage_ActionForward();
				action = new Mypage_Id_Check_Action();//
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
			}
		} else if (cmd.equals("/Mypage/IdView.check")) {
			// forward.setRedirect(true);

		}
		/*
		 * if(forward!=null){ RequestDispatcher dispatcher =
		 * request.getRequestDispatcher(forward.getPath());
		 * dispatcher.forward(request, response); }
		 */
	}
}
