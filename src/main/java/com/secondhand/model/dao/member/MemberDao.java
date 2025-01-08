package com.secondhand.model.dao.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dto.member.Member;

public class MemberDao {
	public String generateMemberNo(SqlSession session) {
        return session.selectOne("member.generateMemberNo");
    }
	
	public int signupMember(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMember" , m);
	}
	
	public int signupMemberWithAttachment(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMemberWithAttachment" , m);
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
    
    public Member selectMemberToFindIdPwd(SqlSession session, Map<String, String> param) {
		return session.selectOne("member.selectMemberToFindIdPwd", param);
	}
    public int updateMemberInfo(SqlSession session, Map<String, Object> param) {
		return session.update("member.updateMemberInfo", param);
	}
    //qnano으로 member 가져오기
    public Member selectMemberByQnaNo(SqlSession session, String qnaNo) {
        return session.selectOne("member.selectMemberByQnaNo", qnaNo);  // Mapper XML에서 SQL 실행
    }
    
    public Map<String, Object> getSellerInfoByMemberNo(SqlSession session, String memberNo) {
      return session.selectOne("member.getSellerInfoByMemberNo", memberNo);
  }
    
}
