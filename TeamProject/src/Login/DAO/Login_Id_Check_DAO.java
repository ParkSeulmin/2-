package Login.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

import org.apache.catalina.connector.Request;

import Login.DTO.Member;
//여기서  아이디 찾기/ 본인인증/ 비밀번호 찾기 기능 구현할 예정

public class Login_Id_Check_DAO {

	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	static{
		InitialContext ctx;
		try {
			ctx=new InitialContext();
			Context envCtx=(Context)ctx.lookup("java:comp/env");
			ds=(DataSource)envCtx.lookup("/jdbc/oracle");
		} catch (NamingException e) {
		}
		
	}
	public Member Mypage_Id_Test(Member member) throws SQLException{

		Member result_member=null;
		try {
			System.out.println("DB접근");
			conn=ds.getConnection();
			String sql ="select u_id,u_email,u_name from member where u_email=? and u_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail()); //action에서 넘겨 받은(입력받은) Email값
			pstmt.setString(2, member.getName());
			rs=pstmt.executeQuery();
			System.out.println("sql문 날림");
			System.out.println("여긴"+sql);
			System.out.println("email"+member.getEmail());
			System.out.println("name"+member.getName());
			if(rs.next()){
				result_member= new Member();//결과로 나온 애들, 만약 둘의 조건을 동시에 만족하는 데이터가 없다면 null값이 저장된 객체가 생성된다.
				result_member.setId(rs.getString("u_id"));
				result_member.setEmail(rs.getString("u_email"));
				result_member.setName(rs.getString("u_name"));
				System.out.println("DB`접근 성공");
				System.out.println("찾고자 하는 값 " +rs.getString("u_id"));
			}
			System.out.println("틀릴 때DB접근 성공");
			return result_member; 
		} 
		finally{
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();

		}
		
	}
	public Member Mypage_Id_Test(Member member) throws SQLException{

		Member result_member=null;
		try {
			System.out.println("DB접근");
			conn=ds.getConnection();
			String sql ="select u_id,u_email,u_name from member where u_email=? and u_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail()); //action에서 넘겨 받은(입력받은) Email값
			pstmt.setString(2, member.getName());
			rs=pstmt.executeQuery();
			System.out.println("sql문 날림");
			System.out.println("여긴"+sql);
			System.out.println("email"+member.getEmail());
			System.out.println("name"+member.getName());
			if(rs.next()){
				result_member= new Member();//결과로 나온 애들, 만약 둘의 조건을 동시에 만족하는 데이터가 없다면 null값이 저장된 객체가 생성된다.
				result_member.setId(rs.getString("u_id"));
				result_member.setEmail(rs.getString("u_email"));
				result_member.setName(rs.getString("u_name"));
				System.out.println("DB`접근 성공");
				System.out.println("찾고자 하는 값 " +rs.getString("u_id"));
			}
			System.out.println("틀릴 때DB접근 성공");
			return result_member; 
		} 
		finally{
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();

		}
		
	}
	
}