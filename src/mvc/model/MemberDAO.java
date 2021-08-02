package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class MemberDAO 
{
	private static MemberDAO instance;

	public MemberDAO() 
	{
	
	}
	
	public static MemberDAO getInstance()
	{
		if(instance == null)
			instance = new MemberDAO();
		return instance;
	}
//	member테이블의 레코드 개수
	public int getMemberListCount(String items, String text)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		String sql;
		
		if(items == null && text == null )
			sql = "SELECT count(*) FROM member";
		else
			sql = "SELECT count(*) FROM member WHERE " + items + " like '%" + text + "%'";
		//where 컬럼명 like '%A%'  : A를 포함하는 문자 찾기
		try
		{
			conn = DBConnection.getConnection(); 
			pstmt = conn.prepareStatement(sql);  
			rs = pstmt.executeQuery(); 

			if (rs.next())
				x = rs.getInt(1);
		}
		catch (Exception ex) 
		{
			System.out.println("getMemberListCount() ����: " + ex);
		} 
		finally 
		{			
			try 
			{  //rs, pstmt, conn연결 해제 (연결 역순)
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
	
// member 테이블의 전체 레코드 가져오기
	public ArrayList<MemberDTO> getMemberList(int page, int limit, String items, String text)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getMemberListCount(items, text);  
		int start = (page - 1) * limit;
		int index = start + 1;
		
		String sql;
		
		if(items == null && text == null)
			sql = "SELECT * FROM member"; 
		else
			sql = "SELECT * FROM member WHERE " + items + " like '%" + text + "%'";

		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index))
			{
				MemberDTO member = new MemberDTO();
				
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPassword1(rs.getString("password1"));
				member.setPassword2(rs.getString("password2"));
				member.setBirthmm(rs.getString("birthmm"));
				member.setBirthdd(rs.getString("birthdd"));
				member.setPhonenumber(rs.getString("phonenumber"));
				
				list.add(member);
				
				if(index < (start + limit) && index <= total_record)
					index++;
				else
					break;
				
			}
			return list;
		}
		catch (Exception ex) 
		{
			System.out.println("getMemberList() ���� : " + ex);
		} 
		
		finally 
		{
			try 
			{	// DB연결 해제
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
	

//	member 테이블에서 email과 password1 매치하는 회원 찾아서 name 리턴
	public String getLoginByEmailPassword(String email, String password1)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String name = null;
		
		String sql = "SELECT * FROM member WHERE email=? and password1=?";
		
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password1);
			rs = pstmt.executeQuery();
			
			if (rs.next())
				name = rs.getString("name");
			
			return name;
		}
		catch (Exception ex) 
		{
			System.out.println("getLoginByEmailPassword() ���� : " + ex);
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
	  
	//member 테이블에 새로운 회원 등록하기(INSERT)
	public void insertMemberList(MemberDTO member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?)";
					
			pstmt = conn.prepareStatement(sql);
				
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPassword1());
			pstmt.setString(4, member.getPassword2());
			pstmt.setString(5, member.getBirthmm());
			pstmt.setString(6, member.getBirthdd());
			pstmt.setString(7, member.getPhonenumber());
			
			pstmt.executeUpdate();	
		}
		catch (Exception ex)
		{
			System.out.println("insertMemberList() ����: " + ex);
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
			
	//선택한 회원의 회원상세정보 가져오기(SELECT)
	public MemberDTO getListByEmail(String email)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		
		String sql = "SELECT * FROM member WHERE email = ? ";
					
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
							
			if(rs.next())
			{
				member = new MemberDTO();
					
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setBirthmm(rs.getString("birthmm"));
				member.setBirthdd(rs.getString("birthdd"));
				member.setPhonenumber(rs.getString("phonenumber"));
				
				member.setPassword1(rs.getString("password1"));
				member.setPassword2(rs.getString("password2"));
				
			}
		
			return member;
		}
		catch (Exception ex) 
		{					
			System.out.println("getListByEmail() ���� : " + ex);
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
	
	// [관리자] 회원 상세 정보 수정하기
	public void updateMember(MemberDTO member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			String sql = "UPDATE member SET name=?, birthmm=?, birthdd=?, phonenumber=? WHERE email=?";
				
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
				
			conn.setAutoCommit(false);
				
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getBirthmm());
			pstmt.setString(3, member.getBirthdd());
			pstmt.setString(4, member.getPhonenumber());
			pstmt.setString(5, member.getEmail());
			
			pstmt.executeUpdate();
			conn.commit();
		}
		catch (Exception ex) 
		{
			System.out.println("updateMember() ���� : " + ex);
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
//	[회원용] 회원 상세 정보 수정하기
	public void updateThisMember(MemberDTO member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			String sql = "UPDATE member SET name=?, password1=?, password2=?, birthmm=?, birthdd=?, phonenumber=? WHERE email=?";
				
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
				
			conn.setAutoCommit(false);
				
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword1());
			pstmt.setString(3, member.getPassword2());
			pstmt.setString(4, member.getBirthmm());
			pstmt.setString(5, member.getBirthdd());
			pstmt.setString(6, member.getPhonenumber());
			pstmt.setString(7, member.getEmail());
			
			pstmt.executeUpdate();
			conn.commit();
		}
		catch (Exception ex) 
		{
			System.out.println("updateMember() ���� : " + ex);
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
	//회원 삭제하기(회원탈퇴) (email로 매칭해서)
	public void deleteMember(String email)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM member WHERE email = ?";
		
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
		}
		catch (Exception ex) 
		{
			System.out.println("deleteMember() ���� : " + ex);
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
