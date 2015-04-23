package Login.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Action.Action;
import Login.Action.ActionForward;
import Login.Action.JoinAction;
import Login.DAO.Join;

//@WebServlet("/JoinCheck_Controller")

public class JoinCheck_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinCheck_Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		doProcess(request, response);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException, Exception {
		PrintWriter out = res.getWriter();
		
		String id = req.getParameter("id");//아이디 받아오기
		System.out.println("체크 컨트롤러 mb_id : " + id);
		
		
		
		Join dao = new Join();
		int tag = dao.idcheck(id);//id 값 db 쿼리문으로 보내기
 
		
		if(tag ==1){
			//아이디중복
			System.out.println("------------------");
			System.out.println("id존재한다");

		}else{
			//중복아님
			System.out.println("------------------");
			System.out.println("id존재x");
		}
		//데이터 client로 전달
		res.getWriter().print(tag);
		
	}
}
