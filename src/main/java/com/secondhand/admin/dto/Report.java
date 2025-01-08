package com.secondhand.admin.dto;

import java.time.LocalDateTime;

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
public class Report {
	
	 	private String reportNo; // 신고 번호
	    private String reportContent; // 신고 내용
	    private String reportResult; // 처리 결과
	    private LocalDateTime createdAt; // 생성 일시
	    private LocalDateTime updatedAt; // 업데이트 일시
	    private LocalDateTime deletedAt; // 삭제 일시
	    private char isDeleted; // 삭제 여부
	    
	    
	    private String reportStatusNo; // 신고 상태 코드
	    private String reportReasonCode; // 신고 사유 코드
	    private String reportMemberNo; // 신고자 ID
	    private String reportTransNo; // 신고된 거래 NO
	    private String reportProductNo; // 신고된 상품 NO
	    
	    private Member member;
	    
	    
	    private String reportStatusName; // 신고 상태 이름
	    private String reportReasonName; // 신고 유형 이름
}
