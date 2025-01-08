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
}
