package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.ProductDAO;
import mvc.model.ProductDTO;

public class ProductController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    static final int LISTCOUNT = 6;   
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/CafeListAction.do"))//카페 상품 리스트 페이지 출력
		{	
			requestCafeList(request);
			RequestDispatcher rd = request.getRequestDispatcher("productList.jsp"); 
			rd.forward(request, response);
		}
		else if (command.equals("/ListRegisterAction.do")) // 새 상품 등록 페이지 출력하기
		{	
			requestProductRegister(request);
			RequestDispatcher rd = request.getRequestDispatcher("/CafeListAction.do"); 
			rd.forward(request, response);
		}
		else if (command.equals("/ProductViewAction.do")) //선택된 상품 상세 페이지 가져오기
		{	
			requestProductView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ProductView.do");
			rd.forward(request, response);
		}
		else if (command.equals("/ProductView.do")) //상품 상세 페이지 출력하기
		{ 
			RequestDispatcher rd = request.getRequestDispatcher("product.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/ProductUpdateForm.do")) //선택한 상품 수정 페이지 출력하기
		{
			requestProductUpdateView(request);
			RequestDispatcher rd = request.getRequestDispatcher("./admin_editProduct.jsp");
			rd.forward(request, response);
		}	
		else if (command.equals("/ProductUpdateAction.do")) //상품 수정 후 상품 상세보기 출력하기
		{ 
			requestProductUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ProductViewAction.do");
			rd.forward(request, response);
			
		}
		else if (command.equals("/ProductDeleteAction.do")) //선택된 글 삭제하기
		{ 
			requestProductDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/CafeListAction.do");
			rd.forward(request, response);				
		}
	}
	//등록된 카페 목록 가져오기
	public void requestCafeList(HttpServletRequest request)
	{
		String cate = request.getParameter("cate");
		String addr = request.getParameter("addr");
		
		if(request.getParameter("addr") == null)
			addr="";

		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> cafelist = new ArrayList<ProductDTO>();
		
	  	int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
//		지역명으로 게시글 검색하기
		String text = request.getParameter("text"); 
		
		int total_record = dao.getListCount(cate, text, addr); 
		cafelist = dao.getCafeList(pageNum, limit, text, cate, addr); 
		
//		페이지 처리
		int total_page;
		if (total_record % limit == 0)
		{     
	     	total_page = total_record / limit;
	     	Math.floor(total_page);  //	Math.floor(): 인자값 내림->소수 첫째짜리까지 double형으로 리턴
		}
		else
		{
		   total_page = total_record / limit;
		   Math.floor(total_page); 
		   total_page = total_page + 1; 
		}
		
//   			setAttribute(String name, Object value): 속성 이름이 name인 속성 값을 value로 저장
   		request.setAttribute("pageNum", pageNum);	
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record);
		request.setAttribute("cafeList", cafelist);  
	}
	
	//새로운 상품 등록하기
	public void requestProductRegister(HttpServletRequest request)
	{
		String filename = "";
	      
	    String web_path = "/resources/photos/";
	    ServletContext applications = request.getServletContext(); // 가져올 때
	    String realFolder = applications.getRealPath(web_path);
	      
	    String encType = "utf-8"; //인코딩 타입
	    
	    int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	      
	    
	    try 
	    {
	         MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());  

	         Enumeration files = multi.getFileNames();
	         
	         String f1 = "";
	         String f2 = "";
	         String f3 = "";
	         String f4 = "";
	         int i = 0;
	         
	         while(files.hasMoreElements()) {
	        	 if(i==0)
	        		 f4 = multi.getFilesystemName((String) files.nextElement());
	        	 if(i==1)
	        		 f3 = multi.getFilesystemName((String) files.nextElement());
	        	 if(i==2)
	        		 f2 = multi.getFilesystemName((String) files.nextElement());
	        	 if(i==3)
	        		 f1 = multi.getFilesystemName((String) files.nextElement());
	        	 i++;
	         }
	         
	        
	         ProductDAO dao = ProductDAO.getInstance();		
			
			ProductDTO list = new ProductDTO();
			
			list.setId(multi.getParameter("id"));
			list.setName(multi.getParameter("name"));
			list.setPic1(f1);
			list.setPic2(f2);
			list.setPic3(f3);
			list.setPic4(f4);
			list.setCate(multi.getParameter("cate"));
			list.setRegion(multi.getParameter("region"));
			list.setAddr(multi.getParameter("addr"));
			list.setPhone(multi.getParameter("phone"));
			list.setUnitPrice(multi.getParameter("unitPrice"));
			list.setDescrip(multi.getParameter("descrip"));
			
			System.out.println(multi.getParameter("id"));
			System.out.println(multi.getParameter("name"));
			System.out.println(multi.getParameter("region"));
			
			dao.insertList(list);
	      }
	      
	      catch (Exception ex) 
			{
				System.out.println("requestProductRegister() ���� : " + ex);
			} 
	}
	
	//선택한 상품 상세 페이지 가져오기
	public void requestProductView(HttpServletRequest request)
	{	
		ProductDAO dao = ProductDAO.getInstance();
		
		String id = request.getParameter("id");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
		ProductDTO list = new ProductDTO();
		list = dao.getCafeListById(id); 
		
		request.setAttribute("id", id);
		request.setAttribute("pageNum", pageNum);
   		request.setAttribute("list", list);
	}
	
	public void requestAddCart(HttpServletRequest request)  // 장바구니에 선택한 상품 넣기
	{
		ProductDAO dao = ProductDAO.getInstance();
		
		String id = request.getParameter("id");
		
		ProductDTO list = new ProductDTO();
		list = dao.getCafeListById(id);
		
		request.setAttribute("id", id);
		request.setAttribute("list", list);
	}
	
//선택한 상품 수정 페이지 가져오기
	public void requestProductUpdateView(HttpServletRequest request)
	{	
		ProductDAO dao = ProductDAO.getInstance();
		
		String id = request.getParameter("id");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		ProductDTO list = new ProductDTO();
		list = dao.getCafeListById(id); 
	
   		request.setAttribute("list", list);
   		request.setAttribute("pageNum", pageNum);
   		request.setAttribute("id", id);
	}
	
//	선택한 상품(id로 매칭) 상세정보 수정하기
	public void requestProductUpdate(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		ProductDAO dao = ProductDAO.getInstance();
		
		ProductDTO list = new ProductDTO();
		
		list.setId(id);
		list.setName(request.getParameter("name"));
		list.setPic1(request.getParameter("pic1"));
		list.setPic2(request.getParameter("pic2"));
		list.setPic3(request.getParameter("pic3"));
		list.setPic4(request.getParameter("pic4"));
		list.setCate(request.getParameter("cate"));
		list.setRegion(request.getParameter("region"));
		list.setAddr(request.getParameter("addr"));
		list.setPhone(request.getParameter("phone"));
		list.setUnitPrice(request.getParameter("unitPrice"));
		list.setDescrip(request.getParameter("descrip"));
		
		dao.updateProduct(list);
	}
	
	//선택한 상품(id로 매칭) 삭제하기
	public void requestProductDelete(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		
		ProductDAO dao = ProductDAO.getInstance();
		dao.deleteProduct(id);
	}
}