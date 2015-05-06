package Mypage.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MsgDelete_DAO {
	
	int row;
	Connection con;
	PreparedStatement pstmt;
	static DataSource ds;
	
	static {
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
		} catch (NamingException e) {
		}
	}
	
	public void getMsgDelete(int m_id) throws Exception{
		String sql = "";
		try{
			con = ds.getConnection();
			sql = "Delete from MESSAGE where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			
			row = pstmt.executeUpdate();
			System.out.println("반영된 로우수 : "+row);
			
			return;
		}catch(Exception ex){
			System.out.println("getmsgDetail 에러 : " + ex);
		}finally{
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(con !=null)try{con.close();}catch(SQLException ex){}
		}
		return ;
	
	}
}