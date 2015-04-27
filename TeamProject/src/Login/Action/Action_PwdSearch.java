package Login.Action;

import java.sql.SQLException;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import Login.DAO.PwdSearch_DAO;
import Login.DTO.Member;

public class Action_PwdSearch implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		Member member = new Member();
		member.setName(name);
		member.setId(id);
		member.setEmail(email);
		System.out.println(name);
		System.out.println("여기까진될까?");
		PwdSearch_DAO dao = new PwdSearch_DAO();
		Member result = dao.Search_Pwd(member);
		String error = "정보틀림";
		String result1 = "정보맞음";
		
		
		if(result != null){
			mailtest mailtest = new mailtest(result);
			request.setAttribute("result1", result1);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("PwdSearch.jsp");
			return forward;	
		}else{
			request.setAttribute("error", error);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("PwdSearch.jsp");
			return forward;	
		}
	}	
}
