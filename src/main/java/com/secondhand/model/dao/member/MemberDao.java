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
	 return session.selectOne("member.selectMemberById", checkMember);
	}
}
