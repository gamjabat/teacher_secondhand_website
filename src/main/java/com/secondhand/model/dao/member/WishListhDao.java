package com.secondhand.model.dao.member;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class WishListhDao {
	// 좋아요 상태 확인
    public boolean isWishListed(SqlSession session, Map<String, String> params) {
        return session.selectOne("wishlist.isWishListed", params) != null;
    }

    // 좋아요 추가
    public int insertWish(SqlSession session, Map<String, String> params) {
        return session.insert("wishlist.insertWish", params);
    }

    // 좋아요 상태 업데이트 (Y -> N 또는 N -> Y)
    public int updateWishStatus(SqlSession session, Map<String, String> params, String status) {
        params.put("isDeleted", status);
        return session.update("wishlist.updateWishStatus", params);
    }
}


