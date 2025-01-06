package com.secondhand.model.service.member;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.member.WishListhDao;

public class WishListhService {
	private WishListhDao dao = new WishListhDao();
	
	// 위시리스트 추가/삭제 처리
    public int toggleWishList(Map<String, String> params) {
        try (SqlSession session = getSession()) {
            // 현재 좋아요 상태 확인
            boolean isLiked = dao.isWishListed(session, params);

            int result;
            if (isLiked) {
                // 이미 좋아요한 경우 => 좋아요 취소
                result = dao.updateWishStatus(session, new HashMap<>(params), "Y");
            } else {
                // 좋아요가 없는 경우 => 좋아요 추가
                result = dao.insertWish(session, params);
            }

            // 트랜잭션 커밋
            session.commit();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("위시리스트 처리 중 오류 발생", e);
        }
    }
}
