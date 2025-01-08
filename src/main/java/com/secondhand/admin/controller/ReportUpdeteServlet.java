package com.secondhand.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.admin.dto.Report;
import com.secondhand.admin.service.ReportService;

/**
 * Servlet implementation class AdminUpdeteServlet
 */
@WebServlet("/reportupdate.do")
public class ReportUpdeteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportUpdeteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        String reportNo = request.getParameter("reportNo");
        String reportStatusNo = request.getParameter("reason");
        String reportResult = request.getParameter("reportResult");

     
        Report report = new Report();
        report.setReportNo(reportNo);
        report.setReportStatusNo(reportStatusNo);
        report.setReportResult(reportResult);

       
        ReportService service = new ReportService();
   
 
        
        String msg, loc ="/";
		
		try {     int result = service.updateReport(report);
					msg="업데이트 성공하였습니다.";
					loc="/";
			
		} catch(RuntimeException e) {
				e.printStackTrace();
				msg="덥데이트 실패하였습니다. 다시 시도해주세요.";
				loc="/board/boardquestionandanswerwrite.do";
			
		}
		
			
		response.setContentType("text/html;charset=utf-8");
			
			
		request.setAttribute("msg", msg);
			
		request.setAttribute("loc", loc);	

			
		//request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
		response.sendRedirect(request.getContextPath() + "/admin/adminmain.do" );
       
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
