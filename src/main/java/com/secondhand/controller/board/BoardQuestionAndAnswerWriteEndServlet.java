package com.secondhand.controller.board;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondhand.model.dto.board.QnaBoard;
import com.secondhand.model.dto.member.Member;
import com.secondhand.model.service.board.QnaBoardService;

/**
 * Servlet implementation class BoardQuestionAndAnswerWriteServlet
 */
@WebServlet("/board/boardquestionandanswerwriteend.do")
public class BoardQuestionAndAnswerWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQuestionAndAnswerWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Timestamp created_at = new Timestamp(System.currentTimeMillis()); 
	    Timestamp updated_at = new Timestamp(System.currentTimeMillis()); 
	    Timestamp deleted_at = new Timestamp(System.currentTimeMillis()); 
	    char isDeleted = 'N';  // 삭제 여부 초기값
		
		
		//외래키 QNA_MEMBER_NO , QNA_TYPE_NO 
		String memberNo=request.getParameter("memberNo");
		String type=request.getParameter("type"); // QCT-1 QCT-2 QCT-3 QCT-4
		
		
		System.out.println("Title: " + title);  // JSP에서 입력한 제목 출력
	    System.out.println("Content: " + content);  // 입력한 내용 출력
	    System.out.println("Type: " + type);  // 선택된 카테고리 출력
		
		//HttpSession session = request.getSession();
        //Member loginMember = (Member) session.getAttribute("loginMember");
        
		QnaBoard q = QnaBoard.builder()
	                .qnaTitle(title)
	                .qnaContent(content)
	                .createdAt(created_at)
	                .updatedAt(updated_at)
	                .deletedAt(deleted_at)
	                .isDeleted(isDeleted)
	                
	                .qnaMemberNo(memberNo)
	                .qnaTypeNo(type)
	                .build();
		
	
		QnaBoardService service = new QnaBoardService();
			
		String msg, loc ="/";
			
		try {
				int Result = service.insertQnaBoard(q);
				msg="게시글 등록을 성공하였습니다.";
				loc="/";
			
		} catch(RuntimeException e) {
				e.printStackTrace();
				msg="게시글 등록을 실패하였습니다. 다시 시도해주세요.";
				loc="/board/boardquestionandanswerwrite.do";
			
		}
		
			
		response.setContentType("text/html;charset=utf-8");
			
			
		request.setAttribute("msg", msg);
			
		request.setAttribute("loc", loc);	

			
		//request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
		response.sendRedirect(request.getContextPath() + "/board/boardquestionandanswer.do" );
      
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
