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



public class Mypage_Id_Check {

	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	static{
		InitialContext ctx;
		try {
			ctx=new InitialContext();
			Context envCtx=(Context)ctx.lookup("java:comp/env");
			ds=(DataSource)envCtx.lookup("/jdbc/oracle");
		} catch (NamingException e) {
		}
		
	}
	public Member Mypage_Id_Test(String memberid) throws SQLException{
		String input_id=memberid;
		String member_id=null;
		String member_email=null;
		String member_pwd=null;

		try {
			conn=ds.getConnection();
			String sql ="select u_id, u_email,u_pwd from member where u_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, input_id);
			rs=pstmt.executeQuery();
			
			member_id=rs.getString("u_id");
			member_email=rs.getString("u_email");
			member_pwd=rs.getString("u_pwd");
			
			Member result_member= new Member();
			result_member.setId(member_id);
			result_member.setPw(member_pwd);
			result_member.setEmail(member_email);
			
			return result_member; 
			
		} /*catch (Exception e) {
		}*/
		finally{
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();

		}
		
	}
}