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
	public String ArrowSearch_DAO(String sender) throws SQLException{
		//본인아이디를 세션값으로 받아야 한다.. 현재는 받는 사람의 id값만 매개변수로 이용중이다.
		String result = "";
			String arrow_dec_sql="UPDATE arrowinfo SET arrows = arrows-1 WHERE u_id=? and arrows>0";
			pstmt=conn.prepareStatement(arrow_dec_sql);
			pstmt.setString(1, sender);
			int row=pstmt.executeUpdate();//화살 수 감소 쿼리 
			System.out.println(sender);
			if(row<1){
				result= "잔여 화살 수가 부족합니다.";
			}
			else{
				result= "화살 감소OK";
			}
			pstmt.close();
			conn.close();
			
			return result ; 
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
					myar=new Arrow_DTO();
					
					myar.setA_id(rs.getInt(1));
					myar.setA_date(rs.getDate(2));
					myar.setA_status(rs.getString(3));
					myar.setA_sendid(rs.getString(5));
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
		String result="";//친추기능
		int rs1=0;
		int rs2=0;
		try {
			conn = ds.getConnection();
			
			String regsql1 = "insert into ssomelist values(?,?)"; 
			System.out.println("Dao 단 접근");
			pstmt = conn.prepareStatement(regsql1);
			pstmt.setString(1, s_id);
			pstmt.setString(2, r_id);
			
			System.out.println(s_id+"여기는 샌더");
			System.out.println(r_id+"여기는 리시버");
			
			System.out.println("두번째쿼리가 안되는거");
			rs1 = pstmt.executeUpdate();
			System.out.println("여기서 안되는건가?");
			String regsql2 = "insert into ssomelist values(?,?)"; 
			System.out.println("Dao 단 접근");
			pstmt = conn.prepareStatement(regsql2);
			pstmt.setString(1, r_id);
			pstmt.setString(2, s_id);
			System.out.println("Dao 단 접근2");
			rs2 = pstmt.executeUpdate();
			System.out.println("Dao 단 접근3");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			if(rs1+rs2==2){
				result="친구 등록되었습니다.";
			}else{
				result="친구등록에 실패했습니다.";
			}
			System.out.println("쿼리까지는 다 돼!");
			pstmt.close();
			conn.close();
		}

		return result;
	}

	public String deleteArrow(String s_id, String r_id) throws SQLException {
		int result=0;//arrow 삭제 
		String rst="";
		try {
			conn = ds.getConnection();
			
			String delsql = "delete from arrow where a_recieveid=?"
					+ " and a_sendid=?";
			pstmt = conn.prepareStatement(delsql);
			pstmt.setString(1, r_id);
			pstmt.setString(2, s_id);
			result=pstmt.executeUpdate();
			
			if(result>0){
				rst="제대로 삭제됨.";
			}
			else{
				rst="안됑";
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			pstmt.close();
			conn.close();
		}

		return rst;
	}

	public String ChangeArrow(String s_id, String r_id) throws SQLException {
		int result=0;//arrow 삭제 
		String rst="";
		try {
			conn = ds.getConnection();
			
			String chsql = "update arrow set a_status='수락' where a_recieveid=? and a_sendid=?";

			pstmt = conn.prepareStatement(chsql);
			pstmt.setString(1, r_id);
			pstmt.setString(2, s_id);
			result=pstmt.executeUpdate();
			
			if(result>0){
				rst="수락되었습니다.";
			}
			else{
				rst="수락안됑";
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			pstmt.close();
			conn.close();
		}

		return rst;
		
	}

	public List<Member> getFriendList(String r_id) throws SQLException {
		List<Member> friends = new ArrayList<Member>();
		try {
			conn = ds.getConnection();
			
			String sql = "select m.u_id, m.u_name from ssomelist s "
					+ "join member m on s.u_id=m.u_id  where s.u_ssome=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Member member= new Member();
				member.setId(rs.getString(1));
				member.setName(rs.getString(2));
				friends.add(member);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			pstmt.close();
			conn.close();
		}
		return friends ;
	}
	public List<Arrow_DTO> CheckSend(String me) throws SQLException {
		//arrow DTO 생성 작업 해야 함.
		List<Arrow_DTO> arlist=new ArrayList<Arrow_DTO>();
		Arrow_DTO ar=null; 
		try {
			conn = ds.getConnection();
			
				String arrow_reg_sql="select * from arrow where a_sendid=? ";
				System.out.println("Dao 단 접근");
				pstmt=conn.prepareStatement(arrow_reg_sql);
				pstmt.setString(1, me);
				rs=pstmt.executeQuery();
				System.out.println(me);
				System.out.println("여기까지만?");
				while(rs.next()){
					ar=new Arrow_DTO();
					
					ar.setA_id(rs.getInt(1));
					ar.setA_date(rs.getDate(2));
					ar.setA_status(rs.getString(3));
					ar.setA_sendid(rs.getString(4));
					arlist.add(ar);
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
}

