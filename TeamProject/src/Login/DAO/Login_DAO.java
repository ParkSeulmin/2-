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
         String aaa;//

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
         public String getLoginCheck(String id) throws SQLException{
            try {
               conn = ds.getConnection();
               System.out.println("conn : "+conn);
               System.out.println("id : "+id);
               String sql = 
               "select u_pwd from member where u_id=?"; 
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1,id);
               

               rs = pstmt.executeQuery();
               if(rs.next()){
            	   aaa = rs.getString(1);
            	   System.out.println(rs.getString(1));
               }
               System.out.println("aaa = "+aaa);
               return aaa;
            }finally{
               if(rs != null)rs.close();
               if(pstmt != null)pstmt.close();
               if(conn != null)conn.close();
            }
         }
      
}