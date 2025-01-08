package com.secondhand.model.dao.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.review.Review;

public class ReviewDao {
	public int insertReview(SqlSession session, Review r) throws RuntimeException {
		return session.insert("review.insertReview" , r);
	}
	
	public List<Review> getReviewsBySellerNo(SqlSession session, String memberNo){
    	return session.selectList("review.getReviewsBySellerNo", memberNo);
    }
	
	public List<Review> getReviewsByMemberNoPaging(SqlSession session, Map<String, Object> param){
		int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		
		param.put("start", (cPage-1)*numPerPage+1);
		param.put("end", cPage*numPerPage);
		
    	return session.selectList("review.getReviewsByMemberNoPaging", param);
    }
	
	public int getReviewsByMemberNoPagingCount(SqlSession session, String memberNo) {
    	return session.selectOne("review.getReviewsByMemberNoPagingCount", memberNo);
    }
	
	public int updateReview(SqlSession session, Review r) throws RuntimeException {
		return session.update("review.updateReview" , r);
	}
	
	public int deleteReview(SqlSession session, String reviewNo) throws RuntimeException {
		return session.update("review.deleteReview" , reviewNo);
	}
	
}
