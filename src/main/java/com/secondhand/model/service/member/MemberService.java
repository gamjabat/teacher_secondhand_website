package com.secondhand.model.service.member;


import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.attachment.AttachmentDao;
import com.secondhand.model.dao.member.MemberDao;
import com.secondhand.model.dto.attachment.Attachment;
import com.secondhand.model.dto.member.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	private AttachmentDao attachmentDao = new AttachmentDao();
	
	//회원가입 보내기.
	public int signupMember(Member m) throws RuntimeException {
		SqlSession session = getSession();
		int result = dao.signupMember(session, m);
		if (result > 0)
			session.commit();
		else
			session.rollback();
		session.close();
		return result;
	}
	
	public int signupMemberWithAttachment(Member m, Attachment a) throws RuntimeException {
		SqlSession session = getSession();
		
		try {
	        String memberNo = dao.generateMemberNo(session);
	        m.setMemberNo(memberNo);

	        int result = dao.signupMemberWithAttachment(session, m);
	        if (result <= 0) {
	            session.rollback();
	            throw new RuntimeException("상품 등록 실패");
	        }

	        a.setAttachmentMemberNo(memberNo);
	        int attachResult = attachmentDao.uploadMemberImg(session, a);
	        if (attachResult <= 0) {
	            session.rollback();
	            throw new RuntimeException("이미지 등록 실패");
	        }

	        session.commit();
	        return result;

	    } catch (Exception e) {
	        session.rollback();
	        throw new RuntimeException("등록 중 오류 발생: " + e.getMessage());
	    } finally {
	        session.close();
	    }
	}
	
	//회원가입 아이디 중복체크를 위한 ID 찾기.
	public Member selectMemberById(String id) {
		SqlSession session = getSession();
		Member m = dao.selectMemberById(session, id);
		session.close();
		return m;
	}
	
	//회원가입시 닉네임, 핸드폰, 이메일 중복체크.
	public Map<String, Boolean> checkDuplicate(String nickname, String phone, String email) {
		SqlSession session = getSession();
        Map<String, Boolean> result = new HashMap<>();
        result.put("nicknameIsDuplicate", dao.isNicknameDuplicate(session, nickname));
        result.put("phoneIsDuplicate", dao.isPhoneDuplicate(session, phone));
        result.put("emailIsDuplicate", dao.isEmailDuplicate(session, email));
        session.close();
        return result;
	 }
	
	//로그인 id체크.
	public Member loginInvalidCheck(Member checkMember) {
		SqlSession session = getSession();
		Member invalidMember = dao.loginInvlidCheck(session,checkMember);
		return invalidMember;
	}
	
	//아이디 찾기
	public Member selectMemberToFindIdPwd(Map<String, String> param) {
		SqlSession session = getSession();
		Member m = dao.selectMemberToFindIdPwd(session, param);
		session.close();
		return m;
	}
	
	public int updateMemberInfo(Map<String, Object> param) {
	    SqlSession session = getSession();

	    try {
	        // 회원 정보 수정
	        int result = updateMemberData(session, param);

	        // 첨부 파일 처리
	        Attachment attachment = (Attachment) param.get("attachment");
	        if (attachment != null) {
	            upsertAttachment(session, attachment);
	        }

	        // 성공 시 커밋
	        session.commit();
	        return result;

	    } catch (Exception e) {
	        session.rollback();
	        throw new RuntimeException("수정 중 오류 발생: " + e.getMessage());
	    } finally {
	        session.close();
	    }
	}

	// 회원 정보 수정 메서드
	private int updateMemberData(SqlSession session, Map<String, Object> param) {
	    int result = dao.updateMemberInfo(session, param);
	    if (result <= 0) {
	        throw new RuntimeException("회원 정보 수정 실패");
	    }
	    return result;
	}

	// 첨부 파일 UPSERT 메서드
	private void upsertAttachment(SqlSession session, Attachment attachment) {
	    // 기존 첨부 파일 존재 여부 확인
	    Attachment existingAttachment = attachmentDao.selectAttachmentByMemberNo(session, attachment.getAttachmentMemberNo());

	    if (existingAttachment != null) {
	        // 기존 데이터가 있으면 업데이트
	        int updateResult = attachmentDao.updateAttachment(session, attachment);
	        if (updateResult <= 0) {
	            throw new RuntimeException("이미지 업데이트 실패");
	        }
	    } else {
	        // 기존 데이터가 없으면 삽입
	        int insertResult = attachmentDao.uploadMemberImg(session, attachment);
	        if (insertResult <= 0) {
	            throw new RuntimeException("이미지 삽입 실패");
	        }
	    }
	}
	
	//qnano으로 member 정보 가져오기.
	public Member getMemberByQnaNo(String qnaNo) {
	    SqlSession session = getSession();  // 세션 열기
	    Member m = dao.selectMemberByQnaNo(session, qnaNo);  // qnaNo를 기반으로 Member 조회
	    session.close();  // 세션 닫기
	    return m;  // 조회된 Member 반환
	}
	

	public Member getMemberByreportNo(String reportNo) {
	    SqlSession session = getSession();  // 세션 열기
	    Member m = dao.selectMemberByQnaNo(session, reportNo);  // qnaNo를 기반으로 Member 조회
	    session.close();  // 세션 닫기
	    return m;  // 조회된 Member 반환
	}

	public Map<String, Object> getSellerInfoByMemberNo(String memberNo) {
      SqlSession session = getSession();
      Map<String, Object> sellerInfo = dao.getSellerInfoByMemberNo(session, memberNo);
      session.close();
		return sellerInfo;   
  }
	
	public void deleteExistingProfileImage(String uploadPath, String existingImageName) {
	    if (existingImageName != null) {
	        File existingFile = new File(uploadPath, existingImageName);
	        if (existingFile.exists()) {
	            existingFile.delete();
	        }
	    }
	}
}
