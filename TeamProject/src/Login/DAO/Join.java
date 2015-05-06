
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
		
}
