package com.secondhand.model.service.product;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.attachment.AttachmentDao;
import com.secondhand.model.dao.product.ProductDao;
import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.product.Product;
import com.secondhand.model.dto.product.ProductDetail;

public class ProductService {
	private ProductDao dao = new ProductDao();
	private AttachmentDao attachmentDao = new AttachmentDao();
	
	public String generateProductNo() throws RuntimeException {
		 SqlSession session = getSession();
		 String productNo = dao.generateProductNo(session);
		 session.close();
		 return productNo;
	}
	
	public int insertProduct(Product p, List<Attachment> attachments) throws RuntimeException {
		SqlSession session = getSession();
		try {
	        int result = dao.insertProduct(session, p);
	        if (result <= 0) {
	            session.rollback();
	            throw new RuntimeException("상품 등록 실패");
	        }

	        for (Attachment attachment : attachments) {
	            attachment.setAttachmentProductNo(p.getProductNo());
	            int attachResult = attachmentDao.uploadProductImg(session, attachment);
	            if (attachResult <= 0) {
	                session.rollback();
	                throw new RuntimeException("이미지 등록 실패");
	            }
	        }

	        session.commit();
	        return result;

	    } catch (Exception e) {
	        session.rollback();
	        throw new RuntimeException("등록 중 오류 발생: " + e.getMessage());
	    } finally {
	        session.close();
	    }
	}
	
	public int updateProduct(Product p, List<Attachment> attachments) throws RuntimeException {
		SqlSession session = getSession();
		try {
	        int result = dao.updateProduct(session, p);
	        if (result <= 0) {
	            session.rollback();
	            throw new RuntimeException("상품 수정 실패");
	        }
	        
	        if(!attachments.isEmpty()) {
	        	int deleteAttachResult = attachmentDao.deleteProductImg(session, p.getProductNo());
        		if (deleteAttachResult <= 0) {
        			session.rollback();
        			throw new RuntimeException("기존 이미지 삭제 실패");
        		}
	        	
	        	for (Attachment attachment : attachments) {
	        		attachment.setAttachmentProductNo(p.getProductNo());
	        		int attachResult = attachmentDao.uploadProductImg(session, attachment);
	        		if (attachResult <= 0) {
	        			session.rollback();
	        			throw new RuntimeException("이미지 수정 실패");
	        		}
	        	}
	        }
	        
	        session.commit();
	        return result;

	    } catch (Exception e) {
	        session.rollback();
	        e.printStackTrace();
	        throw new RuntimeException("수정 중 오류 발생: " + e.getMessage());
	    } finally {
	        session.close();
	    }
	}
	
	public ProductDetail selectProductDetailByProductNo(String productNo) {
		 SqlSession session = getSession();
		 ProductDetail p = dao.selectProductDetailByProductNo(session, productNo);
		 session.close();
		 return p;   
	}
	
	public Product selectProductByProductNo(String productNo) {
		 SqlSession session = getSession();
		 Product p = dao.selectProductByProductNo(session, productNo);
		 session.close();
		 return p;   
	}
	
	public void deleteProduct(String productNo) {
        SqlSession session = getSession();
        try {
            dao.deleteProduct(session, productNo);  // 세션을 통해 논리적 삭제 수행
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
	
	public List<Product> selectProductAll(Map<String, Object> param){
	 	SqlSession session = getSession();
		List<Product> products = dao.selectProductAll(session, param);
		session.close();
		return products;
	}
	
	public int selectProductAllCount() {
		 SqlSession session = getSession();
		 int count = dao.selectProductAllCount(session);
		 session.close();
		 return count;
	 }
	
	public List<Product> searchProducts(Map<String, Object> filters, Map<String, Object> param) {
		SqlSession session = getSession();
		List<Product> products = dao.searchProducts(session, filters, param);
		session.close();
		return products;
    }
	
	public int searchProductsCount(Map<String, Object> filters) {
		SqlSession session = getSession();
		int count = dao.searchProductsCount(session, filters);
		session.close();
		return count;
    }
	
	public List<Map<String, Object>> getPurchaseHistory(Map<String, Object> param){
		SqlSession session = getSession();
		List<Map<String, Object>> products = dao.getPurchaseHistory(session, param);
		session.close();
		return products;
	}
	
	public int getPurchaseHistoryCount(String memberNo){
		SqlSession session = getSession();
		int count = dao.getPurchaseHistoryCount(session, memberNo);
		session.close();
		return count;
	}
	
	public List<Product> selectProductsByMemberNo(Map<String, Object> param){
	 	SqlSession session = getSession();
		List<Product> products = dao.selectProductsByMemberNo(session, param);
		session.close();
		return products;
	}
	
	public int selectProductsByMemberNoCount(String memberNo) {
		 SqlSession session = getSession();
		 int count = dao.selectProductsByMemberNoCount(session, memberNo);
		 session.close();
		 return count;
	 }
}
