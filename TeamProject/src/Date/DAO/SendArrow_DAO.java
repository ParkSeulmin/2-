package Date.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Login.DTO.Member;

public class SendArrow_DAO {
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
           
        }catch(Exception e){
        }
	}
	public Member ArrowSearch_DAO(Member member){
		Member result = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select u_id,u_name,u_phone,u_nname,u_email,u_age,u_addr from member where u_name=? and u_age";
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
		
	}
}
