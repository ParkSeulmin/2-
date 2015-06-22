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


import Mypage.DTO.Message_DTO;

public class Msgsend_DAO {

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
				} catch (NamingException e) {
				}
			}
			
			
			//받은 쪽지 갯수 반환
			public int getsendmsgcount(String userid) throws SQLException{
				try {
					conn = ds.getConnection();
					String sql = 
					"select count(*) from MESSAGE where M_SENDID=?";
					int count = 0;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,userid);
					
					rs= pstmt.executeQuery();

					while(rs.next()){
						count = rs.getInt(1);//결과 값 받아옴 
					}
					System.out.println("send msg count" + count);
					return count;	
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
			}
			
			
			//id값 비교해서 목록 불러오기
			public ArrayList<Message_DTO> getsendlist(String userid) throws SQLException{
				try {
					conn = ds.getConnection();
					String sql = 
					"select * from MESSAGE where M_SENDID=? ORDER BY M_DATE desc";
					ArrayList<Message_DTO> smsg = new ArrayList<Message_DTO>();// 받은 메시지 리스트
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,userid);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						Message_DTO dto = new Message_DTO();
						dto.setM_CONTENT(rs.getString("M_CONTENT"));
						dto.setM_TITLE(rs.getString("M_TITLE"));
						dto.setM_DATE(rs.getDate("M_DATE"));
						dto.setM_ID(rs.getInt("M_ID"));
						dto.setM_RECIEVEID(rs.getString("M_RECIEVEID"));
						dto.setM_SENDID(rs.getString("M_SENDID"));
						smsg.add(dto);
					}
					
					return smsg;	
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
			}
				




}
