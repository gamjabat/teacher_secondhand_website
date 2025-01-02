package com.secondhand.model.servicce.member;


import static com.secondhand.common.SqlSessionTemplate.getSession;


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
	
	
    public Member loginInvalidCheck(Member checkMember) {
		SqlSession session = getSession();
		Member invalidMember = dao.loginInvlidCheck(session,checkMember);
		return invalidMember;
	}
}
