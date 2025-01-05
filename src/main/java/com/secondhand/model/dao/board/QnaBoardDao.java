package com.secondhand.model.dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.board.QnaBoard;
import com.secondhand.model.dto.member.Member;


public class QnaBoardDao {
	
	public String generateQnaNo(SqlSession session) {
		return session.selectOne("qnaboard.generateQnaNo");
	}
	public int insertQnaBoard(SqlSession session, QnaBoard q) {
		return session.insert("qnaboard.insertQnaBoard", q);
	}
	public QnaBoard selectQnaBoardByNo(SqlSession session, String qnaNo) {
	    return session.selectOne("qnaboard.selectQnaBoardByNo", qnaNo);
	}
	
	public List<QnaBoard> selectAllQnaBoards(SqlSession session) {
	    return session.selectList("qnaboard.selectAllQnaBoards");
	}
}
