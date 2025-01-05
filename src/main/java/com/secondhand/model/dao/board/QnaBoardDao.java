package com.secondhand.model.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	
	public List<QnaBoard> selectAllQnaBoards(SqlSession session,Map<String, Integer> param) {
	    return session.selectList("qnaboard.selectAllQnaBoards",null,new RowBounds(
				(param.get("cPage")-1)*param.get("numPerPage"),param.get("numPerPage")));
	}
	
	 // 게시물 페이징 처리
    public List<QnaBoard> selectPagingQna(SqlSession session, Map<String, Integer> param) {
    		int cPage = param.get("cPage");
    		int numPerPage = param.get("numPerPage");
    		
    		return session.selectList("qnaboard.selectPagingQna", 
    				Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage ));
    	
    }
    
    // 게시물 총합 개수
    public int selectQnaCount(SqlSession session) {
    	return session.selectOne("qnaboard.selectQnaCount");
    }
}
