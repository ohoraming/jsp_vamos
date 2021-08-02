package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.MemberDAO;
import mvc.model.MemberDTO;

public class MemberController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private static final int LISTCOUNT = 10;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/admin_MemberManageView.me")) // [관리자용] 등록된 회원 목록 페이지 출력하기
		{
			requestMemberList(request);
			RequestDispatcher rd = request.getRequestDispatcher("admin_manageMember.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/MemberRegisterAction.me")) // [회원용] 새로운 회원 정보 등록하기(회원가입)
		{	
			requestMemberRegister(request);
			RequestDispatcher rd = request.getRequestDispatcher("signUpSuccess.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/LoginAction.me")) //[공통] email과 password 매칭확인 후 홈 화면 다시 띄우기
		{
			requestLogin(request);
			RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/logout.me")) // [공통] 로그아웃
		{
			HttpSession session = request.getSession();
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/admin_MemberViewAction.me")) // [관리자용] 선택한 회원의 회원 상세 정보 가져오기
		{	
			requestMemberView(request);
			RequestDispatcher rd = request.getRequestDispatcher("admin_detailMember.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/admin_MemberUpdateAction.me")) // [관리자용] 선택한 회원 정보 수정하기
		{
			requestMemberUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/admin_MemberManageView.me");
			rd.forward(request, response);
		}
		else if(command.equals("/MemberUpdateAction.me")) //[회원용] 회원 정보 수정
		{
			requestThisMemberUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/signUpEditSuccess.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/MemberViewAction.me")) //[회원용] 회원 정보 가져오기
		{
			requestMemberView(request);
			RequestDispatcher rd = request.getRequestDispatcher("signUpEdit.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/admin_MemberDeleteAction.me")) // [관리자용] 선택한 회원 삭제하기
		{
			requestMemberDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("admin_withdrawSuccess.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/MemberDeleteAction.me")) // [관리자용] 선택한 회원 삭제하기
		{
			requestMemberDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("withdrawSuccess.jsp");
			rd.forward(request, response);
		}
	}
//	 등록된 회원 목록 가져오기
	public void requestMemberList(HttpServletRequest request) 
	{
		MemberDAO dao = MemberDAO.getInstance();
		ArrayList<MemberDTO> memberlist = new ArrayList<MemberDTO>();

		int pageNum = 1;
		int limit = LISTCOUNT;	
		
		if(request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
//		 name과 email로 회원 검색하기		
		String items = request.getParameter("items"); 
		String text = request.getParameter("text");
		
		int total_record = dao.getMemberListCount(items, text); 
		memberlist = dao.getMemberList(pageNum, limit, items, text);
		
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
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("memberlist", memberlist);
	}
	
//	입력한 회원 정보를 email, password1과 매칭 후 해당 회원 name 가져오기
	public void requestLogin(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password1 = request.getParameter("password1");

		MemberDAO dao = MemberDAO.getInstance();
		
		String name = dao.getLoginByEmailPassword(email, password1);
		
		session.setAttribute("name", name);
		session.setAttribute("email", email);
	}
	
//	선택한 회원 상세 정보 가져오기
	public void requestMemberView(HttpServletRequest request)
	{
		MemberDAO dao = MemberDAO.getInstance();
		
		String email = request.getParameter("email");
			
		MemberDTO member = new MemberDTO();
		member = dao.getListByEmail(email);
			
		request.setAttribute("email", email);
		request.setAttribute("member", member);
	}
	
//	새로운 회원정보 등록하기
	public void requestMemberRegister(HttpServletRequest request)
	{
		MemberDAO dao = MemberDAO.getInstance();
			
		MemberDTO member= new MemberDTO();
		
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setPassword1(request.getParameter("password1"));
		member.setPassword2(request.getParameter("password2"));
		member.setBirthmm(request.getParameter("birthmm"));
		member.setBirthdd(request.getParameter("birthdd"));
		member.setPhonenumber(request.getParameter("phonenumber"));
		
		dao.insertMemberList(member);
	}
	
		
//	선택한 회원 정보 수정하기
	public void requestMemberUpdate(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		
		MemberDAO dao = MemberDAO.getInstance();
			
		MemberDTO member = new MemberDTO();
		member.setEmail(email);
		member.setName(request.getParameter("name"));
		member.setBirthmm(request.getParameter("birthmm"));
		member.setBirthdd(request.getParameter("birthdd"));
		member.setPhonenumber(request.getParameter("phonenumber"));
			
		dao.updateMember(member);			
	}
//	해당 회원 정보 수정하기
	public void requestThisMemberUpdate(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		
		MemberDAO dao = MemberDAO.getInstance();
			
		MemberDTO member = new MemberDTO();
		member.setEmail(email);
		member.setName(request.getParameter("name"));
		member.setPassword1(request.getParameter("password1"));
		member.setPassword2(request.getParameter("password2"));
		member.setBirthmm(request.getParameter("birthmm"));
		member.setBirthdd(request.getParameter("birthdd"));
		member.setPhonenumber(request.getParameter("phonenumber"));
			
		dao.updateThisMember(member);			
	}
	
//	선택한 회원 정보 삭제하기
	public void requestMemberDelete(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.deleteMember(email);
	}
}
