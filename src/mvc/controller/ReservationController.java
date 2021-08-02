package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.ReservationDAO;
import mvc.model.ReservationDTO;

public class ReservationController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

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
		
		if(command.equals("/PreReservationMakeAction.re")) // pre 예약 리스트 출력하기
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("reservation_pre.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/ReservationMakeAction.re")) // 새로운 예약 리스트 등록하기(c)
		{
			if(request.getParameter("edit") == null)
			{
				requestMakeReservation(request);
			}
			else
			{
				requestReservationUpdate(request);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/ReservationList.re");
			rd.forward(request, response);
		}
		else if(command.equals("/ReservationList.re")) // 나의 예약 리스트 출력하기(r)
		{
			requestReservationList(request);
			RequestDispatcher rd = request.getRequestDispatcher("reservation.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/ReservationUpdateAction.re")) // 해당 예약 리스트 내용 수정하기(u)
		{
			requestReservationUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReservationList.re");
			rd.forward(request, response);
		}
		else if(command.equals("/CheckedReservationDeleteAction.re")) // 선택한 예약 리스트 삭제하기(d)
		{
			requestCheckedDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReservationList.re");
			rd.forward(request, response);
		}
		else if(command.equals("/ThisReservationDeleteAction.re")) // 해당 예약 리스트 삭제하기(d)
		{
			requestThisDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReservationList.re");
			rd.forward(request, response);
		}
		else if(command.equals("/ReservationDeleteAction.re")) // 예약 리스트 내용 전체 삭제하기(d)
		{
			requestReservationDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReservationList.re");
			rd.forward(request, response);
		}
	}

//	새로운 예약 리스트 등록하기(C-INSERT)
	public void requestMakeReservation(HttpServletRequest request)
	{
		ReservationDAO dao = ReservationDAO.getInstance();
		HttpSession session = request.getSession();
		
		ReservationDTO reserve = new ReservationDTO();
		
		reserve.setEmail((String)(session.getAttribute("email")));
		reserve.setRe_pname(request.getParameter("p_name"));
		reserve.setRe_unitPrice(request.getParameter("p_unitPrice"));
		reserve.setRe_usingPeople(request.getParameter("usingPeople"));
		reserve.setRe_usingDate(request.getParameter("usingDate"));
		reserve.setRe_usingTime(request.getParameter("usingTime"));
		reserve.setRe_usingHours(request.getParameter("usingHours"));
		
		dao.insertReservationList(reserve);
	}
	
//	특정 userEmail로 등록된 예약 리스트 가져오기(R-SELECT)
	public void requestReservationList(HttpServletRequest request)
	{
		ReservationDAO dao = ReservationDAO.getInstance();
		HttpSession session = request.getSession();
		
		String email = (String)(session.getAttribute("email"));
		
		ArrayList<ReservationDTO> reservationList = dao.getReservationList(email);
		
		request.setAttribute("reservationList", reservationList);
	}
	
//	선택한 예약 리스트 정보 수정하기(U-UPDATE)
	public void requestReservationUpdate(HttpServletRequest request)
	{
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReservationDAO dao = ReservationDAO.getInstance();
		
		ReservationDTO reserve = new ReservationDTO();
		
		reserve.setNum(num);
		reserve.setRe_usingPeople(request.getParameter("usingPeople"));
		reserve.setRe_usingDate(request.getParameter("usingDate"));
		reserve.setRe_usingTime(request.getParameter("usingTime"));
		reserve.setRe_usingHours(request.getParameter("usingHours"));
		
		dao.updateReservation(reserve);
	}
	
	
// 예약 리스트 전체 삭제하기(D-DELETE)
	public void requestReservationDelete(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String email = (String)(session.getAttribute("email"));
		
		ReservationDAO dao = ReservationDAO.getInstance();
		
		dao.deleteReservation(email);
	}
	
//	선택한 예약 리스트 삭제하기
	public void requestCheckedDelete(HttpServletRequest request)
	{
		String[] checked = request.getParameterValues("num");
		for(String str : checked)
		{
			System.out.println("������ num: "+str);
		}
		int[] nums = Arrays.stream(checked).mapToInt(Integer::parseInt).toArray();
        System.out.println(Arrays.toString(nums));
        
        for(int i = 0; i < nums.length; i++)
        {
        	System.out.println(nums[i]);
        	int num = nums[i];
        	ReservationDAO dao = ReservationDAO.getInstance();
        	dao.deleteThisReservation(num);
        }
	}
	
//	해당 예약 리스트 삭제하기
	public void requestThisDelete(HttpServletRequest request)
	{
		int num = Integer.parseInt(request.getParameter("num"));
		ReservationDAO dao = ReservationDAO.getInstance();
		dao.deleteThisReservation(num);
	}
}
