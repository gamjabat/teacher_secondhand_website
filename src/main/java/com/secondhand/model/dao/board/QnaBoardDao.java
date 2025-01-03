package com.secondhand.model.dao.board;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.board.QnaBoard;


public class QnaBoardDao {
	
	public String generateQnaNo(SqlSession session) {
		return session.selectOne("qnaboard.generateQnaNo");
	}
	public int insertQnaBoard(SqlSession session, QnaBoard q) {
		return session.insert("qnaboard.insertQnaBoard", q);
	}
}
