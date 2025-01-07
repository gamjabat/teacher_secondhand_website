package com.secondhand.controller.payment;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.payment.Payment;
import com.secondhand.model.dto.product.ProductDetail;
import com.secondhand.model.service.attachment.AttachmentService;
import com.secondhand.model.service.payment.PaymentService;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class PaymentDetailServlet
 */
@WebServlet(name= "paymentdetailservlet" ,urlPatterns = "/payment/paymentdetail.do")
public class PaymentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paymentNo = request.getParameter("paymentNo");
		
		if(paymentNo != null && !paymentNo.isEmpty()) {
			PaymentService paymentService = new PaymentService();
			
			Map<String, Object> payment = paymentService.selectByPaymentNo(paymentNo);
			System.out.println(payment);
			String productNo = (String) payment.get("PRODUCTNUMBER");
			
			request.setAttribute("payment", payment);
		
			if(productNo != null && !productNo.isEmpty()) {
				ProductService productService = new ProductService();
				
				ProductDetail product = productService.selectProductDetailByProductNo(productNo);
				List<Attachment> attachments = new AttachmentService().selectAttachmentsByProductNo(productNo);
				Map<String, Object> sellerInfo = productService.getSellerInfoByProductNo(productNo);
				
				request.setAttribute("product", product);
				request.setAttribute("attachments", attachments);
				request.setAttribute("sellerInfo", sellerInfo);
			}
			
		}
		request.getRequestDispatcher("/WEB-INF/views/member/paymentDetail.jsp")
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
