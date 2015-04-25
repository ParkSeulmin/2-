package Mypage.DTO;

import java.util.Date;

public class Arrow_DTO {
	private int a_id;//index 같은 개념
	private Date a_date;//받은날짜
	private String a_status;//상태표시
	private String a_recieveid;//수신인
	private String a_sendid;//발신인
	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public String getA_status() {
		return a_status;
	}
	public void setA_status(String a_status) {
		this.a_status = a_status;
	}
	public String getA_recieveid() {
		return a_recieveid;
	}
	public void setA_recieveid(String a_recieveid) {
		this.a_recieveid = a_recieveid;
	}
	public String getA_sendid() {
		return a_sendid;
	}
	public void setA_sendid(String a_sendid) {
		this.a_sendid = a_sendid;
	}
}
