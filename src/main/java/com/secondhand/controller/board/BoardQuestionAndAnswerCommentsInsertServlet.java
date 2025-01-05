package com.secondhand.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.board.Comments;
import com.secondhand.model.service.board.CommentsService;

/**
 * Servlet implementation class BoardQuestionAndAnswerDetailServlet
 */
@WebServlet(urlPatterns = "/board/insertqnacomment.do")
public class BoardQuestionAndAnswerCommentsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQuestionAndAnswerCommentsInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String qnaNo = request.getParameter("commentQnaNo");
		String writer = request.getParameter("commentMemberNo");
		

		Comments c = Comments.builder()
				.commentQnaNo(qnaNo)
				.commentMemberNo(writer)
				.commentContent(content)
				.build();

		int result = new CommentsService().insertQnaComment(c);

		String msg, loc = "/board/boardquestionandanswerdetail.do?qnaNo=" + qnaNo;
		if (result > 0) {
			msg = "댓글 등록 성공";
		} else {
			msg = "댓글 등록 실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
