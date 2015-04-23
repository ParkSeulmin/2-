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



public class Mypage_Id_Check_DAO {

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
	public Member Mypage_Id_Test(Member member) throws SQLException{

		String member_id=null;
		String member_email=null;
		String member_pwd=null;

		try {
			conn=ds.getConnection();
			String sql ="select u_id,u_email from member where u_email=? and u_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getId());
			rs=pstmt.executeQuery();
			
			member_id=rs.getString("u_id");
			member_email=rs.getString("u_email");
			member_pwd=rs.getString("u_pwd");
			
			Member result_member= new Member();//결과로 나온 애들, 만약 둘의 조건을 동시에 만족하는 데이터가 없다면 null값이 저장된 객체가 생성된다.
			result_member.setId(member_id);
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