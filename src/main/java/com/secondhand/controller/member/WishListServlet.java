package com.secondhand.controller.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.service.member.WishListhService;



/**
 * Servlet implementation class WishListServlet
 */
@WebServlet(name= "wishlistservlet" ,urlPatterns = "/member/wishlist.do")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 요청에서 파라미터 가져오기
//        String memberNo = request.getParameter("memberNo");
//        String productNo = request.getParameter("productNo"); // producttNo로 되어 있어 수정 가능
        
        String memberNo = request.getParameter("memberNo");
        String productNo = request.getParameter("productNo");

        
        // 서비스 호출하여 위시리스트 처리
        int result = new WishListhService().toggleWishList(Map.of("memberNo", memberNo, "productNo", productNo));

        // 처리 결과를 JSP에 전달
//        request.setAttribute("result", result);
//
//        // 결과 페이지로 포워딩
//        request.getRequestDispatcher("/WEB-INF/views/member/wishList.jsp").forward(request, response);
        response.getWriter().print(result);
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
