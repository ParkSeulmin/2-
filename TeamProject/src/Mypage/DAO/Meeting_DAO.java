package Mypage.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Mypage.DTO.Arrow_DTO;

public class Meeting_DAO {
	// DB연결
	// CRUD 작업
	// method 공통 사용 ....
	// 초기자 { } static 초기자 : static{ }
	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	static {
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
			System.out.println("DataSource 객체 생성 성공 !");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	//받는것 ㄱ리스트 개수
	public int Recievecount() throws SQLException {
		
		int count=0;
		conn = ds.getConnection();
		Arrow_DTO arrow = new Arrow_DTO();// arrow 쪽지함

		String sql = "SELECT COUNT(*) FROM ARROW WHERE A_RECIEVEID='HYEJUNG22'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		try {
			if(rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				pstmt.close();
		}
	}
	
	//보내는것 리스트 개수
	public int Sendcount() throws SQLException {
		
		int count=0;
		conn = ds.getConnection();
		Arrow_DTO arrow = new Arrow_DTO();// arrow 쪽지함

		String sql = "SELECT COUNT(*) FROM ARROW WHERE A_SENDID='HYEJUNG22'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		try {
			if(rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				pstmt.close();
		}
	}

	// arrow(메시지) 보낸 목록 띄우기)
	// 임의 ID값 지금은 주고 시작
	public List MessageSendlist() throws SQLException {
		conn = ds.getConnection();
		List sendlist = new ArrayList();// db데이터 리스트로 저장
		Arrow_DTO arrow = new Arrow_DTO();// arrow 쪽지함

		String sql = "SELECT * FROM ARROW WHERE A_SENDID='HYEJUNG22'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		try {
			while (rs.next()) {
				arrow.setA_date(rs.getDate("A_DATE"));//날짜 받아오기
				arrow.setA_id(rs.getInt("A_id"));//인덱스??
				arrow.setA_status(rs.getString("A_STATUS")); //
				arrow.setA_recieveid(rs.getString("A_RECIEVEID"));//수신인 아이디
				sendlist.add(arrow);//객체 리스트 안에 넣음
			}
			return sendlist;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				pstmt.close();
		}
	}
	
	// arrow(메시지) 보낸 목록 띄우기)
	// 임의 ID값 지금은 주고 시작
	public List MessageRecievelist() throws SQLException {
		conn = ds.getConnection();
		List recievelist = new ArrayList();// db데이터 리스트로 저장
		Arrow_DTO arrow = new Arrow_DTO();// arrow 쪽지함

		String sql = "SELECT * FROM ARROW WHERE A_RECIEVEID='HYEJUNG22'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		try {
			while (rs.next()) {
				arrow.setA_date(rs.getDate("A_DATE"));//날짜 받아오기
				arrow.setA_id(rs.getInt("A_id"));//인덱스??
				arrow.setA_status(rs.getString("A_STATUS")); //
				arrow.setA_sendid(rs.getString("A_SENDID"));
				recievelist.add(arrow);//객체 리스트 안에 넣음
			}
			return recievelist;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				pstmt.close();
		}
	}

}
