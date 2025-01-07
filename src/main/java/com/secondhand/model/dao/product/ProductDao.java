package com.secondhand.model.dao.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.product.Product;
import com.secondhand.model.dto.product.ProductDetail;

public class ProductDao {
	public String generateProductNo(SqlSession session) {
        return session.selectOne("product.generateProductNo");
    }
	
	public int insertProduct(SqlSession session, Product p) throws RuntimeException {
		return session.insert("product.insertProduct" , p);
	}
	
	public ProductDetail selectProductDetailByProductNo(SqlSession session, String productNo) {
        return session.selectOne("product.selectProductDetailByProductNo", productNo);   	
	}
	
	public Product selectProductByProductNo(SqlSession session, String productNo) {
        return session.selectOne("product.selectProductByProductNo", productNo);   	
	}
	
	public Map<String, Object> selectSellerInfoByProductNo(SqlSession session, String productNo) {
        return session.selectOne("product.selectSellerInfoByProductNo", productNo);
    }
	
	public int updateProduct(SqlSession session, Product p) throws RuntimeException {
		return session.update("product.updateProduct", p);
	}
	
	public void deleteProduct(SqlSession session, String productNo) {  
        session.update("product.logicalDeleteProduct", productNo);
	}
	
	public List<Product> selectProductAll(SqlSession session, Map<String, Object> param){	
    	int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
    	
    	return session.selectList("product.selectProductAll", Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage));
    }
	
	public int selectProductAllCount(SqlSession session) {
    	return session.selectOne("product.selectProductAllCount");
    }
	
	public List<Product> searchProducts(SqlSession session, Map<String, Object> filter, Map<String, Object> param){	
    	int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		
		filter.put("start", (cPage-1)*numPerPage+1);
		filter.put("end", cPage*numPerPage);
    	
    	return session.selectList("product.searchProducts", filter);
    }
	
	public int searchProductsCount(SqlSession session, Map<String, Object> filter) {
    	return session.selectOne("product.searchProductsCount");
    }
}
