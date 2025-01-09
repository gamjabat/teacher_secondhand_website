package com.secondhand.moder.service.review;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.review.ReviewDao;
import com.secondhand.model.dto.review.Review;

public class ReviewService {
	private ReviewDao dao = new ReviewDao();
	
	public int insertReview(Review r) {
		SqlSession session = getSession();
		int result = dao.insertReview(session, r);
		if (result > 0)
			session.commit();
		else
			session.rollback();
		session.close();
		return result;
	}
	
	public List<Review> getReviewsBySellerNo(String memberNo){
		SqlSession session = getSession();
		List<Review> reviews = dao.getReviewsBySellerNo(session, memberNo);
		session.close();
		return reviews;
	}
	
	public List<Review> getReviewsByMemberNoPaging(Map<String, Object> param){
		SqlSession session = getSession();
		List<Review> reviews = dao.getReviewsByMemberNoPaging(session, param);
		session.close();
		return reviews;
	}
	
	public int getReviewsByMemberNoPagingCount(String memberNo) {
		 SqlSession session = getSession();
		 int count = dao.getReviewsByMemberNoPagingCount(session, memberNo);
		 session.close();
		 return count;
	 }
	
	public int updateReview(Review r) {
		SqlSession session = getSession();
		int result = dao.updateReview(session, r);
		if (result > 0)
			session.commit();
		else
			session.rollback();
		session.close();
		return result;
	}
	
	public int deleteReview(String reviewNo) {
		SqlSession session = getSession();
		int result = dao.deleteReview(session, reviewNo);
		if (result > 0)
			session.commit();
		else
			session.rollback();
		session.close();
		return result;
	}
}
