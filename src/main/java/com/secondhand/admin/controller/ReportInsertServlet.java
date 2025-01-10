package com.secondhand.admin.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.admin.dto.Report;
import com.secondhand.admin.service.ReportService;

/**
 * Servlet implementation class ReportInsertServlet
 */
@WebServlet(name="ReportInsertServlet", urlPatterns="/reportinsert.do")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reportNo = request.getParameter("reportNo");
		String reportContent = request.getParameter("reportContent");
		String reportResult = request.getParameter("reportResult");
		Timestamp created_at = new Timestamp(System.currentTimeMillis()); 
	    Timestamp updated_at = new Timestamp(System.currentTimeMillis()); 
	    Timestamp deleted_at = new Timestamp(System.currentTimeMillis()); 
	    char isDeleted = 'N';
	    
	    String reportStatusNo = request.getParameter("reportStatusNo");
	    String reportReasonCode = request.getParameter("reportReasonCode");
		
	    String memberNo = request.getParameter("memberNo");
	    String reportTransNo = request.getParameter("reportTransNo");
	    String productNo = request.getParameter("productNo");
	    
	    
	    Report r = Report.builder()
	    		 	.reportNo(reportNo)
	                .reportContent(reportContent)
	                .reportResult(reportResult)
	                .createdAt(LocalDateTime.now())
	                .updatedAt(LocalDateTime.now())
	                .isDeleted(isDeleted)
	                .reportStatusNo("RHS-1")
	                .reportReasonCode(reportReasonCode)
	                .reportMemberNo(memberNo)
	                .reportTransNo(reportTransNo)
	                .reportProductNo(productNo)
	                .build();
	    
	    System.out.println(r);
	    ReportService service = new ReportService();
	    
	    String msg, loc ="/";
		
		try {
				int Result = service.insertReport(r);
				msg="신고 등록을 성공하였습니다.";
				loc="/";
			
		} catch(RuntimeException e) {
				e.printStackTrace();
				msg="신고 등록을 실패하였습니다. 다시 시도해주세요.";
				loc="/admin/report.do";
			
		}
		
		response.setContentType("text/html;charset=utf-8");
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);	
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
//		response.sendRedirect(request.getContextPath() + "/board/boardquestionandanswer.do" );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
