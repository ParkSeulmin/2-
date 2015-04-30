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

public class MsgDetail_DAO {
	
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
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
	
	public Message_DTO getMsgDetail(int m_id) throws Exception{
		System.out.println("getMsgDetail num: "+m_id);
		Message_DTO msgdto = null;
		String sql = "";
		try{
			con = ds.getConnection();
			sql = "select * from MESSAGE where M_ID=?";
			pstmt = con.prepareStatement(sql);
			System.out.println("getmsgDetail2");
			pstmt.setInt(1, m_id);
			
			rs= pstmt.executeQuery();
			
			
			if(rs.next()){
				
				msgdto = new Message_DTO();
				msgdto.setM_ID(rs.getInt(1));
				msgdto.setM_TITLE(rs.getString(2));
				msgdto.setM_CONTENT(rs.getString(3));
				msgdto.setM_DATE(rs.getDate(4));
				msgdto.setM_RECIEVEID(rs.getString(5));
				msgdto.setM_SENDID(rs.getString(6));
				
				System.out.println("getmsgdetail : "+rs.getString(3));
			}
			return msgdto;
		}catch(Exception ex){
			System.out.println("getmsgDetail 에러 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(con !=null)try{con.close();}catch(SQLException ex){}
		}
		return null;
	
	}
}