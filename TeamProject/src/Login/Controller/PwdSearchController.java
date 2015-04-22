/*package Login.Controller;

import java.io.IOException;
import Login.DTO.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.util.jar.pack.Package.Class.Member;

//@WebServlet("*.do")
public class PwdSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PwdSearchController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}
	
	private void Process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		String command = req.getParameter("cmd");
		
		if(command.equals("registerok")){
			String name = req.getParameter("id");
			String id = req.getParameter("id");
			String email = req.getParameter("email");
			
			Member dto = new Member();		
			dto.setName(name);
			dto.setId(id);
			dto.setEmail(email);
			
		}
		
}
*/