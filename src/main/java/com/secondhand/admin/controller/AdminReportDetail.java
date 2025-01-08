package com.secondhand.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.admin.dto.Report;
import com.secondhand.admin.service.ReportService;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.member.MemberService;

/**
 * Servlet implementation class AdminReportDetail
 */
@WebServlet("/adminreportdetail.do")
public class AdminReportDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터에서 reportNo를 가져옵니다.
	    String reportNo = request.getParameter("reportNo");

	    // 서비스 객체 생성
	    ReportService reportService = new ReportService();
	    MemberService memberService = new MemberService();

	    // 단일 Report 데이터 가져오기
	    Report report = reportService.selectByBoardNo(reportNo);

	    // Report가 null인지 확인
	    if (report == null) {
	    
	        request.setAttribute("errorMessage", "해당 신고 데이터를 찾을 수 없습니다.");
	        request.getRequestDispatcher("/WEB-INF/views/admin/error.jsp").forward(request, response);
	        return;
	    }

	    // Member 데이터 가져오기 및 Report에 설정
	    Member member = memberService.getMemberByreportNo(reportNo);
	    report.setMember(member);

	    // 요청 속성 설정
	    request.setAttribute("report", report);
	    request.setAttribute("member", member);

	    // JSP로 포워드
	    request.getRequestDispatcher("/WEB-INF/views/admin/adminReportDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
