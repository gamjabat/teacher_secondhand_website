package com.secondhand.model.dao.transaction;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.transaction.Transaction;

public class TransactionDao {
	public int insertTransaction(SqlSession session, Map<String, Object> param) throws RuntimeException {
		return session.insert("transaction.insertTransaction" , param);
	}
	
	public Transaction selectTransactionByProductAndMember(SqlSession session, Map<String, Object> param) {
		return session.selectOne("transaction.selectTransactionByProductAndMember", param);
	}
}
