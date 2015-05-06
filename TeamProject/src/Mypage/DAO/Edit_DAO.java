package Mypage.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Login.DTO.Member;
import Login.DTO.Personal_Info;

public class Edit_DAO {

	//DB연결
	//CRUD 작업
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
		
		//회원가입 기본정보 입력
		public int editinsereok(Member dto) throws SQLException{
			try {
				conn = ds.getConnection();
				String sql = 
				"update member set U_NNAME=?,u_addr=?,U_EMAIL=?,U_MYPICTURE=?, U_PHONE=?  where U_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getNick());
				pstmt.setString(2, dto.getAddress());
				pstmt.setString(3, dto.getEmail());
				pstmt.setString(4, dto.getU_mypicture());
				pstmt.setString(5, dto.getPhone());
				pstmt.setString(6, dto.getId());

				int row = pstmt.executeUpdate();//db확인
				
				return row;
			}finally{
				if(pstmt != null)pstmt.close();
				if(conn != null)pstmt.close();
			}
		}
		
		//회원 탈퇴
		public int deleteok(Member dto) throws SQLException{
			try {
				conn = ds.getConnection();
				String sql = 
				"delete from  member where u_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
			

				int row = pstmt.executeUpdate();//db확인
				
				return row;
			}finally{
				if(pstmt != null)pstmt.close();
				if(conn != null)pstmt.close();
			}
		}
		
		//추가정보수정
		public int addinfoinsereok(Personal_Info dto) throws SQLException{
			try {
				conn = ds.getConnection();
				String sql = 
				"update PERSONALINFO set CONTENT=?,FSCHOOL=?,SAL=?,HEIGHT=?,WEIGHT=?,JOB=? where U_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,dto.getContent());
				pstmt.setString(2, dto.getFschool());
				pstmt.setInt(3, dto.getSal());
				pstmt.setInt(4, dto.getHeight());
				pstmt.setInt(5, dto.getWeight());
				pstmt.setString(6, dto.getJob());
				pstmt.setString(7,dto.getU_ID());

				System.out.println("add dao 성공");
				int row = pstmt.executeUpdate();//db확인
				
				return row;
				
			}finally{
				if(pstmt != null)pstmt.close();
				if(conn != null)pstmt.close();
			}
		}
		

		
		public int pwdedit(Member dto) throws SQLException{
			try {
				conn = ds.getConnection();
				String sql = 
				"update member set U_PWD=?  where U_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getPw());
				pstmt.setString(2, dto.getId());

				int row = pstmt.executeUpdate();//db확인
				
				return row;
				
			}finally{
				if(pstmt != null)pstmt.close();
				if(conn != null)pstmt.close();
			}
			
		}
}
