package com.secondhand.model.service.attachment;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.attachment.AttachmentDao;
import com.secondhand.model.dto.attachment.Attachment;

public class AttachmentService {
	private AttachmentDao dao = new AttachmentDao();
	
	public int uploadImg(Attachment a) throws RuntimeException {
		SqlSession session = getSession();
		int result = dao.uploadImg(session, a);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}
}
