package com.secondhand.model.dao.member;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.product.Product;

public class WishListDao {
	// 좋아요 상태 확인
    public boolean isWishListed(SqlSession session, Map<String, String> params) {
        return session.selectOne("wishlist.isWishListed", params) != null;
    }

    // 좋아요 추가
    public int insertWish(SqlSession session, Map<String, String> params) {
        return session.insert("wishlist.insertWish", params);
    }

    // 좋아요 상태 업데이트 (Y -> N 또는 N -> Y)
    public int deleteWishStatus(SqlSession session, Map<String, String> params, String status) {
        params.put("isDeleted", status);
        return session.delete("wishlist.deleteWishStatus", params);
    }
    
    public List<Map<String, Object>> getLikedProducts(SqlSession session, String memberNo, Map<String,Integer> param) {
    	
    	return session.selectList("wishlist.getLikedProducts", memberNo ,new RowBounds(
				(param.get("cPage")-1)*param.get("numPerPage"),param.get("numPerPage")));
    }
    
    // 게시물 총합 개수
    public int selectWishListCount(SqlSession session, String memberNo) {
    	return session.selectOne("wishlist.selectWishListCount", memberNo);
    }
}


