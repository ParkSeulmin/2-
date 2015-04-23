package Mypage.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = RequestURI.substring(contextPath.length());

		// String cmd = request.getParameter("cmd")
		// if(cmd.equals("boardlist"){}
		// 위 처럼 parameter 넘어오는 값으로 판단 하지 않겠다

		if (cmd.equals("/Mypage/find_id.check")) {
			try {
				action = new Mypage_Id_Check_Action();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (forward != null) {
				if (forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					RequestDispatcher dispatcher = request
							.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
		} else if (cmd.equals("/Mypage/IdView.check")) {
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			forward.setRedirect(false);
			forward.setPath("/Mypage/Mypage_Find_Fail.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward
					.getPath());
			dispatcher.forward(request, response);
		}

	}
}
