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

		String cmd = request.getParameter("cmd");

		// String cmd = request.getParameter("cmd")
		// if(cmd.equals("boardlist"){}
		// 위 처럼 parameter 넘어오는 값으로 판단 하지 않겠다

		if (cmd.equals("myid.check")) {

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (forward != null) {
				if (forward.isRedirect()) { // view 단 바로....
					System.out.println("forward.isRedirect() : "
							+ forward.isRedirect());
					response.sendRedirect(forward.getPath());
				} else {
					System.out.println("forward.getPath() : "
							+ forward.getPath());
					RequestDispatcher dispatcher = request
							.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
		}

	}
}
