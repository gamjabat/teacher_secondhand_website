package com.secondhand.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.admin.dto.Report;
import com.secondhand.admin.service.ReportService;
import com.secondhand.model.service.board.QnaBoardService;

/**
 * Servlet implementation class AdminMainServlet
 */
@WebServlet( name="adminmainservlet", urlPatterns ="/admin/adminmain.do")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage;
		try {
			numPerPage =Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=5;
		}
		Map<String, Integer> param = Map.of("cPage", cPage, "numPerPage", numPerPage);
		
	
		
		int totalData = new QnaBoardService().selectQnaCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5; // 페이지바에 출력될 숫자의 개수
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize-1;
		
	
		//새로운 디자인.
		StringBuilder pageBar = new StringBuilder();
		pageBar.append("<div class='pagination'>");

		// 이전 페이지 버튼
		if (cPage == 1) {
		    pageBar.append("<button class='prev' disabled>&lt;</button>");
		} else {
		    pageBar.append("<button class='prev' onclick='window.location.href=\"")
		           .append(request.getRequestURI())
		           .append("?cPage=")
		           .append(cPage - 1)
		           .append("&numPerPage=")
		           .append(numPerPage)
		           .append("\"'>&lt;</button>");
		}

		// 페이지 번호 출력
		while (pageNo <= totalPage && pageNo <= pageEnd) {
			if (pageNo == cPage) {
			    pageBar.append("<span class='page active'></span>");
			} else {
			    pageBar.append("<span class='page' onclick='window.location.href=\"")
			           .append(request.getRequestURI())
			           .append("?cPage=")
			           .append(pageNo)
			           .append("&numPerPage=")
			           .append(numPerPage)
			           .append("\"'></span>");
			}
		    pageNo++;
		}

		// 다음 페이지 버튼
		if (cPage == totalPage) {
		    pageBar.append("<button class='next' disabled>&gt;</button>");
		} else {
		    pageBar.append("<button class='next' onclick='window.location.href=\"")
		           .append(request.getRequestURI())
		           .append("?cPage=")
		           .append(cPage + 1)
		           .append("&numPerPage=")
		           .append(numPerPage)
		           .append("\"'>&gt;</button>");
		}

		pageBar.append("</div>");
		
		request.setAttribute("pageBar", pageBar);
	
		
		ReportService service = new ReportService();
	    List<Report> reportList = service.selectAllreports(param); 
	
	    
	    request.setAttribute("reportList", reportList); 
		
		request.getRequestDispatcher("/WEB-INF/views/admin/adminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
