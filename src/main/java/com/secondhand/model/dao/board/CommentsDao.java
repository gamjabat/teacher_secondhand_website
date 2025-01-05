package com.secondhand.model.dao.board;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.board.Comments;


public class CommentsDao {
	
	public int insertQnaComment(SqlSession session,Comments c) {
		return session.insert("comments.insertQnaComment",c);
	}

}
