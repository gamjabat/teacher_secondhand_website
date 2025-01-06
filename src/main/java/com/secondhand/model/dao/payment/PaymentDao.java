package com.secondhand.model.dao.payment;

import org.apache.ibatis.session.SqlSession;

public class PaymentDao {
	public String generatePaymentNo(SqlSession session) {
        return session.selectOne("payment.generatePaymentNo");
    }

}
