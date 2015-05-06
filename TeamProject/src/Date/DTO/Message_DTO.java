package Date.DTO;

import java.util.Date;
public class Message_DTO {
	private int m_id;
	private String m_title;
	private String m_content; 
	private Date m_date ;//의심
	private String m_recieveid;
	private String m_sendid ;
	private int m_check ;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_recieveid() {
		return m_recieveid;
	}
	public void setM_recieveid(String m_recieveid) {
		this.m_recieveid = m_recieveid;
	}
	public String getM_sendid() {
		return m_sendid;
	}
	public void setM_sendid(String m_sendid) {
		this.m_sendid = m_sendid;
	}
	public int getM_check() {
		return m_check;
	}
	public void setM_check(int m_check) {
		this.m_check = m_check;
	}

}
