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

import Meeting.DTO.Party_DTO;

public class Partydetails_DAO {

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
	
	public int inserattend(String partyid2, String user_id2) throws SQLException{
		try {
			System.out.println("partydaoinsert로 넘어왔다");
			conn = ds.getConnection();
			
			int partyid = Integer.parseInt(partyid2);
			String user_id = user_id2;
			System.out.println("party id " + partyid);
			System.out.println("user id " + user_id);
			
			System.out.println("insert 들어왔다");
			String sql = 
			"insert into attend values(?,?)";
			int result=0;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, partyid);
				pstmt.setString(2, user_id);
				
				result = pstmt.executeUpdate();
				
				if(result >0){
					System.out.println("insert문 들어감");
				}
				return result;	
				
			} catch (Exception e) {
				return result;
			}
		}finally{
			if(pstmt != null)pstmt.close();
			if(conn != null)pstmt.close();
		}
	}
	
	public int getcount(int id) throws SQLException{
		try {
			System.out.println("partycount로 넘어왔다");
			conn = ds.getConnection();
			String sql = 
			"SELECT COUNT(*) FROM ATTEND WHERE P_ID=?";
			int count = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
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
	
	
	public List getlist(String id) throws SQLException{
		try {
			System.out.println("partydao로 넘어왔다");
			conn = ds.getConnection();
			int ID2 = Integer.parseInt(id);// int type으로 변환
			
			String sql = 
			"SELECT * FROM PARTY WHERE P_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ID2);
			System.out.println("getlist id " + ID2);
			List detaillist = new ArrayList();// party 리스트
			
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
				detaillist.add(party);
			}
			
			return detaillist;	
		}finally{
			if(pstmt != null)pstmt.close();
			if(conn != null)pstmt.close();
		}
	}
}
