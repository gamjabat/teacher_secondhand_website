package com.secondhand.model.service.board;



import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import com.secondhand.model.dao.board.CommentsDao;
import com.secondhand.model.dto.board.Comments;


public class CommentsService {
	private CommentsDao dao=new CommentsDao();
	
	public int insertQnaComment(Comments c) {
		SqlSession session=getSession();
		int result=dao.insertQnaComment(session,c);
		if(result>0) session.commit();
	    else session.rollback();
		session.close();
		return result;
	}
	
	
	public List<Comments> selectBoardComment(String commentNo) {
		SqlSession session=getSession();	
		List<Comments> comments=dao.selectQnaComment(session,commentNo);
		session.close();
		return comments;
		
	}
}
