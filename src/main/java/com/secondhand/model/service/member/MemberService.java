package com.secondhand.model.service.member;


import static com.secondhand.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.member.MemberDao;
import com.secondhand.model.dto.member.Member;

public class MemberService {
private MemberDao dao = new MemberDao();
	
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

}
