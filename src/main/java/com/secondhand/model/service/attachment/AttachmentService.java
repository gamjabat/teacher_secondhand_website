package com.secondhand.model.service.attachment;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.attachment.AttachmentDao;
import com.secondhand.model.dto.attachment.Attachment;

public class AttachmentService {
	private AttachmentDao dao = new AttachmentDao();
	
//	public int uploadProductImg(Attachment a) throws RuntimeException {
//		SqlSession session = getSession();
//		int result = dao.uploadProductImg(session, a);
//		if (result > 0) session.commit();
//		else session.rollback();
//		session.close();
//		return result;
//	}
	
	public List<Attachment> selectAttachmentsByProductNo(String productNo) {
        SqlSession session = getSession();
        List<Attachment> result = dao.selectAttachmentsByProductNo(session, productNo);
        session.close();
        return result;
    }
}
