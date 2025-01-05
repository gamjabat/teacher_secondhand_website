package com.secondhand.model.service.board;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import com.secondhand.model.dao.board.QnaBoardDao;
import com.secondhand.model.dto.board.QnaBoard;
import com.secondhand.model.dto.member.Member;

public class QnaBoardService {
	
		private QnaBoardDao dao=new QnaBoardDao();
	
	public QnaBoard selectByBoardNo(String qnaNo) {
			 
			 SqlSession session = getSession();
			 QnaBoard qb = dao.selectQnaBoardByNo(session, qnaNo);
			 session.close();
			 return qb;   
	}
	
	public int insertQnaBoard(QnaBoard q) {
		SqlSession session = getSession();
		try {
	        // 1. 문의 게시글 번호 생성 (여기서는 번호 생성 로직이 있다고 가정)
	        String qnaNo = dao.generateQnaNo(session); 
	        q.setQnaNo(qnaNo); // 생성된 게시글 번호를 QnaBoard 객체에 설정

	        // 2. QnaBoard 삽입
	        int result = dao.insertQnaBoard(session, q);
	        if (result <= 0) {
	            session.rollback();
	            throw new RuntimeException("게시글 등록 실패");
	        }

	        // 3. 트랜잭션 커밋
	        session.commit();
	        return result;

	    } catch (Exception e) {
	        session.rollback();
	        throw new RuntimeException("등록 중 오류 발생: " + e.getMessage());
	    } finally {
	        session.close();
	    }
	}
	
	public List<QnaBoard> getAllQnaBoards(Map<String, Integer> param) {
        try (SqlSession session = getSession()) {
            QnaBoardDao dao = new QnaBoardDao();
            return dao.selectAllQnaBoards(session,param);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to fetch QnA boards", e);
        }
    }
	
	
	 // 게시물 페이징바
	 public List<QnaBoard> selectPagingQna(Map<String, Integer> param) {
		 SqlSession session = getSession();
		 List<QnaBoard> board = dao.selectPagingQna(session, param);
		 session.close();
		 return board;
	 }
	 
	 // 게시물 페이징바(관련) 행의 총 개수 
	 public int selectQnaCount() {
		 SqlSession session = getSession();
		 int count = dao.selectQnaCount(session);
		 session.close();
		 return count;
	 }
	 
}
