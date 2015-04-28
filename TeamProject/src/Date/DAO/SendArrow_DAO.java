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
	public Member Memberinfo_DAO(String id){
		Member member = null;
		//id값갖고 사람 정보 빼내오는 메섣
		//사용 x
		
		
		try {
			conn = ds.getConnection();
			
			String info_sql="select * from member where u_id=?";
			pstmt=conn.prepareStatement(info_sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();//화살 수 감소 쿼리 
			if(rs.next()){
				member= new Member();

				String u_id = rs.getString(1);
				String u_name = rs.getString(3);
				int u_gender=rs.getInt(7);
				String u_email=rs.getString(8);
				int u_age = rs.getInt(9);
				String u_addr = rs.getString(10);
				
				member.setAddress(u_addr);
				member.setAge(u_age);
				member.setId(u_id);
				member.setEmail(u_email);
				member.setGender(u_gender);
				member.setName(u_name);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
		

	//화살감소 
	public String ArrowSearch_DAO(String sender){
		//본인아이디를 세션값으로 받아야 한다.. 현재는 받는 사람의 id값만 매개변수로 이용중이다.
		String result = "";
		try {
			conn = ds.getConnection();
			String arrow_dec_sql="UPDATE arrowinfo SET arrows = arrows-1 WHERE u_id=? and arrows>0";
			pstmt=conn.prepareStatement(arrow_dec_sql);
			pstmt.setString(1, sender);
			int row=pstmt.executeUpdate();//화살 수 감소 쿼리 
			if(row<=0){
				result= "잔여 화살 수가 부족합니다.";
			}
			else{
				result= "화살 감소OK";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String ArrowRegister_DAO(String sender, String reciever){
		String result="";
		try {
			
			conn = ds.getConnection();
			
			//화살감소 요청
			result =ArrowSearch_DAO(sender);
			System.out.println(result);
			// return 
			String arrow_reg_sql="insert into arrow (a_id,a_recieveid,a_sendid) "
					+ "values(arrowseq.nextval(),?,?)";
			pstmt=conn.prepareStatement(arrow_reg_sql);
			pstmt.setString(1, reciever);
			pstmt.setString(2, sender);
			int row=pstmt.executeUpdate();
			if(row<=0){
				result= "화살 날리기에 실패했습니다!";
			}
			else{
				result= "화살이 날아갔습니다.";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
