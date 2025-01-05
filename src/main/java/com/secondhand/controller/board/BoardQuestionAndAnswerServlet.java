package com.secondhand.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondhand.model.dto.board.QnaBoard;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.board.QnaBoardService;
import com.secondhand.model.service.member.MemberService;

/**
 * Servlet implementation class BoardQnA
 */
@WebServlet(name="boardquestionandanswerservlet" ,urlPatterns = "/board/boardquestionandanswer.do")
public class BoardQuestionAndAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQuestionAndAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		QnaBoardService service = new QnaBoardService();
	    List<QnaBoard> qnaList = service.getAllQnaBoards(); // 모든 Q&A 데이터를 가져옴
	    
	 
	    
	    request.setAttribute("qnaList", qnaList); // 데이터를 JSP로 전달
	
		request.getRequestDispatcher("/WEB-INF/views/board/boardQuestionAndAnswer.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
