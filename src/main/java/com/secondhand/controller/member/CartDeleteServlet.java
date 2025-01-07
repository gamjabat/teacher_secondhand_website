package com.secondhand.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.service.member.CartListService;

/**
 * Servlet implementation class CartDeleteServlet
 */
@WebServlet("/member/cartdelete.do")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터 가져오기
        String memberNo = request.getParameter("memberNo");
        String productNo = request.getParameter("productNo");
        
        // 2. 서비스 호출
        CartListService service = new CartListService();
        int result = service.deleteCartItem(memberNo, productNo);
        
        // 3. 결과 반환
        response.setContentType("text/plain; charset=UTF-8");
        if (result > 0) {
            response.getWriter().write("success"); // 성공 시 "success" 반환
        } else {
            response.getWriter().write("failure"); // 실패 시 "failure" 반환
        }
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
