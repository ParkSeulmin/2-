package Date.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Login.DTO.Member;
import Mypage.DTO.Arrow_DTO;

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
			rs=pstmt.executeQuery();
			if(rs.next()){
				member= new Member();
				member.setId(rs.getString(1));
				member.setName(rs.getString(3));
				member.setGender(rs.getInt(7));
				member.setEmail(rs.getString(8));
				member.setAge(rs.getInt(9));
				member.setAddress(rs.getString(10));
				System.out.println("rs돌지");
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
			
			if(result.equals("화살 감소OK")){
				String arrow_reg_sql="insert into arrow (a_id,a_recieveid,a_sendid) "
						+ "values(arrowseq.nextval,?,?)";
				System.out.println("1");
				pstmt=conn.prepareStatement(arrow_reg_sql);
				pstmt.setString(1, reciever);
				pstmt.setString(2, sender);
				int row=pstmt.executeUpdate();
				System.out.println("2");

				if(row>0){
					result= "success!";
				}
				else{
					result= "you failed.";
				}
			
			}
			else{
				result= "you failed.";
			}
			System.out.println("여기	"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Arrow_DTO> Recieved_Arrow(String me) throws SQLException {
		//arrow DTO 생성 작업 해야 함.
		ArrayList<Arrow_DTO> arlist=new ArrayList<Arrow_DTO>();
		Arrow_DTO myar=null; 
		try {
			conn = ds.getConnection();
			
				String arrow_reg_sql="select * from arrow where a_recieveid=? ";
				System.out.println("Dao 단 접근");
				pstmt=conn.prepareStatement(arrow_reg_sql);
				pstmt.setString(1, me);
				rs=pstmt.executeQuery();
				System.out.println(me);
				System.out.println("여기까지만?");
				while(rs.next()){
					System.out.println("rs 접근");
					myar=new Arrow_DTO();
					
					myar.setA_id(rs.getInt(1));
					myar.setA_date(rs.getDate(2));
					myar.setA_status(rs.getString(3));
					myar.setA_sendid(rs.getString(5));
					
					System.out.println(rs.getInt(1));
					System.out.println("여기찍어주세용");
					arlist.add(myar);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(pstmt.isClosed()){pstmt.close();}
			if(rs.isClosed()){rs.close();}
			if(conn.isClosed()){conn.close();}
			System.out.println("여기");
		}
		return arlist;
	}

	public String register_friend(String s_id, String r_id) throws SQLException {
		String result="";
		int rs1=0;
		int rs2=0;
		try {
			conn = ds.getConnection();
			
			String regsql1 = "insert into ssomelist values(?,?)"; 
			System.out.println("Dao 단 접근");
			pstmt = conn.prepareStatement(regsql1);
			pstmt.setString(1, s_id);
			pstmt.setString(2, r_id);
			rs1 = pstmt.executeUpdate();
			
			String regsql2 = "insert into ssomelist values(?,?)"; 
			System.out.println("Dao 단 접근");
			pstmt = conn.prepareStatement(regsql2);
			pstmt.setString(2, s_id);
			pstmt.setString(1, r_id);
			rs2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt.isClosed()) {pstmt.close();}
			if (rs.isClosed()) {rs.close();}
			if (conn.isClosed()){conn.close();}
		}
		
		if(rs1+rs2==2){
			result="성공했습니다.";
		}else{
			result="친구등록에 실패했습니다.";
		}

		return result;
	}
}

