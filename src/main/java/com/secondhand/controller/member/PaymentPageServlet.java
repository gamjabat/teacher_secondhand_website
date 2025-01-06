	package com.secondhand.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.dto.product.Product;
import com.secondhand.model.service.attachment.AttachmentService;
import com.secondhand.model.service.member.MemberService;
import com.secondhand.model.service.product.ProductService;

/**
 * Servlet implementation class PaymentPageServlet
 */
@WebServlet(name="paymentpageservlet" ,urlPatterns = "/member/paymentpage.do")
public class PaymentPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productNo = request.getParameter("productNo");
		
		HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        
        Member member = new MemberService().selectMemberById(loginMember.getMemberId());
        request.setAttribute("member", member);
		
		if(productNo != null && !productNo.isEmpty()) {
			ProductService productService = new ProductService();
			
			Product product = productService.selectProductByProductNo(productNo);
		
			List<Attachment> attachments =  new AttachmentService().selectAttachmentsByProductNo(productNo);
			
			request.setAttribute("product", product);
			request.setAttribute("img", attachments.get(0));
		}
		
		request.getRequestDispatcher("/WEB-INF/views/member/paymentPage.jsp")
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
