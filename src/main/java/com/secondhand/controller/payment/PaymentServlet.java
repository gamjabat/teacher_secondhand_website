package com.secondhand.controller.payment;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondhand.model.dto.member.Member;
import com.secondhand.model.dto.payment.Payment;
import com.secondhand.model.dto.transaction.Transaction;
import com.secondhand.model.service.payment.PaymentService;
import com.secondhand.model.service.transcation.TransactionService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PaymentService paymentService = new PaymentService();
    private TransactionService transactionService = new TransactionService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        if ("init".equals(action)) {
            // 주문번호 생성 및 반환
            processInitPayment(request, response);
        } else if ("complete".equals(action)) {
            // 결제 완료 처리
            processCompletePayment(request, response);
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid action\"}");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void processInitPayment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 결제 정보를 데이터베이스에 저장하며 고유번호 생성
        String paymentNo = paymentService.generatePaymentNo();

        // JSON 응답으로 주문번호 반환
        response.setContentType("application/json");
        response.getWriter().write("{\"success\": true, \"paymentNo\": \"" + paymentNo + "\"}");
    }

    private void processCompletePayment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 결제 검증 및 데이터 저장 로직 (기존 내용)
    	String paymentNo = request.getParameter("paymentNo");
        int paymentAmount = Integer.parseInt(request.getParameter("amount"));
        String payoneId = request.getParameter("imp_uid");
        String paymentReceiptUrl = request.getParameter("receipt_url");
        String productNo = request.getParameter("productNo");

        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null || productNo == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"Missing parameters\"}");
            return;
        }

        String memberNo = loginMember.getMemberNo();
        Map<String, Object> param = new HashMap<>();
        param.put("productNo", productNo);
        param.put("memberNo", memberNo);

        Transaction transaction = transactionService.selectTransactionByProductAndMember(param);

        if (transaction == null) {
            transactionService.insertTransaction(param);
            transaction = transactionService.selectTransactionByProductAndMember(param);
        }

        Payment payment = Payment.builder()
                .paymentNo(paymentNo)
                .paymentAmount(paymentAmount)
                .payoneId(payoneId)
                .paymentReceiptUrl(paymentReceiptUrl)
                .paymentTransNo(transaction.getTransactionNo())
                .paymentStatusNo("PAY-3")
                .paymentMethodNo("PMM-1")
                .build();

        int result = paymentService.insertPayment(payment);

        if (result > 0) {
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": true, \"paymentNo\": \"" + paymentNo + "\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"Failed to process payment\"}");
        }
    }

}
