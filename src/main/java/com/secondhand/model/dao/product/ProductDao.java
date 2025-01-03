package com.secondhand.model.dao.product;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.product.Product;

public class ProductDao {
	public String generateProductNo(SqlSession session) {
        return session.selectOne("product.generateProductNo");
    }
	
	public int insertProduct(SqlSession session, Product p) throws RuntimeException {
		return session.insert("product.insertProduct" , p);
	}
	
	public Product selectByProductNo(SqlSession session, String productNo) {
        return session.selectOne("product.selectByProductNo", productNo);   	
	}
}
