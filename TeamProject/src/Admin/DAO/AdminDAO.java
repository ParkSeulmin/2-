package Admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Board.DTO.Board;
import Board.DTO.Reply;
import Login.DTO.Member;

public class AdminDAO {
	
	 
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	 
	DataSource ds;
	public AdminDAO() {
		try{
			Context init = new InitialContext();
	  	ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
	  	
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	// 회원 명수
	public int getMemberListCount() {
		
		int x= 0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select count(*) from member where u_isadmin!=1");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getMemberListCount 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	//회원 리스트 뽑기
	public List getMemberList(int page,int limit){
		 
		String member_list_sql = "select * from member "
								 + "where u_isadmin!=1 order by U_JOINDATE desc";

		List list = new ArrayList();
		
		int startrow=(page-1)*10+1; //읽기 시작할 row 번호.
		int endrow=startrow+limit-1; //읽을 마지막 row 번호.		
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(member_list_sql);
			 
			//pstmt.setInt(2, startrow);
			//pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Member member = new Member();
				// 사진 추가 
				member.setId(rs.getString("u_id"));
				member.setName(rs.getString("u_name"));
				member.setPhone(rs.getString("u_phone"));
				member.setNick(rs.getString("u_nname"));
				member.setEmail(rs.getString("u_email"));
				member.setGender(rs.getInt("u_gender"));
				member.setAge(rs.getInt("u_age"));
				member.setAddress(rs.getString("u_addr"));
				member.setU_joindate(rs.getDate("u_joindate"));
				member.setU_mypicture(rs.getString("U_MYPICTURE"));
				list.add(member);
			}
			
			return list;
		}catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	 
}
	
