package com.secondhand.model.dao.payment;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.payment.Payment;

public class PaymentDao {
	public String generatePaymentNo(SqlSession session) {
        return session.selectOne("payment.generatePaymentNo");
    }

	public int insertPayment(SqlSession session, Payment p) throws RuntimeException {
		return session.insert("payment.insertPayment" , p);
	}
	
	public Map<String, Object> selectByPaymentNo(SqlSession session, String paymentNo) {
		return session.selectOne("payment.selectByPaymentNo", paymentNo);
	}
}
