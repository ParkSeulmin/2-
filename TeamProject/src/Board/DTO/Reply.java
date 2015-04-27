package Board.DTO;

import java.sql.Date;

public class Reply {
	private int r_no;	// 덧글 번호
	private String re_content; // 덧글내용
	private Date re_date; // 댓글 작성 시간
	private int bo_no; // 댓글단 게시판 번호
	private String re_writer; // 댓글 작성자 
	
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getBo_no() {
		return bo_no;
	}
	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	
	
	
}
