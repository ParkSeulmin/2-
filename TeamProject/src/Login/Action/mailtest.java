package Login.Action;
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

import Login.DTO.Member;

public class mailtest {
	public mailtest(Member result) throws Exception{
		
        Properties props = new Properties(); 
        props.setProperty("mail.transport.protocol", "smtp"); 
        props.setProperty("mail.host", "smtp.gmail.com"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.port", "465"); 
        props.put("mail.smtp.socketFactory.port", "465"); 
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        props.put("mail.smtp.socketFactory.fallback", "false"); 
        props.setProperty("mail.smtp.quitwait", "false");
        
        Member member = result;
        String id = member.getId();
        String pwd = member.getPw();
        String name = member.getName();
        String email = member.getEmail();
        
        Action_PwdSearch ap = new Action_PwdSearch();
        
        
        Authenticator auth = new Authenticator(){
        	protected PasswordAuthentication getPasswordAuthentication() { 
                return new PasswordAuthentication("hyun74445874@gmail.com", "k99924467"); //보내는 사람 ID, PWD
            }
        };

        Session session = Session.getDefaultInstance(props,auth);
        
        MimeMessage message = new MimeMessage(session); 
        message.setSender(new InternetAddress("hyun74445874@gmail.com")); //보내는 사람 ID
        
        if(member.getId() != null ){
        	message.setSubject("ID 확인"); //제목
        }else if(member.getPw() != null){
        	message.setSubject("비밀번호 확인"); //제목
        }

        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email)); //받는사람 ID
        
        Multipart mp = new MimeMultipart();
        MimeBodyPart mbp1 = new MimeBodyPart();
        
        if(member.getId() != null ){
        	mbp1.setText(name + "님의 ID는 : " + id); //내용
        }else if(member.getPw() != null){
        	mbp1.setText(name + "님의 비밀번호는 : " + pwd); //내용
        }
        
        mp.addBodyPart(mbp1);

        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
        CommandMap.setDefaultCommandMap(mc);
   
        message.setContent(mp);
        
        Transport.send(message);
	}

}
