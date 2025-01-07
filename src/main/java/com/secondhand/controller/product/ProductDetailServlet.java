package com.secondhand.controller.product;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.dto.product.ProductDetail;
import com.secondhand.model.service.attachment.AttachmentService;
import com.secondhand.model.service.member.WishListService;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/product/productdetail.do")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productNo = request.getParameter("productNo");
		
		if(productNo != null && !productNo.isEmpty()) {
			ProductService productService = new ProductService();
			
			ProductDetail product = productService.selectProductDetailByProductNo(productNo);
			List<Attachment> attachments = new AttachmentService().selectAttachmentsByProductNo(productNo);
			Map<String, Object> sellerInfo = productService.getSellerInfoByProductNo(productNo);
			Member loginMember=(Member)request.getSession().getAttribute("loginMember");
			if(loginMember!=null) {
				request.setAttribute("isWishListed", new WishListService().isWishListed(
						Map.of("memberNo", loginMember.getMemberNo(), "productNo", productNo)));
			}
			request.setAttribute("product", product);
			request.setAttribute("attachments", attachments);
			request.setAttribute("sellerInfo", sellerInfo);
		}
		request.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp")
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
