package Login.Controller;
package Login.DAO;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doProcess(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
/*		U_ID
		U_PWD
		U_NAME
		U_JUMIN
		U_PHONE
		U_NNAME
		U_GENDER
		U_EMAIL
		U_AGE
		U_ADDR
		U_ISADMIN*/
		
			String U_ID = req.getParameter("mb_id");//id
			String U_PWD = req.getParameter("reg_mb_password");//password
			String U_PWD2 = req.getParameter("reg_mb_password_re");//password 확인
			String U_NAME = req.getParameter("reg_mb_name");//이름
			String U_JUMIN =req.getParameter("mb_birth") +  req.getParameter("mb_birth2");//주민
			String U_PHONE = req.getParameter("mb_hp2");//번호
			String U_PHONE2 = req.getParameter("mb_hp3");//번호
			String U_NNAME = req.getParameter("reg_mb_nick");//닉네임
			int U_GENDER = Integer.parseInt(req.getParameter("mb_sex"));//성별
			String U_EMAIL = req.getParameter("reg_mb_email1");//이메일
			String U_EMAIL2 = req.getParameter("reg_mb_email2");//이메일
			int U_AGE= Integer.parseInt(req.getParameter("email"));//성별
			String U_ADDR= req.getParameter("address");//이메일

			// DTO 객체
			
			
			Join dto = new 
			dto.setEmail(email);
			dto.setId(id);
			dto.setPwd(pwd);

			// DB작업 DAO 객체 생성
			mvcRegisterdao dao = new mvcRegisterdao();
			int result = 0;
			String objData = "";
			try {
				result = dao.writeok(dto);
				if (result > 0) {
					objData = "welcome to javaworld" + id + "님";
				} else {
					objData = "insert fail";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 데이터담기
			req.setAttribute("result", objData);

			// view 설정
			RequestDispatcher dis = req
					.getRequestDispatcher("/WEB-INF/Register/Register_welcome.jsp");

			// forward
			dis.forward(req, res);
		} else if (command.equals("register")) {
			// 순수하게 page 정보(view)
			RequestDispatcher dis = req
					.getRequestDispatcher("/WEB-INF/Register/Register.jsp");

			// forward
			dis.forward(req, res);
		}
	}

}
