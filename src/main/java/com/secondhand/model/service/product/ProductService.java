package com.secondhand.model.service.product;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.product.ProductDao;
import com.secondhand.model.dto.product.Product;

public class ProductService {
	private ProductDao dao = new ProductDao();
	
	public int insertProduct(Product p) throws RuntimeException {
		SqlSession session = getSession();
		int result = dao.insertProduct(session, p);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}
}
