package Mypage.DTO;

import java.util.Date;

public class Message_DTO {
	private int M_ID;//메시지번호
	private String M_TITLE;//제목
	private String M_CONTENT;//내용
	private Date M_DATE;//날짜
	private String M_RECIEVEID;//받은아이디
	private String M_SENDID;//보낸아이디
	public int getM_ID() {
		return M_ID;
	}
	public void setM_ID(int m_ID) {
		M_ID = m_ID;
	}
	public String getM_TITLE() {
		return M_TITLE;
	}
	public void setM_TITLE(String m_TITLE) {
		M_TITLE = m_TITLE;
	}
	public String getM_CONTENT() {
		return M_CONTENT;
	}
	public void setM_CONTENT(String m_CONTENT) {
		M_CONTENT = m_CONTENT;
	}
	public Date getM_DATE() {
		return M_DATE;
	}
	public void setM_DATE(Date m_DATE) {
		M_DATE = m_DATE;
	}
	public String getM_RECIEVEID() {
		return M_RECIEVEID;
	}
	public void setM_RECIEVEID(String m_RECIEVEID) {
		M_RECIEVEID = m_RECIEVEID;
	}
	public String getM_SENDID() {
		return M_SENDID;
	}
	public void setM_SENDID(String m_SENDID) {
		M_SENDID = m_SENDID;
	}
	
}
