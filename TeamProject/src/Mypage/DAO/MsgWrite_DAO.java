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


public class MsgWrite_DAO {
	
	int row;
	ResultSet rs;
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
	
	public void getMsgWrite(Message_DTO msgdto) throws Exception{
		String sql = "";
		try{
			con = ds.getConnection();
			sql = "insert into  MESSAGE(M_ID,M_TITLE,M_CONTENT,M_RECIEVEID,M_SENDID) "
					+ "values(msg.nextval,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,msgdto.getM_TITLE());
			pstmt.setString(2,msgdto.getM_CONTENT());
			pstmt.setString(3,msgdto.getM_RECIEVEID());
			pstmt.setString(4,msgdto.getM_SENDID());
			
			row = pstmt.executeUpdate();
			System.out.println("글쓰기 반영된 로우수 : "+row);
			
			return;
		}catch(Exception ex){
			System.out.println("getmsgWrite 에러 : " + ex);
		}finally{
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(con !=null)try{con.close();}catch(SQLException ex){}
		}
		return ;
	
	}
}