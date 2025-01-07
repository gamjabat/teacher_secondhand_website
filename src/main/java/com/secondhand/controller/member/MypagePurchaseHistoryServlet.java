package com.secondhand.controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class MypagePurchaseHistory
 */
@WebServlet(name="mypagepurchasehistoryservlet",urlPatterns = "/member/purchasehistory.do")
public class MypagePurchaseHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagePurchaseHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage;
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			numPerPage = 10;
		}
		
		HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        
        Map<String, Object> param = new HashMap<>();
        param.put("cPage", cPage);
        param.put("numPerPage", numPerPage);
        param.put("memberNo",loginMember.getMemberNo());
        
        List<Map<String, Object>> purchaseHistory = new ArrayList<>();
        	
        purchaseHistory = new ProductService().getPurchaseHistory(param);
        	
        
        
        int totalData = new ProductService().getPurchaseHistoryCount(loginMember.getMemberNo());
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5; // 페이지바에 출력될 숫자의 개수
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize-1;
		
		//새로운 디자인.
		StringBuilder pageBar = new StringBuilder();
		//pageBar.append("<div class='pagination'>");

		// 이전 페이지 버튼
		if (cPage == 1) {
		    pageBar.append("<button class='prev' disabled>&lt;</button>");
		} else {
		    pageBar.append("<button class='prev' onclick='window.location.href=\"")
		    		.append(request.getRequestURI())
		    		.append("&cPage=")
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
			           .append("&cPage=")
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
		           .append("&cPage=")
		           .append(cPage + 1)
		           .append("&numPerPage=")
		           .append(numPerPage)
		           .append("\"'>&gt;</button>");
		}

        // Set products to the request attribute
        request.setAttribute("purchaseHistory", purchaseHistory);
        request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypagePurchaseHistory.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
