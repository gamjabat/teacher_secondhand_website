package com.secondhand.model.dao.attachment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.attachment.Attachment;

public class AttachmentDao {
	public int uploadImg(SqlSession session, Attachment a) throws RuntimeException {
		return session.insert("attachment.uploadImg" , a);
	}
	
	public List<Attachment> selectAttachmentsByProductNo(SqlSession session, String productNo) {
        return session.selectList("attachment.selectAttachmentsByProductNo", productNo);
    }
}
