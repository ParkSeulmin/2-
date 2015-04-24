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
	public int getListCount(int boardtype) {
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
	public List getBoardList(int page,int limit, int boardtype){
		System.out.println("boardtype: "+boardtype);
		String board_list_sql = " select *" 
							   +" from" 
							   +" 	(select rownum rn, BO_NO, BO_TITLE, BO_WRITER, BO_COUNT, BO_DATE, BO_ID"
							   +" 	from (select *" 
							   +" 		 	from board"
							   +"		 	  where bo_id = ?"			
							   +"	          order by bo_no desc)"
							   +"       )"
							   +" where rn between ? and ? ";
 
		
		List list = new ArrayList();
		
		int startrow=(page-1)*10+1; //읽기 시작할 row 번호.
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
	
	//글 등록.
		public boolean boardInsert(Board board){
			int num =0;
			String sql="";
			
			int result=0;
			
			try{
				con = ds.getConnection();
				pstmt=con.prepareStatement(
						"select max(bo_no) from board");
				rs = pstmt.executeQuery();
				
				if(rs.next())
					num =rs.getInt(1)+1;
				else
					num=1;
				
				sql="INSERT INTO BOARD(BO_NO, BO_WRITER, BO_TITLE, BO_CONTENT, BO_FILE, BO_ID)";
				sql+= " VALUES(?, ?, ?, ?, ?, ?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, board.getBo_writer());
				pstmt.setString(3, board.getBo_title());
				pstmt.setString(4, board.getBo_content());
				pstmt.setString(5, board.getBo_file());
				pstmt.setInt(6, board.getBo_id());
				
				
				result=pstmt.executeUpdate();
				System.out.println("DAO INSERT RESULT: "+result);
				if(result==0)return false;
				
				return true;
			}catch(Exception ex){
				System.out.println("boardInsert 에러 : "+ex);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return false;
		}
		
		//글 내용 보기.
		public Board getDetail(int num) throws Exception{
			Board board = null;
			try{
				con = ds.getConnection();
				pstmt = con.prepareStatement(
						"select * from board where bo_no = ?");
				pstmt.setInt(1, num);
				
				rs= pstmt.executeQuery();
				
				
				if(rs.next()){
					
					board = new Board();
					board.setBo_id(rs.getInt("bo_no"));
					board.setBo_writer(rs.getString("bo_writer"));
					board.setBo_title(rs.getString("bo_title"));
					board.setBo_content(rs.getString("bo_content"));
					board.setBo_count(rs.getInt("bo_count"));
					board.setBo_date(rs.getDate("bo_date"));
					board.setBo_file(rs.getString("bo_file"));
					board.setBo_id(rs.getInt("bo_id"));
					
				}
				return board;
			}catch(Exception ex){
				System.out.println("getDetail 에러 : " + ex);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
				if(con !=null)try{con.close();}catch(SQLException ex){}
			}
			return null;
		}
		
		//조회수 업데이트.
		public void setReadCountUpdate(int num) throws Exception{
			String sql="update board set bo_count = "+
				"bo_count+1 where bo_no = "+num;
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				int i = pstmt.executeUpdate();
				
			}catch(SQLException ex){
				System.out.println("setReadCountUpdate 에러 : "+ex);
			}
			finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				}catch(Exception ex) {}
			}
		}
}
	