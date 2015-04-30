
package Login.DAO;

import java.sql.Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Login.DTO.Member;
import Login.DTO.Personal_Info;



//BoardDao d = new BoardDao();
//int result = d.getListCount();
public class Join {

	//DB연결
	//CRUD 작업
	// method 공통 사용 ....
	// 초기자 { } static 초기자 : static{ }
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
				System.out.println("DataSource 객체 생성 성공 !");
			} catch (NamingException e) {
				System.out.println("lookup Fail : " + e.getMessage());
			}
		}
		
			
			//회원가입 기본정보 입력
			public int writeok(Member memberdto) throws SQLException{
				try {
					conn = ds.getConnection();
					String sql = 
					"INSERT INTO MEMBER(U_ID,U_PWD,U_NAME,U_JUMIN,U_PHONE,U_NNAME,U_GENDER,U_EMAIL,U_AGE,U_ADDR, U_MYPICTURE)"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)"; 
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberdto.getId());
					pstmt.setString(2, memberdto.getPw());
					pstmt.setString(3, memberdto.getName());
					pstmt.setString(4,memberdto.getJumin());
					pstmt.setString(5,memberdto.getPhone());
					pstmt.setString(6,memberdto.getNick());
					pstmt.setInt(7,memberdto.getGender());
					pstmt.setString(8,memberdto.getEmail());
					pstmt.setInt(9,memberdto.getAge());
					pstmt.setString(10,memberdto.getAddress());
					pstmt.setString(11, memberdto.getU_mypicture());
					
					

					int row = pstmt.executeUpdate();//db확인
					
					return row;
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
			}
			
			//회원가입 추가정보 함수
			public int writeplus(Personal_Info memberdto) throws SQLException{
				try {
					conn = ds.getConnection();
					String sql = 
					"INSERT INTO PERSONALINFO VALUES(?,?,?,?,?,?,?)"; 
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberdto.getU_ID());
					pstmt.setInt(2, memberdto.getSal());
					pstmt.setInt(3, memberdto.getHeight());
					pstmt.setInt(4,memberdto.getWeight());
					pstmt.setString(5,memberdto.getJob());
					pstmt.setString(6,memberdto.getFschool());
					pstmt.setString(7,memberdto.getContent());
					
					int row = pstmt.executeUpdate();//db확인
					
					return row;
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
			}
			
			//닉네임 체크 쿼리
			public int nickcheck(String nick) throws SQLException{
				
				int check = 0 ;//id값 존재하는지 return 
				System.out.println("DAO 받아온 id " + nick);
				
				try {
					conn = ds.getConnection();
					String sql = 
					"SELECT U_NNAME FROM MEMBER WHERE U_NNAME=?"; 
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, nick);
					
					rs = pstmt.executeQuery();
		               if(rs.next()){
		            	   //아이디 중복입니다
		            	  check=1;
		            	  System.out.println("nickcheck : 중복");
		               }else{
		            	   //아이디 사용가능합니다
			            	System.out.println("nickcheck : 사용가능");
		            	   check=0;
		               }
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
	               return check;
			}
			
			public int idcheck(String id) throws SQLException{
				
				int check = 0 ;//id값 존재하는지 return 
				System.out.println("받아온 id " + id);
				
				try {
					conn = ds.getConnection();
					String sql = 
					"SELECT U_ID FROM MEMBER WHERE U_ID=?"; 
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					
					rs = pstmt.executeQuery();
		               if(rs.next()){
		            	   //아이디 중복입니다
		            	  check=1;
		            	  System.out.println("idcheck : 중복");
		               }else{
		            	   //아이디 사용가능합니다
			            	System.out.println("idcheck : 사용가능");
		            	   check=0;
		               }
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
	               return check;
			}
			
			// 회원 삭제
			public boolean memberdelete(String userid){
				System.out.println("memberdelete userid: "+userid);
				String del_reply_sql = 
						"delete from reply where RE_WRITER=?";
				String board_delete_sql=
					"delete from board where BO_WRITER=?";
				String del_ssomelist_sql = 
						"delete from ssomelist where U_ID=? or U_SSOME=?";
				String del_message_sql =
						"delete from message where M_RECIEVEID=? or M_SENDID=?";
				String del_arrowinfo_sql =
						"delete from arrowinfo where U_ID=?";
				String del_attend_sql =
						"delete from attend where U_ID=?";
				String del_personalinfo_sql =
						"delete from personalinfo where U_ID=?";
				String del_arrow_sql =
						"delete from arrow where A_RECIEVEID=? or A_SENDID=?";
				 
				String del_member_sql =
						"delete from member where U_ID=?";
				 
				
				int result=0;
				
				try{
					conn = ds.getConnection();
					conn.setAutoCommit(false);
					System.out.println("memberdelete userid~???: "+userid);
					//1 댓글삭제
					pstmt = conn.prepareStatement(del_reply_sql);
					pstmt.setString(1, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("댓글삭제실패");
					}
					
					//2 게시물삭제
					pstmt=conn.prepareStatement(board_delete_sql);
					pstmt.setString(1, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("게시물삭제실패");
					}
					
					//3 썸리스트 삭제
					pstmt = conn.prepareStatement(del_ssomelist_sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("썸리스트삭제실패");
					}
					
					//4 메시지 삭제
					pstmt = conn.prepareStatement(del_message_sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("메시지삭제실패");
					}
					
					//5 화살 정보 삭제
					pstmt = conn.prepareStatement(del_arrowinfo_sql);
					pstmt.setString(1, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("화살삭제실패");
					}
					
					//6 참석 삭제
					pstmt = conn.prepareStatement(del_attend_sql);
					pstmt.setString(1, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("참석삭제실패");
					}
					
					//7 회원 상세정보 삭제
					pstmt = conn.prepareStatement(del_personalinfo_sql);
					pstmt.setString(1, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("회원 상세정보삭제실패");
					}
					
					//8 화살 삭제
					pstmt = conn.prepareStatement(del_arrow_sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, userid);
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("화살삭제실패");
					}
					
					//9 회원 삭제
					pstmt = conn.prepareStatement(del_member_sql);
					pstmt.setString(1, userid);			
					result=pstmt.executeUpdate();
					
					if (result < 1) {
						System.out.println("회원삭제실패");
					}
					
					if (result > 0) {
						conn.commit(); // 정상처리
					} else {
						conn.rollback();
					}
					
					if(result==0)return false;
					
					return true;
				}catch(Exception ex){
					System.out.println("memberDelete 에러 : "+ex);
				}finally{
					try{
						if(pstmt!=null)pstmt.close();
						if(conn!=null)conn.close();
					}catch(Exception ex) {}
				}
				
				return false;
			}
		
}
