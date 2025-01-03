package com.secondhand.model.dao.attachment;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.attachment.Attachment;

public class AttachmentDao {
	public int uploadImg(SqlSession session, Attachment a) throws RuntimeException {
		return session.insert("attachment.uploadImg" , a);
	}
}
