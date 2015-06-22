package Login.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
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




public class Login_DAO {
    
      //DB연결
      //CRUD 작업
      // method 공통 사용 ....
      // 초기자 { } static 초기자 : static{ }
         static DataSource ds;
         Connection conn;
         PreparedStatement pstmt;
         ResultSet rs;
         Member member;
         
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
         public Member getLoginCheck(String id) throws SQLException{
            try {
               conn = ds.getConnection();
               String sql = 
               "select * from MEMBER where U_ID=?"; 
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1,id);
               System.out.println("login dao : "+id);

               rs = pstmt.executeQuery();
               if(rs.next()){
            	   member = new Member();
            	   
            	   member.setId(rs.getString(1));
            	   member.setPw(rs.getString(2));
            	   member.setName(rs.getString(3));
            	   member.setJumin(rs.getString(4));
            	   member.setPhone(rs.getString(5));
            	   member.setNick(rs.getString(6));
            	   member.setGender(rs.getInt(7));
            	   member.setEmail(rs.getString(8));
            	   member.setAge(rs.getInt(9));
            	   member.setAddress(rs.getString(10));
            	   member.setAdmin(rs.getInt(11));
            	   
               }else{
            	   member = new Member();
            	   
               }
              
               return member;
            }finally{
               if(rs != null)rs.close();
               if(pstmt != null)pstmt.close();
               if(conn != null)conn.close();
            }
         }

      
}