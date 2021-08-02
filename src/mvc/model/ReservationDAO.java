package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class ReservationDAO 
{
	private static ReservationDAO instance;
	
	public ReservationDAO()	{
		
	}
	
	public static ReservationDAO getInstance()
	{
		if(instance == null)
			instance = new ReservationDAO();
		return instance;
	}
//	reservation 테이블의 레코드 개수
	public int getReservationListCount()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		String sql = "SELECT count(*) FROM reservation WHERE email = ?";
		
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);
		}
		catch (Exception ex) 
		{
			System.out.println("getReservationListCount() ����: " + ex);
		} 
		finally 
		{			
			try 
			{  
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();												
			} 
			catch (Exception ex) 
			{
				throw new RuntimeException(ex.getMessage());
			}		
		}		
		return x;
		
	}
	
//	reservation 테이블에서 email로 매칭된 레코드 가져오기
	public ArrayList<ReservationDTO> getReservationList(String email)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReservationDTO reserve = null;
		ArrayList<ReservationDTO> list = new ArrayList<ReservationDTO>();
		
		String sql = "SELECT * FROM reservation WHERE email = ?";
		
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				reserve = new ReservationDTO();
				
				reserve.setNum(rs.getInt("num"));
				reserve.setEmail(rs.getString("email"));
				reserve.setRe_pname(rs.getString("p_name"));
				reserve.setRe_unitPrice(rs.getString("unitPrice"));
				reserve.setRe_usingPeople(rs.getString("usingPeople"));
				reserve.setRe_usingDate(rs.getString("usingDate"));
				reserve.setRe_usingTime(rs.getString("usingTime"));
				reserve.setRe_usingHours(rs.getString("usingHours"));
				list.add(reserve); // 여러 줄이 있으니까 묶어서 들고 와야 함!
			}
			return list;
		}
		catch (Exception ex) 
		{
			System.out.println("getReservationList() ���� : " + ex);
		} 
		
		finally 
		{
			try 
			{	
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} 
			catch (Exception ex) 
			{
				throw new RuntimeException(ex.getMessage());
			}			
		}
		return null;
	}
	
//	reservation 테이블에 새로운 상품 등록하기(INSERT)
	public void insertReservationList(ReservationDTO reserve)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try 
		{
			conn = DBConnection.getConnection();
			String sql = "INSERT INTO reservation(email, p_name, unitPrice, usingPeople, usingDate, usingTime, usingHours)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reserve.getEmail());
			pstmt.setString(2, reserve.getRe_pname());
			pstmt.setString(3, reserve.getRe_unitPrice());
			pstmt.setString(4, reserve.getRe_usingPeople());
			pstmt.setString(5, reserve.getRe_usingDate());
			pstmt.setString(6, reserve.getRe_usingTime());
			pstmt.setString(7, reserve.getRe_usingHours());
			
			pstmt.executeUpdate();
		}
		catch (Exception ex)
		{
			System.out.println("insertReservationList() ����: " + ex);
		}
		finally
		{
			try 
			{									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} 
			catch (Exception ex) 
			{
				throw new RuntimeException(ex.getMessage());
			}	
		}
	}
	
//	해당 예약 리스트 수정하기
	public void updateReservation(ReservationDTO reserve)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			String sql = "UPDATE reservation SET usingPeople = ?, usingDate = ?, usingTime = ?, usingHours = ? WHERE num = ?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			 
			pstmt.setString(1, reserve.getRe_usingPeople());
			pstmt.setString(2, reserve.getRe_usingDate());
			pstmt.setString(3, reserve.getRe_usingTime());
			pstmt.setString(4, reserve.getRe_usingHours());
			pstmt.setInt(5, reserve.getNum());
			
			pstmt.executeUpdate();
			conn.commit();
			
		}
		catch (Exception ex)
		{
			System.out.println("updateReservation() ����" + ex);
		}
		finally
		{
			try
			{
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}
			catch (Exception ex)
			{
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
//	예약 리스트 전체 삭제하기
	public void deleteReservation(String email)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = DBConnection.getConnection();
			String sql = "DELETE FROM reservation WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
		}
		catch (Exception ex)
		{
			System.out.println("deleteReservation() ����" + ex);
		}
		finally
		{
			try
			{
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}
			catch (Exception ex)
			{
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
//	해당 예약 리스트 삭제하기
	public void deleteThisReservation(int num) 
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM reservation WHERE num = ?";
		
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}
		catch (Exception ex)
		{
			System.out.println("deleteThisReservation() ����: " + ex);
		}
		finally
		{
			try
			{
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
			catch (Exception ex)
			{
			throw new RuntimeException(ex.getMessage());
			}
		}
	}
}
