package Meeting.DTO;

import java.util.Date;

public class Party_DTO {
	private int P_ID;//파티id
	private String P_TITLE;//파티제목
	private Date P_DATE;//파티날짜
	private String P_AREA;//파티장소
	private String P_STATUS;//파티 상태
	private int P_MAXPEOPLE;//파티 최대 인원
	private int Count;// 총 게시물 수 
	private String P_IMG;//이미지
	
	
	public int getCount() {
		return Count;
	}
	public void setCount(int count) {
		Count = count;
	}
	public String getP_IMG() {
		return P_IMG;
	}
	public void setP_IMG(String p_IMG) {
		P_IMG = p_IMG;
	}
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	public String getP_TITLE() {
		return P_TITLE;
	}
	public void setP_TITLE(String p_TITLE) {
		P_TITLE = p_TITLE;
	}
	public Date getP_DATE() {
		return P_DATE;
	}
	public void setP_DATE(Date p_DATE) {
		P_DATE = p_DATE;
	}
	public String getP_AREA() {
		return P_AREA;
	}
	public void setP_AREA(String p_AREA) {
		P_AREA = p_AREA;
	}
	public String getP_STATUS() {
		return P_STATUS;
	}
	public void setP_STATUS(String p_STATUS) {
		P_STATUS = p_STATUS;
	}
	public int getP_MAXPEOPLE() {
		return P_MAXPEOPLE;
	}
	public void setP_MAXPEOPLE(int p_MAXPEOPLE) {
		P_MAXPEOPLE = p_MAXPEOPLE;
	}
	
}
