package Login.DAO;

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
			
			//회원가입
			public int writeok(Member memberdto) throws SQLException{
				try {
					conn = ds.getConnection();
					String sql = 
					"INSERT INTO MEMBER(U_ID,U_PWD,U_NAME,U_JUMIN,U_PHONE,U_NNAME,U_GENDER,U_EMAIL,U_AGE,U_ADDR)"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?)"; 
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

					int row = pstmt.executeUpdate();//db확인
					
					return row;
				}finally{
					if(pstmt != null)pstmt.close();
					if(conn != null)pstmt.close();
				}
			}
		
}
