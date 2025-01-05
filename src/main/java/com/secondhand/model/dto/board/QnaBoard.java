package com.secondhand.model.dto.board;

import java.sql.Timestamp;

import com.secondhand.model.dto.code.Code;
import com.secondhand.model.dto.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaBoard {
	
	 	private String qnaNo;          // QNA 번호
	    private String qnaTitle;       // 문의 제목
	    private String qnaContent;     // 문의 내용
	    private Timestamp createdAt; // 생성일
	    private Timestamp updatedAt; // 수정일
	    private Timestamp deletedAt; // 삭제일
	    private char isDeleted;      // 삭제 여부 (Y/N)
	    
	    
	    private String qnaMemberNo;    // 회원 번호
	    private String qnaTypeNo;      // 문의 타입 번호
	    
	    private Member member;
}
