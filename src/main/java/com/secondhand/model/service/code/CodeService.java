package com.secondhand.model.service.code;

import static com.secondhand.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.secondhand.model.dao.code.CodeDao;
import com.secondhand.model.dto.code.Code;

public class CodeService {
	private CodeDao dao = new CodeDao();
	
	//qnano으로 code 정보 가져오기.
//	public Code getCodeByQnaNo(String qnaNo) {
//	    SqlSession session = getSession();  // 세션 열기
//	    Code c = dao.getCodeByQnaNo(session, qnaNo);  // qnaNo를 기반으로 Member 조회
//	    session.close();  // 세션 닫기
//	    return c;  // 조회된 Member 반환
//	}
//	
}
