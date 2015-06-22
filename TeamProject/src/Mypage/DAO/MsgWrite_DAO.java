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
           System.out.println("DataSource 객체 생성 성공 !");
        } catch (NamingException e) {
           System.out.println("lookup Fail : " + e.getMessage());
        }
     }
	
	public void getMsgWrite(Message_DTO msgdto) throws Exception{
		String sql = "";
		try{
			System.out.println("content : "+msgdto.getM_CONTENT());
			System.out.println("title : "+msgdto.getM_TITLE());
			System.out.println("receiveid : "+msgdto.getM_RECIEVEID());
			System.out.println("sendid : "+msgdto.getM_SENDID());
			
			con = ds.getConnection();
			sql = "insert into MESSAGE(M_ID,M_TITLE,M_CONTENT,M_RECIEVEID,M_SENDID) "
					+ "values(MSG.nextval,?,?,?,?)";
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