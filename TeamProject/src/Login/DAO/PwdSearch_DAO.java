package Login.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Login.DTO.Member;

public class PwdSearch_DAO {
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
	public Member Search_Pwd(Member member) throws SQLException{
		Member result = null;
		
		try {
			
			conn = ds.getConnection();
			System.out.println("dao 접근확인222");
			String sql = "select u_name, u_id, u_email, u_pwd from member where u_name=? and u_id=? and u_email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getEmail());
			rs = pstmt.executeQuery();
			System.out.println("dao 접근확인");
			if(rs.next()){
				result = new Member();
				result.setName(rs.getString("u_name"));
				result.setId(rs.getString("u_id"));
				result.setEmail(rs.getString("u_email"));
				result.setPw(rs.getString("u_pwd"));	
				System.out.println("객체 생성 확인");
				
			}
			return result;
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();
		}
		return result;
		
	}
}
