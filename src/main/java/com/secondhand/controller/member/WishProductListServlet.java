package com.secondhand.controller.member;

import java.io.IOException;
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

        // 2. WishListService에서 memberNo를 사용하여 상품 정보 가져오기
        WishListService service = new WishListService();
        List<Map<String, Object>> likedProducts = service.getLikedProducts(memberNo);
        
        
        System.out.println("Liked Products: " + likedProducts); 
        // 3. JSON 응답으로 반환
        response.setContentType("application/json; charset=utf-8");
        Gson gson = new Gson();
        gson.toJson(likedProducts, response.getWriter()); // likedProducts를 JSON 형식으로 응답
    }

    
    
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
