package com.secondhand.model.dao.member;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.member.Member;

public class MemberDao {
	public int signupMember(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMember" , m);
	}
	
	public Member selectMemberById(SqlSession session, String id) {
		return session.selectOne("member.selectMemberById", id);
	}
	
	public Member loginInvlidCheck(SqlSession session, Member checkMember) {
		return session.selectOne("member.loginInvlidCheck",checkMember);
	}
	
	public boolean isNicknameDuplicate(SqlSession session, String nickname) {
        return session.selectOne("member.isNicknameDuplicate", nickname) != null;
    }

    public boolean isPhoneDuplicate(SqlSession session, String phone) {
        return session.selectOne("member.isPhoneDuplicate", phone) != null;
    }

    public boolean isEmailDuplicate(SqlSession session, String email) {
        return session.selectOne("member.isEmailDuplicate", email) != null;
    }
}
