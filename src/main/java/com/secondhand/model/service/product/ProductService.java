package com.secondhand.model.service.product;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.attachment.AttachmentDao;
import com.secondhand.model.dao.product.ProductDao;
import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.product.Product;

public class ProductService {
	private ProductDao dao = new ProductDao();
	private AttachmentDao attachmentDao = new AttachmentDao();
	
	public int insertProduct(Product p, List<Attachment> attachments) throws RuntimeException {
		SqlSession session = getSession();
		try {
	        // 1. 상품 번호 생성
	        String productNo = dao.generateProductNo(session);
	        p.setProductNo(productNo); // 생성된 상품 번호를 Product 객체에 설정

	        // 2. 상품 등록
	        int result = dao.insertProduct(session, p);
	        if (result <= 0) {
	            session.rollback();
	            throw new RuntimeException("상품 등록 실패");
	        }

	        // 3. 이미지 등록
	        for (Attachment attachment : attachments) {
	            attachment.setAttachmentProductNo(productNo); // 상품 번호를 이미지에 설정
	            int attachResult = attachmentDao.uploadImg(session, attachment);
	            if (attachResult <= 0) {
	                session.rollback();
	                throw new RuntimeException("이미지 등록 실패");
	            }
	        }

	        // 4. 트랜잭션 커밋
	        session.commit();
	        return result;

	    } catch (Exception e) {
	        session.rollback();
	        throw new RuntimeException("등록 중 오류 발생: " + e.getMessage());
	    } finally {
	        session.close();
	    }
	}
}
