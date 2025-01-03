package com.secondhand.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.product.Product;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class ProductInsertEndServlet
 */
@WebServlet("/product/prodoctinsertend.do")
public class ProductInsertEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("product-name");
		String category = request.getParameter("product-category");
		int price;
		try{
			price = Integer.parseInt(request.getParameter("product-price"));
		} catch(NumberFormatException e) {
			price = 0;
		}
		String description = request.getParameter("description");
		String transMethod = request.getParameter("trans-method");
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		String tradeLocation = sido + " " + gugun;
		String hashtag = request.getParameter("product-hashtag");
		
		Product insertProduct = Product.builder()
									.productName(name)
									.productCategoryNo(category)
									.price(price)
									.productDescription(description)
									.transMethodNo(transMethod)
									.tradeLocation(tradeLocation)
									.hashTags(hashtag)
									.build();
		
		ProductService service = new ProductService();
		
		String msg, loc ="/";
		try {
			int result = service.insertProduct(insertProduct);
			msg="상품이 등록되었습니다.";
			loc="/";
		} catch(RuntimeException e) {
			e.printStackTrace();
			msg="상품 등록에 실패하였습니다. 다시 시도해주세요.";
			loc="/product/productinsert.do";
		}
		
		response.setContentType("text/html;charset=utf-8");
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

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
