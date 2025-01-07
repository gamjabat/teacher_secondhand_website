package com.secondhand.model.service.payment;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.payment.PaymentDao;
import com.secondhand.model.dto.payment.Payment;

public class PaymentService {
	private PaymentDao dao = new PaymentDao();
	
	public String generatePaymentNo() throws RuntimeException {
		 SqlSession session = getSession();
		 String productNo = dao.generatePaymentNo(session);
		 session.close();
		 return productNo;
	}
	
	public int insertPayment(Payment p) {
		SqlSession session = getSession();
		int result = dao.insertPayment(session, p);
		if (result > 0)
			session.commit();
		else
			session.rollback();
		session.close();
		return result;
    }
	
	public Map<String, Object> selectByPaymentNo(String paymentNo) {
		SqlSession session = getSession();
		Map<String, Object> p = dao.selectByPaymentNo(session, paymentNo);
		session.close();
		return p;
	}

}
