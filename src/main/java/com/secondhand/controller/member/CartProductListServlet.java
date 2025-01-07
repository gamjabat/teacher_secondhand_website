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
import com.secondhand.model.service.member.CartListService;

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
		 
		CartListService service = new CartListService();
		List<Map<String, Object>> cartProducts = service.getCartedProducts(memberNo);
        
        System.out.println("Liked Products: " + cartProducts); 
        // 3. JSON 응답으로 반환
        response.setContentType("application/json; charset=utf-8");
        Gson gson = new Gson();
        gson.toJson(cartProducts, response.getWriter()); // likedProducts를 JSON 형식으로 응답
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
