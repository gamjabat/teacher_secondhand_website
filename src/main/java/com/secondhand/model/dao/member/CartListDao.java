package com.secondhand.model.dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

public class CartListDao {
	
	 public boolean isCartListed(SqlSession session, Map<String, String> params) {
	        return session.selectOne("cartlist.isCartListed", params) != null;
	    }

	    // 장바구니 추가 기능
	    public int insertCart(SqlSession session, Map<String, String> params) {
	        return session.insert("cartlist.insertCart", params);
	    }

	    // 장바구니 삭제 
	    public int DeleteCartStatus(SqlSession session, Map<String, String> params) {
	        return session.delete("cartlist.DeleteCartStatus", params);
	    }
	    
	    public List<Map<String, Object>> getCartedProducts(SqlSession session, String memberNo ,  Map<String,Integer> param) {
	        return session.selectList("cartlist.getCartedProducts", memberNo, new RowBounds(
					(param.get("cPage")-1)*param.get("numPerPage"),param.get("numPerPage")));
	    }
	    
	    // 게시물 총합 개수
	    public int selectCartListCount(SqlSession session, String memberNo) {
	    	return session.selectOne("cartlist.selectCartListCount", memberNo);
	    }
}
