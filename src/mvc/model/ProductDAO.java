package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class ProductDAO 
{
	
	private static ProductDAO instance;

	public ProductDAO() 
	{
	
	}
	
	public static ProductDAO getInstance() 
	{
		if (instance == null)
			instance = new ProductDAO();
		return instance;
	}
	
//	cafelist 테이블의 레코드 개수
	public int getListCount(String cate, String text, String addr)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(text==null)
			text="";
		if(addr==null)
			addr="";
		
		int x = 0;
		
		String sql = null;
		
		if(cate != null)
			sql = "SELECT count(*) FROM cafeList WHERE cate='"+ cate +"' AND addr like '%" + text + "%'"; 

		else if(addr != null)
			sql = "SELECT count(*) FROM cafeList WHERE addr LIKE '%" + addr + "%' "; 
			
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
			System.out.println("getListCount() ����: " + ex);
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
	
//	cafeList 테이블의 전체 레코드 가져오기
	public ArrayList<ProductDTO> getCafeList(int page, int limit, String text ,String cate, String addr)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(text==null)
			text="";
		if(addr==null)
			addr="";
		
//		cafeList 페이지 처리
		int total_record = getListCount(cate, text, addr);  
		int start = (page - 1) * limit;
		int index = start + 1;
		
		String sql = null;
		
		
		if(cate != null)
			sql = "SELECT * FROM cafeList WHERE cate='"+ cate +"' AND addr like '%" + text + "%'";

		else if(addr != null)
			sql = "SELECT * FROM cafeList WHERE addr LIKE '%" + addr + "%' "; 
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>(); 
		
		try
		{	
			conn = DBConnection.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			
			while (rs.absolute(index)) 
			{
				ProductDTO cafeList = new ProductDTO(); 
				
				cafeList.setId(rs.getString("id"));
				cafeList.setName(rs.getString("name"));
				cafeList.setPic1(rs.getString("pic1"));
				cafeList.setPic2(rs.getString("pic2"));
				cafeList.setPic3(rs.getString("pic3"));
				cafeList.setPic4(rs.getString("pic4"));
				cafeList.setCate(rs.getString("cate"));
				cafeList.setRegion(rs.getString("region"));
				cafeList.setAddr(rs.getString("addr"));
				cafeList.setPhone(rs.getString("phone"));
				cafeList.setUnitPrice(rs.getString("unitPrice"));
				cafeList.setDescrip(rs.getString("descrip"));
				
				list.add(cafeList);
				
				if(index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			
			return list;	
		}
		
		
		catch (Exception ex) 
		{
			System.out.println("getCafeList() ���� : " + ex);
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
	
//	cafeList 테이블에 새로운 상품 등록하기(INSERT)
	public void insertList(ProductDTO list)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			String sql = "SELECT * FROM cafeList WHERE id=?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, list.getId());
			rs = pstmt.executeQuery();
							
			if(!rs.next())
			{											
				sql = "INSERT INTO cafeList VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
				pstmt = conn.prepareStatement(sql);
	
				pstmt.setString(1, list.getId());
				pstmt.setString(2, list.getName());
				pstmt.setString(3, list.getPic1()!=""?list.getPic1():"");
				pstmt.setString(4, list.getPic2()!=""?list.getPic2():"");
				pstmt.setString(5, list.getPic3()!=""?list.getPic3():"");
				pstmt.setString(6, list.getPic4()!=""?list.getPic4():"");
				pstmt.setString(7, list.getCate());
				pstmt.setString(8, list.getRegion());
				pstmt.setString(9, list.getAddr());
				pstmt.setString(10, list.getPhone());
				pstmt.setString(11, list.getUnitPrice());
				pstmt.setString(12, list.getDescrip());
				
				pstmt.executeUpdate();
			}
		}
		catch (Exception ex) 
		{
			System.out.println("insertList() ���� : " + ex);
		} 
		finally 
		{
			try 
			{		
				if(rs != null)
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
	}
	
//	선택된 항목의 상세 내용 가져오기(SELECT)
	public ProductDTO getCafeListById(String id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO list = null;

		String sql = "SELECT * FROM cafeList WHERE id = ? ";

		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				list = new ProductDTO();
				
				list.setId(rs.getString("id"));
				list.setName(rs.getString("name"));
				list.setPic1(rs.getString("pic1"));
				list.setPic2(rs.getString("pic2"));
				list.setPic3(rs.getString("pic3"));
				list.setPic4(rs.getString("pic4"));
				list.setCate(rs.getString("cate"));
				list.setRegion(rs.getString("region"));
				list.setAddr(rs.getString("addr"));
				list.setPhone(rs.getString("phone"));
				list.setUnitPrice(rs.getString("unitPrice"));
				list.setDescrip(rs.getString("descrip"));
				
			}
				
			return list;
		} 
		
		catch (Exception ex) 
		{
			System.out.println("getCafeListById() ���� : " + ex);
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
	
//	선택한 cafe 상품 상세내용 수정하기(id로)
	public void updateProduct(ProductDTO list)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			String sql = "SELECT * FROM cafeList WHERE id=?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, list.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "UPDATE cafeList set name=?, pic1=?, pic2=?, pic3=?, pic4=?, cate=?, region=?, addr=?, phone=?, unitPrice=?, descrip=? where id=?";
				
				pstmt = conn.prepareStatement(sql);
				
				conn.setAutoCommit(false);
				
				pstmt.setString(1, list.getName());
				pstmt.setString(2, list.getPic1()!=""?list.getPic1():rs.getString("pic1"));
				pstmt.setString(3, list.getPic2()!=""?list.getPic2():rs.getString("pic2"));
				pstmt.setString(4, list.getPic3()!=""?list.getPic3():rs.getString("pic3"));
				pstmt.setString(5, list.getPic4()!=""?list.getPic4():rs.getString("pic4"));
				pstmt.setString(6, list.getCate());
				pstmt.setString(7, list.getRegion());
				pstmt.setString(8, list.getAddr());
				pstmt.setString(9, list.getPhone());
				pstmt.setString(10, list.getUnitPrice());
				pstmt.setString(11, list.getDescrip());
				pstmt.setString(12, list.getId());
				
				pstmt.executeUpdate();
			}
			conn.commit();
		}
		
		catch (Exception ex) 
		{
			System.out.println("updateProduct() ���� : " + ex);
		} 
		finally 
		{
			try 
			{			
				if(rs != null)
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
	}
	// 선택한 상품 삭제하기(id로 매칭해서)
	public void deleteProduct(String id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM cafeList WHERE id=?";
		
		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			//setString(int parameterIndex, String x) 
			//	: 지정한 index위치에 x값 할당
			pstmt.executeUpdate();

		} 
		
		catch (Exception ex) 
		{
			System.out.println("deleteProduct() ���� : " + ex);
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