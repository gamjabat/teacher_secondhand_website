package com.secondhand.model.dao.attachment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.attachment.Attachment;

public class AttachmentDao {
	public int uploadProductImg(SqlSession session, Attachment a) throws RuntimeException {
		return session.insert("attachment.uploadProductImg" , a);
	}
	
	public int uploadMemberImg(SqlSession session, Attachment a) throws RuntimeException {
		return session.insert("attachment.uploadMemberImg" , a);
	}
	
	public List<Attachment> selectAttachmentsByProductNo(SqlSession session, String productNo) {
        return session.selectList("attachment.selectAttachmentsByProductNo", productNo);
    }
	
	public int deleteProductImg(SqlSession session, String productNo) throws RuntimeException {
		return session.delete("attachment.deleteProductImg" , productNo);
	}
	
	public Attachment selectAttachmentByMemberNo(SqlSession session, String memberNo) {
	    return session.selectOne("attachment.selectAttachmentByMemberNo", memberNo);
	}
	
	public int updateAttachment(SqlSession session, Attachment attachment) {
	    return session.update("attachment.updateAttachment", attachment);
	}
}
