package com.secondhand.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.secondhand.model.service.member.CartListService;
import com.secondhand.model.service.member.WishListService;

/**
 * Servlet implementation class CartProductListServlet
 */
@WebServlet(name="cartproductlistservlet" ,urlPatterns = "/member/cartproductlist.do")
public class CartProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String memberNo = request.getParameter("memberNo");
		 String productNo = request.getParameter("productNo");
		 
		 
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
			
			int totalData = new CartListService().selectCartListCount(memberNo);
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
				 pageBar.append("<button class='prev' onclick=\"loadCartListProductList('")
		           .append(memberNo)
		           .append("',")
		           .append(cPage - 1)
		           .append(",")
		           .append(numPerPage)
		           .append(")\">&lt;</button>");
			}

			// 페이지 번호 출력
			while (pageNo <= totalPage && pageNo <= pageEnd) {
				if (pageNo == cPage) {
				    pageBar.append("<span class='page active'></span>");
				} else {
				    pageBar.append("<span class='page' onclick=\"loadCartListProductList('"+memberNo+"',"+pageNo+","+numPerPage+")\">");
				    pageBar.append("</span>");
				}
			    pageNo++;
			}

			// 다음 페이지 버튼
			if (cPage == totalPage) {
			    pageBar.append("<button class='next' disabled>&gt;</button>");
			} else {
				 pageBar.append("<button class='next' onclick=\"loadCartListProductList('")
		           .append(memberNo)
		           .append("',")
		           .append(cPage + 1)
		           .append(",")
		           .append(numPerPage)
		           .append(")\">&gt;</button>");
		
			}

			pageBar.append("</div>");
		 
		 
		 
		 
		CartListService service = new CartListService();
		List<Map<String, Object>> cartProducts = service.getCartedProducts(memberNo, param);
        
		
		Map<String, Object> cartresponseData = new HashMap<>();
		cartresponseData.put("cartProducts", cartProducts);
		cartresponseData.put("pageBar", pageBar.toString());
        
        System.out.println("cart Products: " + cartProducts); 
        System.out.println("pageBar: " + pageBar);
		
		
        // 3. JSON 응답으로 반환
        response.setContentType("application/json; charset=utf-8");
        Gson gson = new Gson();
        gson.toJson(cartresponseData, response.getWriter()); // likedProducts를 JSON 형식으로 응답
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
