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

import Meeting.DTO.Party_DTO;

public class Myparty_DAO {
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

	
	
	public List getpartylist(String user) throws SQLException{
		try {
			System.out.println("partydao로 넘어왔다");
			conn = ds.getConnection();
			String sql = 
			"select * from party where p_id in (SELECT p_id FROM ATTEND where u_id=?)";
			List partylist = new ArrayList();// party 리스트
			pstmt = conn.prepareStatement(sql);
			System.out.println("myparty dao 이중쿼리");
			pstmt.setString(1,user);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Party_DTO party = new Party_DTO();
				party.setP_AREA(rs.getString("P_AREA"));
				party.setP_DATE(rs.getDate("P_DATE"));
				party.setP_ID(rs.getInt("P_ID"));
				party.setP_MAXPEOPLE(rs.getInt("P_MAXPEOPLE"));
				party.setP_STATUS(rs.getString("P_STATUS"));
				party.setP_TITLE(rs.getString("P_TITLE"));
				partylist.add(party);
			}
			
			return partylist;	
		}finally{
			if(pstmt != null)pstmt.close();
			if(conn != null)pstmt.close();
		}
	}

}
