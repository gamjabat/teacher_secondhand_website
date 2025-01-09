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
import com.secondhand.model.service.member.WishListService;

/**
 * Servlet implementation class WishProductListServlet
 */
@WebServlet("/member/wishproductlist.do")
public class WishProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. request에서 memberNo를 String으로 가져옴
        String memberNo = request.getParameter("memberNo");
        System.out.println("memberNo: " + memberNo); // 콘솔에 memberNo 출력
        
        
       
        
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
		
		int totalData = new WishListService().selectWishListCount(memberNo);
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
		    pageBar.append("<button class='prev' onclick=\"loadLikedProductList('"+memberNo+"',"+pageNo+","+numPerPage+")\">")
		    	   
		           .append(cPage - 1)
		           .append(")\"'>&lt;</button>");
		}

		// 페이지 번호 출력
		while (pageNo <= totalPage && pageNo <= pageEnd) {
			if (pageNo == cPage) {
			    pageBar.append("<span class='page active'></span>");
			} else {
			    pageBar.append("<span class='page' onclick=\"loadLikedProductList('"+memberNo+"',"+pageNo+","+numPerPage+")\">");
			    pageBar.append("</span>");
			}
		    pageNo++;
		}

		// 다음 페이지 버튼
		if (cPage == totalPage) {
		    pageBar.append("<button class='next' disabled>&gt;</button>");
		} else {
		    pageBar.append("<button class='next' onclick=\"loadLikedProductList('"+memberNo+"',"+pageNo+","+numPerPage+")\">")
		    
		           .append(cPage + 1)
		           .append(numPerPage)
		           .append(")\"'>&gt;</button>");
		}

		pageBar.append("</div>");
		
	
	
		// 2. WishListService에서 memberNo를 사용하여 상품 정보 가져오기
        WishListService service = new WishListService();
        List<Map<String, Object>> likedProducts = service.getLikedProducts(memberNo, param);
        System.out.println("Liked Products: " + likedProducts); 
        
        // gson에 넣기 데이터
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("likedProducts", likedProducts);
        responseData.put("pageBar", pageBar.toString());
        
        System.out.println("Liked Products: " + likedProducts); 
        System.out.println("pageBar: " + pageBar);
        // 3. JSON 응답으로 반환
        response.setContentType("application/json; charset=utf-8");
        Gson gson = new Gson();
        gson.toJson(responseData, response.getWriter()); // likedProducts를 JSON 형식으로 응답
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
