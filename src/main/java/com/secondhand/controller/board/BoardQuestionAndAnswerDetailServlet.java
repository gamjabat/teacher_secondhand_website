package com.secondhand.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.board.Comments;
import com.secondhand.model.dto.board.QnaBoard;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.board.CommentsService;
import com.secondhand.model.service.board.QnaBoardService;
import com.secondhand.model.service.member.MemberService;

/**
 * Servlet implementation class BoardQuestionAndAnswerDetailServlet
 */
@WebServlet(name="boardquestionandanswerdetail" ,urlPatterns = "/board/boardquestionandanswerdetail.do")
public class BoardQuestionAndAnswerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQuestionAndAnswerDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String qnaNo = request.getParameter("qnaNo"); // 요청 파라미터에서 QnA 번호를 가져옵니다.
		    
			QnaBoardService service = new QnaBoardService();
		    QnaBoard qna = service.selectByBoardNo(qnaNo); // QnA 데이터를 가져옵니다.
		    
		    MemberService m = new MemberService();
		    Member member = m.getMemberByQnaNo(qnaNo); // QnaNo로 Member를 조회하는 로직 추가
		    qna.setMember(member); // QnaBoard 객체에 member를 설정
		    
		    List<Comments> comments=new CommentsService().selectBoardComment(qnaNo);
		    
			request.setAttribute("comments", comments);
		    request.setAttribute("qna", qna); // JSP로 데이터 전달
		    request.setAttribute("member", member);
		    request.getRequestDispatcher("/WEB-INF/views/board/boardQuestionAndAnswerDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
