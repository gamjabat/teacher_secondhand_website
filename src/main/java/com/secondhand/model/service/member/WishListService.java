package com.secondhand.model.service.member;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.member.WishListDao;
import com.secondhand.model.dto.product.Product;

public class WishListService {
	private WishListDao dao = new WishListDao();
	
	// 위시리스트 추가/삭제 처리
    public int toggleWishList(Map<String, String> params) {
        try (SqlSession session = getSession()) {
            // 현재 좋아요 상태 확인
            boolean isLiked = dao.isWishListed(session, params);

            int result;
            if (isLiked) {
                // 이미 좋아요한 경우 => 좋아요 취소
                result = dao.deleteWishStatus(session, new HashMap<>(params), "Y");
                if(result>0) result=0;
            } else {
                // 좋아요가 없는 경우 => 좋아요 추가
                result = dao.insertWish(session, params);
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
    
    public List<Map<String, Object>> getLikedProducts(String memberNo) {
        try (SqlSession session = getSession()) { // getSession()으로 SqlSession 가져오기
            return dao.getLikedProducts(session, memberNo);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("좋아요한 상품 목록 조회 중 오류 발생", e);
        }
    }
    
    public boolean isWishListed(Map<String,String> params){
    	
    	SqlSession session = getSession();
    	boolean result=dao.isWishListed(session, params);
    	session.close();
    	
    	return result;
    }
}
    
   
