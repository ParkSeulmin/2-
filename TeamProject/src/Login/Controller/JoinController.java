package Login.Controller;

import java.io.IOException;
import java.sql.SQLException;

import Login.Action.Action;
import Login.Action.ActionForward;
import Login.Action.JoinAction;
import Login.DAO.*;
import Login.DTO.Member;
import Login.DTO.Personal_Info;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException, Exception {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=utf-8");
		res.setCharacterEncoding("utf-8");
		
		String RequestURI = req.getRequestURI();
		String ContextPath = req.getContextPath();

		String command = RequestURI.substring(ContextPath.length());

		// RequestURI : /Web_JSP17_ServletBoard/boardList.do
		// ContextPath : /Web_JSP17_ServletBoard
		// command : /boardList.do

		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("command : " + command);

		// 일괄처리를 위해서
		ActionForward forward = null;
		Action action = null;

		// String cmd = request.getParameter("cmd")
		// if(cmd.equals("boardlist"){}
		// 위 처럼 parameter 넘어오는 값으로 판단 하지 않겠다

		if (command.equals("/Login/JoinController.do")) {
			System.out.println("Join한다");
			// action = new .....
			action = new JoinAction();
			// action 객체 변수 ....

			try {
				forward = action.execute(req, res);
				
				System.out.println("Join :" + forward.getPath());
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if (forward != null) {
			if (forward.isRedirect()) { // view 단 바로....
				res.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward
						.getPath());
				dispatcher.forward(req, res);
			}
		}
	}
}
