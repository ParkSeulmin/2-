package Date.DAO;

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

import org.apache.catalina.connector.Request;

import Date.DTO.Search_Column_DTO;
import Date.DTO.Search_DTO;
import Login.DTO.Member;




public class Search_DAO {
    
      //DB연결
      //CRUD 작업
      // method 공통 사용 ....
      // 초기자 { } static 초기자 : static{ }
         static DataSource ds;
         Connection conn;
         PreparedStatement pstmt;
         ResultSet rs;
         Search_DTO search_dto;
         ArrayList<Search_DTO> seararr = new ArrayList<Search_DTO>();
         

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
         
      
         public ArrayList<Search_DTO> getSearch(Search_Column_DTO searcoldto) throws SQLException{
             try {
            	 
            	 
                conn = ds.getConnection();
                String sql = "select * from (select * from MEMBER where U_ADDR like ?) where "
                		+ "U_ID in (select U_ID from (select * from MEMBER where U_AGE between ? and ?)"
                		+" where U_ID in (select U_ID from PERSONALINFO where HEIGHT between ? and ? and "
                		+"SAL >= ? and JOB like ?))";
              
                
                		System.out.println(searcoldto.getValArea());
                		System.out.println(searcoldto.getValAge1());
                		System.out.println(searcoldto.getValAge2());
                		System.out.println(searcoldto.getValHeight1());
                		System.out.println(searcoldto.getValHeight2());
                		System.out.println(searcoldto.getValSal());
                		System.out.println(searcoldto.getValJob());
                		
                		System.out.println(sql);
                 	    pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1,"%"+searcoldto.getValArea()+"%");
                        pstmt.setInt(2,searcoldto.getValAge1());
                        pstmt.setInt(3,searcoldto.getValAge2());
                        pstmt.setInt(4,searcoldto.getValHeight1());
                        pstmt.setInt(5,searcoldto.getValHeight2());
                        pstmt.setInt(6,searcoldto.getValSal());
                        pstmt.setString(7,"%"+searcoldto.getValJob()+"%");
                        
                        rs = pstmt.executeQuery();
                        
                  
                while(rs.next()){
                	search_dto = new Search_DTO();
             	   search_dto.setId(rs.getString(1));
             	   search_dto.setPw(rs.getString(2));
             	   search_dto.setName(rs.getString(3));
             	   search_dto.setJumin(rs.getString(4));
             	   search_dto.setPhone(rs.getString(5));
             	   search_dto.setNick(rs.getString(6));
             	   search_dto.setGender(rs.getInt(7));
             	   search_dto.setEmail(rs.getString(8));
             	   search_dto.setAge(rs.getInt(9));
             	   search_dto.setAddress(rs.getString(10));
             	  search_dto.setAdmin(rs.getInt(11));
             	  
             	   System.out.println("search _ set id : "+rs.getString(1));
             	   seararr.add(search_dto);
                }
                
                for(int i=0; i<seararr.size(); i++){
             	   System.out.println("DAO : "+seararr.get(i).getPhone());
                }
                
                return seararr;
                
             }finally{
                if(rs != null)rs.close();
                if(pstmt != null)pstmt.close();
                if(conn != null)conn.close();
             }
          }
        
      
}