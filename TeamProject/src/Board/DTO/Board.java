package Board.DTO;

import java.sql.Date;

public class Board {
	
	private int bo_no;			// 글번호
	private String bo_title; 	// 글제목
	private Date bo_date; 		// 글날짜
	private String bo_content; 	// 글내용
	private int bo_count; 		// 조횟수
	private String bo_file; 	// 첨부파일
	private String bo_writer; 	// 작성자
	private int bo_id; 		// 게시판 타입
	
	// 생성자
	public Board(){}
	
	public Board(int bo_no, String bo_title, Date bo_date, String bo_content,
			int bo_count, String bo_file, String bo_writer, int bo_id) {
		super();
		this.bo_no = bo_no;
		this.bo_title = bo_title;
		this.bo_date = bo_date;
		this.bo_content = bo_content;
		this.bo_count = bo_count;
		this.bo_file = bo_file;
		this.bo_writer = bo_writer;
		this.bo_id = bo_id;
	}

	// Getter/Setter
	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}

	public String getBo_title() {
		return bo_title;
	}

	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}

	public Date getBo_date() {
		return bo_date;
	}

	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public int getBo_count() {
		return bo_count;
	}

	public void setBo_count(int bo_count) {
		this.bo_count = bo_count;
	}

	public String getBo_file() {
		return bo_file;
	}

	public void setBo_file(String bo_file) {
		this.bo_file = bo_file;
	}

	public String getBo_writer() {
		return bo_writer;
	}

	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}

	public int getBo_id() {
		return bo_id;
	}

	public void setBo_id(int bo_id) {
		this.bo_id = bo_id;
	}
	
	
	
	
	
}
