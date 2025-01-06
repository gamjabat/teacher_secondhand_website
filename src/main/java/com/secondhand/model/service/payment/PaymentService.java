package com.secondhand.model.service.payment;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.payment.PaymentDao;

public class PaymentService {
	private PaymentDao dao = new PaymentDao();
	
	public String generatePaymentNo() throws RuntimeException {
		 SqlSession session = getSession();
		 String productNo = dao.generatePaymentNo(session);
		 session.close();
		 return productNo;
	}

}
