package com.secondhand.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.member.Member;
import com.secondhand.model.dto.product.Product;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/product/delete.do")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productNo = request.getParameter("productNo");
		
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
 	    
 	    ProductService service = new ProductService();
 	    Product product = service.selectProductByProductNo(productNo);
 	    
	 	// 작성자인지 확인
	    if (loginMember == null || !loginMember.getMemberNo().equals(product.getProductMemberNo())) {
	    	request.setAttribute("msg", "게시글 삭제 권한이 없습니다.");
	    	request.setAttribute("loc", "/product/productdetail.do?productNo="+productNo);
	    	request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	        return;
	    }
	    
	    if (productNo != null && !productNo.isEmpty()) {
            service.deleteProduct(productNo);  // 논리적 삭제 메소드 호출
            
            request.setAttribute("msg", "상품이 삭제되었습니다.");
	    	request.setAttribute("loc", "/");
        } else {
        	request.setAttribute("msg", "상품 삭제에 실패했습니다. 다시 시도해주세요.");
	    	request.setAttribute("loc", "/product/productdetail.do?productNo="+productNo);
        }
	    
	    request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
 	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
