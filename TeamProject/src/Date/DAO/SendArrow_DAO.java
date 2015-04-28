package Date.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.taglibs.standard.tag.common.core.SetSupport;

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
	//신청한 사람의 정보 불러오기
	public Member ArrowSearch_DAO(Member member) throws SQLException{
		Member result = null;
		try {
			conn = ds.getConnection();
			String sql = "select u_name,u_phone,u_nname,u_email,u_age,u_addr from member where u_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = new Member();
				result.setName(rs.getString("u_name"));
				result.setPhone(rs.getString("u_phone"));
				result.setNick(rs.getString("u_nname"));
				result.setEmail(rs.getString("u_email"));
				result.setAge(rs.getInt("u_age"));
				result.setAddress(rs.getString("u_addr"));
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
	//받는사람의 ID값 불러오기
	public Member ArrowSearchTo_DAO(Member member) throws SQLException{
		Member result2 = null;
		try {
			conn = ds.getConnection();
			String sql = "select u_id from member where u_name=? and u_addr=? and u_age=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getAddress());
			pstmt.setInt(3, member.getAge());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result2 = new Member();
				result2.setId(rs.getString("id"));
			}
			return result2;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();
		}
		return result2;
	}
}
