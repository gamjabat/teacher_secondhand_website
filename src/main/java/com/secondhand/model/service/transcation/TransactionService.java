package com.secondhand.model.service.transcation;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.transaction.TransactionDao;
import com.secondhand.model.dto.transaction.Transaction;

public class TransactionService {
	
	private TransactionDao dao = new TransactionDao();
	
	public int insertTransaction(Map<String, Object> param) {
		SqlSession session = getSession();
		int result = dao.insertTransaction(session, param);
		if (result > 0)
			session.commit();
		else
			session.rollback();
		session.close();
		return result;
    }
	
	public Transaction selectTransactionByProductAndMember(Map<String, Object> param) {
		SqlSession session = getSession();
		Transaction t = dao.selectTransactionByProductAndMember(session, param);
		session.close();
		return t;
	}
}
