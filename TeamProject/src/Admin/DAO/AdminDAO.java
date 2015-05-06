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
import Meeting.DTO.Party_DTO;

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
	
	//글의 개수 구하기.
			public int getListCountadmin(int boardtype) {
				
				int x= 0;
				
				try{
					con=ds.getConnection();
					pstmt=con.prepareStatement("select count(*) from board where bo_id=?");
					pstmt.setInt(1, boardtype);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						x=rs.getInt(1);
					}
				}catch(Exception ex){
					System.out.println("getListCount 에러: " + ex);			
				}finally{
					if(rs!=null) try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					if(con!=null) try{con.close();}catch(SQLException ex){}
				}
				return x;
			}
			
			//글 목록 보기.	
			public List getBoardListadmin(int page,int limit, int boardtype){
				System.out.println("boardtype: "+boardtype);
				String board_list_sql = " select *" 
									   +" from" 
									   +" 	(select rownum rn, BO_NO, BO_TITLE, BO_WRITER, BO_COUNT, BO_DATE, BO_ID, bo_content"
									   +" 	from (select *" 
									   +" 		 	from board"
									   +"		 	  where bo_id = ?"			
									   +"	          order by bo_no desc)"
									   +"       )"
									   +" where rn between ? and ? ";
		 
				
				List list = new ArrayList();
				
				int startrow=(page-1)*9+1; //읽기 시작할 row 번호.
				int endrow=startrow+limit-1; //읽을 마지막 row 번호.		
				try{
					con=ds.getConnection();
					pstmt = con.prepareStatement(board_list_sql);
					pstmt.setInt(1, boardtype);
					pstmt.setInt(2, startrow);
					pstmt.setInt(3, endrow);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						Board board = new Board();
						 board.setBo_no(rs.getInt("BO_NO"));
						 board.setBo_title(rs.getString("BO_TITLE"));
						 board.setBo_writer(rs.getString("BO_WRITER"));
						 board.setBo_count(rs.getInt("BO_COUNT"));
						 board.setBo_date(rs.getDate("BO_DATE"));
						 board.setBo_id(rs.getInt("BO_ID"));
						 board.setBo_content(rs.getString("bo_content"));
						list.add(board);
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
			
			
			//글의 개수 구하기.
					public String AdminPwdCheck(String adminid) {
						
						String realadminpwd = "";
						
						try{
							con=ds.getConnection();
							pstmt=con.prepareStatement("select U_PWD from member where U_ID=?");
							pstmt.setString(1, adminid);
							rs = pstmt.executeQuery();
							
							if(rs.next()){
								realadminpwd = rs.getString("u_pwd");
							}
						}catch(Exception ex){
							System.out.println("getListCount 에러: " + ex);			
						}finally{
							if(rs!=null) try{rs.close();}catch(SQLException ex){}
							if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
							if(con!=null) try{con.close();}catch(SQLException ex){}
						}
						return realadminpwd;
					}
					
					
					// 친구목록불러오기
					public List<Member> getSsomeList(String r_id,int cpage) throws SQLException {
						List<Member> friends = new ArrayList<Member>();;
						try {
							con = ds.getConnection();
							int cpage2= cpage;
							int pagesize=2; 
							int start = cpage2 * pagesize - (pagesize - 1);
							int end = cpage2 * pagesize;
							System.out.println("start : "+start);
							System.out.println("end : "+end);
							System.out.println("r_id : "+r_id);
							System.out.println("cpage2 : "+cpage2);
							String sql ="    select r,u_id,u_name,U_MYPICTURE,U_GENDER from "
									+ "(select rownum r,m.u_id, m.u_name, m.U_MYPICTURE, m.U_GENDER from "
									+ "(select u_id, u_ssome from ssomelist order by U_ID) s "
									+ "join member m on s.u_id=m.u_id  where s.u_ssome=?) "
									+ "where r between ? and ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, r_id);
							pstmt.setInt(2, start);
							pstmt.setInt(3, end);
							rs=pstmt.executeQuery();
							while(rs.next()){
								Member member= new Member();
								member.setId(rs.getString(2));
								member.setName(rs.getString(3));
								member.setU_mypicture(rs.getString("U_MYPICTURE"));
								member.setGender(rs.getInt("U_GENDER"));
								friends.add(member);
								System.out.println("요청된 친구 ID : "+rs.getString(2));
								System.out.println("요청된 친구 이름 :"+rs.getString(3));
							}

						} catch (SQLException e) {
							e.printStackTrace();
						} 
						finally {
							pstmt.close();
							con.close();
						}
						return friends ;
					}
					
		// 파티 등록
					 
					public boolean PartyAdd(Party_DTO party){
						int num =0;
						String sql="";
						
						int result=0;
						
						try{
							con = ds.getConnection();
							pstmt=con.prepareStatement(
									"select max(p_id) from party");
							rs = pstmt.executeQuery();
							
							if(rs.next())
								num =rs.getInt(1)+1;
							else
								num=1;
							
							sql="insert into party(p_id, p_title, p_area, p_maxpeople, p_img) ";
							sql+= " values(?, ?, ?, ?, ?)";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, num);
							pstmt.setString(2, party.getP_TITLE());
							pstmt.setString(3, party.getP_AREA());
							pstmt.setInt(4, party.getP_MAXPEOPLE());
							pstmt.setString(5, party.getP_IMG());
							
							
							
							result=pstmt.executeUpdate();
							System.out.println("DAO party add RESULT: "+result);
							if(result==0)return false;
							
							return true;
						}catch(Exception ex){
							System.out.println("partyadd 에러 : "+ex);
						}finally{
							if(rs!=null) try{rs.close();}catch(SQLException ex){}
							if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
							if(con!=null) try{con.close();}catch(SQLException ex){}
						}
						return false;
					}			
					
}
	
