package com.secondhand.model.dao.product;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.product.Product;

public class ProductDao {
	public int insertProduct(SqlSession session, Product p) throws RuntimeException {
		return session.insert("product.insertProduct" , p);
	}
}
