package com.secondhand.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.review.Review;
import com.secondhand.moder.service.review.ReviewService;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet(name="updateReviewServlet", urlPatterns="/review/updatereview.do")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReviewService reviewService = new ReviewService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewNo = request.getParameter("reviewNo");
		int rating = Integer.parseInt(request.getParameter("rating"));
		String content = request.getParameter("content");
		
		Review review = Review.builder()
						.reviewNo(reviewNo)
						.rating(rating)
						.reviewContent(content)
						.build();
		
		int result = reviewService.updateReview(review);
		
		String msg, loc = "/member/myreviews.do";
		if (result > 0) {
            msg = "후기가 성공적으로 수정되었습니다.";
        } else {
            msg = "후기 수정에 실패했습니다. 다시 시도해주세요.";
        }
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}