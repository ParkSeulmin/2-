package Meeting.DAO;

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

import Login.DTO.Member;
import Meeting.DTO.Party_DTO;

public class Party_DAO {
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
					System.out.println("partyDataSource 객체 생성 성공 !");
				} catch (NamingException e) {
					System.out.println("lookup Fail : " + e.getMessage());
				}
			}
			
			
		public int getcount() throws SQLException{
				try {
					System.out.println("partydao로 넘어왔다");
					conn = ds.getConnection();
					String sql = 
					"SELECT COUNT(*) FROM PARTY";
					int count = 0;
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					Party_DTO party = new Party_DTO();
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						count = rs.getInt(1);
					}
					System.out.println("count" + count);
					return count;	
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
			}
			
			
			//party 목록 불러오기
			public List getpartylist() throws SQLException{
				try {
					System.out.println("partydao로 넘어왔다");
					conn = ds.getConnection();
					String sql = 
					"SELECT * FROM PARTY";
					List partylist = new ArrayList();// party 리스트
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						Party_DTO party = new Party_DTO();
						party.setP_AREA(rs.getString("P_AREA"));
						party.setP_DATE(rs.getDate("P_DATE"));
						party.setP_ID(rs.getInt("P_ID"));
						party.setP_MAXPEOPLE(rs.getInt("P_MAXPEOPLE"));
						party.setP_STATUS(rs.getString("P_STATUS"));
						party.setP_TITLE(rs.getString("P_TITLE"));
						party.setP_IMG(rs.getString("P_IMG"));
						partylist.add(party);
					}
					
					return partylist;	
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
			}
				


}
