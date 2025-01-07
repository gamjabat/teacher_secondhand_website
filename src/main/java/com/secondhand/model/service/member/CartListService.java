package com.secondhand.model.service.member;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.member.CartListDao;

public class CartListService {
	private CartListDao dao = new CartListDao();
	
	
	public int toggleCartList(Map<String, String> params) {
        try (SqlSession session = getSession()) {
            boolean isCarted = dao.isCartListed(session, params);

            int result;
            if (isCarted) {
            	result=0;
            } else {
                result = dao.insertCart(session, params);
                if(result>0) result=1;
            }

            // 트랜잭션 커밋
            session.commit();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("위시리스트 처리 중 오류 발생", e);
        }
    }
	
	
	 public List<Map<String, Object>> getCartedProducts(String memberNo) {
	        try (SqlSession session = getSession()) { // getSession()으로 SqlSession 가져오기
	            return dao.getCartedProducts(session, memberNo);
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new RuntimeException("좋아요한 상품 목록 조회 중 오류 발생", e);
	        }
	    }
	   
	 
	 public int deleteCartItem(String memberNo, String productNo) {
		    try (SqlSession session = getSession()) {
		        Map<String, String> params = new HashMap<>();
		        params.put("memberNo", memberNo);
		        params.put("productNo", productNo);

		        int result = new CartListDao().DeleteCartStatus(session, params);
		        
		        if (result > 0) {
		            session.commit(); // 성공 시 커밋
		        } else {
		            session.rollback(); // 실패 시 롤백
		        }
		        
		        return result; // 성공하면 삭제된 행의 개수를 반환
		    } catch (Exception e) {
		        e.printStackTrace();
		        throw new RuntimeException("카트 항목 삭제 중 오류 발생", e);
		    }
		}
}
