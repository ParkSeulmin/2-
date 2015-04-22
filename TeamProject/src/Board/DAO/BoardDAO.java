package Board.DAO;

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

public class BoardDAO {
	
	 
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	 
	DataSource ds;
	public BoardDAO() {
		try{
			Context init = new InitialContext();
	  	ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
	  	
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	//글의 개수 구하기.
	public int getListCount() {
		int x= 0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select count(*) from board");
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
	public List getBoardList(int page,int limit){
		
		String board_list_sql = " select *" 
							   +" from" 
							   +" 	(select rownum rn, BO_NO, BO_TITLE, BO_WRITER, BO_COUNT, BO_DATE, BO_ID"
							   +" 	from (select *" 
							   +" 		 from board"  
							   +"	          order by rownum desc)"
							   +"       )"
							   +" where rn between ? and ? ";
 
		
		List list = new ArrayList();
		
		int startrow=(page-1)*5+1; //읽기 시작할 row 번호.
		int endrow=startrow+limit-1; //읽을 마지막 row 번호.		
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Board board = new Board();
				 board.setBo_no(rs.getInt("BO_NO"));
				 board.setBo_title(rs.getString("BO_TITLE"));
				 board.setBo_writer(rs.getString("BO_WRITER"));
				 board.setBo_count(rs.getInt("BO_COUNT"));
				 board.setBo_date(rs.getDate("BO_DATE"));
				 board.setBo_id(rs.getInt("BO_ID"));
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
	
}
	