package com.secondhand.model.service.member;


import static com.secondhand.common.SqlSessionTemplate.getSession;

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
	
	//뉴 비밀번호
	public int updateMemberInfo(Map<String, Object> param) {
		SqlSession session = getSession();
		int result = dao.updateMemberInfo(session, param);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
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

}
